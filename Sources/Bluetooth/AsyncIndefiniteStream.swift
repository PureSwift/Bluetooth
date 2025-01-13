//
//  AsyncIndefiniteStream.swift
//
//
//  Created by Alsey Coleman Miller on 4/12/22.
//

#if canImport(Foundation)
import Foundation

/// Async Stream that will produce values until `stop()` is called or task is cancelled.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public struct AsyncIndefiniteStream<Element: Sendable>: AsyncSequence, Sendable {

    let storage: Storage

    public init(
        bufferSize: Int = 100,
        _ build: @escaping @Sendable ((Element) -> ()) async throws -> ()
    ) {
        let storage = Storage()
        let stream = AsyncThrowingStream<Element, Error>(Element.self, bufferingPolicy: .bufferingNewest(bufferSize)) { continuation in
            let task = Task {
                do {
                    try await build({ continuation.yield($0) })
                } catch _ as CancellationError {}  // end
                catch {
                    continuation.finish(throwing: error)
                }
            }
            storage.continuation = continuation
            continuation.onTermination = {
                switch $0 {
                case .cancelled:
                    storage.stop()
                default:
                    break
                }
            }
            storage.onTermination = {
                // cancel task when `stop` is called
                task.cancel()
            }
        }
        storage.stream = stream
        self.storage = storage
    }

    public init(
        bufferSize: Int = 100,
        onTermination: @escaping () -> (),
        _ build: (Continuation) -> ()
    ) {
        let storage = Storage()
        storage.onTermination = onTermination
        let stream = AsyncThrowingStream<Element, Error>(Element.self, bufferingPolicy: .bufferingNewest(bufferSize)) { continuation in
            storage.continuation = continuation
            continuation.onTermination = { [weak storage] in
                switch $0 {
                case .cancelled:
                    storage?.stop()
                default:
                    break
                }
            }
            build(Continuation(continuation))
        }
        storage.stream = stream
        self.storage = storage
    }

    public func makeAsyncIterator() -> AsyncIterator {
        return storage.makeAsyncIterator()
    }

    public func stop() {
        storage.stop()
    }

    public var isExecuting: Bool {
        storage.isExecuting
    }
}

@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public extension AsyncIndefiniteStream {

    struct AsyncIterator: AsyncIteratorProtocol {

        private(set) var iterator: AsyncThrowingStream<Element, Error>.AsyncIterator

        init(_ iterator: AsyncThrowingStream<Element, Error>.AsyncIterator) {
            self.iterator = iterator
        }

        @inline(__always)
        public mutating func next() async throws -> Element? {
            return try await iterator.next()
        }
    }
}

@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public extension AsyncIndefiniteStream {

    struct Continuation: Sendable {

        let continuation: AsyncThrowingStream<Element, Error>.Continuation

        init(_ continuation: AsyncThrowingStream<Element, Error>.Continuation) {
            self.continuation = continuation
        }

        public func yield(_ value: Element) {
            continuation.yield(value)
        }

        public func finish(throwing error: Error) {
            continuation.finish(throwing: error)
        }
    }
}

@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
internal extension AsyncIndefiniteStream {

    final class Storage: @unchecked Sendable {

        var isExecuting: Bool {
            get {
                lock.lock()
                let value = _isExecuting
                lock.unlock()
                return value
            }
            set {
                lock.lock()
                _isExecuting = newValue
                lock.unlock()
            }
        }

        var _isExecuting = true

        let lock = NSLock()

        var stream: AsyncThrowingStream<Element, Error>!

        var continuation: AsyncThrowingStream<Element, Error>.Continuation!

        var onTermination: (() -> ())!

        deinit {
            stop()
        }

        init() {}

        func stop() {
            // end stream
            continuation.finish()
            // cleanup
            guard isExecuting else {
                return
            }
            // cleanup / stop scanning / cancel child task
            onTermination()
        }

        func makeAsyncIterator() -> AsyncIterator {
            return AsyncIterator(stream.makeAsyncIterator())
        }
    }
}
#endif
