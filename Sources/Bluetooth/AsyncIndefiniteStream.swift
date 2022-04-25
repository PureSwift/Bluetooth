//
//  AsyncIndefiniteStream.swift
//
//
//  Created by Alsey Coleman Miller on 4/12/22.
//

import Foundation

/// Async Stream that will produce values until `stop()` is called or task is cancelled.
public struct AsyncIndefiniteStream <Element>: AsyncSequence {
    
    let storage: Storage
    
    public init(
        bufferSize: Int = 100,
        _ build: @escaping ((Element) -> ()) async throws -> ()
    ) {
        let storage = Storage()
        let stream = AsyncThrowingStream<Element, Error>(Element.self, bufferingPolicy: .bufferingNewest(bufferSize)) { continuation in
            let task = Task {
                do {
                    try await build({ continuation.yield($0) })
                }
                catch _ as CancellationError { } // end
                catch {
                    continuation.finish(throwing: error)
                }
            }
            storage.continuation = continuation
            #if swift(>=5.6)
            continuation.onTermination = { [weak storage] in
                switch $0 {
                case .cancelled:
                    storage?.stop()
                default:
                    break
                }
            }
            #endif
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
            #if swift(>=5.6)
            continuation.onTermination = { [weak storage] in
                switch $0 {
                case .cancelled:
                    storage?.stop()
                default:
                    break
                }
            }
            #endif
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

public extension AsyncIndefiniteStream {
    
    struct Continuation {
        
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

internal extension AsyncIndefiniteStream {
    
    final class Storage {
        
        var isExecuting: Bool {
            get {
                lock.lock()
                let value = _isExecuting
                lock.unlock()
                return value
            }
        }
        
        private var _isExecuting = true
        
        let lock = NSLock()
        
        var stream: AsyncThrowingStream<Element, Error>!
        
        var continuation: AsyncThrowingStream<Element, Error>.Continuation!
        
        var onTermination: (() -> ())!
        
        deinit {
            stop()
        }
        
        init() { }
        
        func stop() {
            // end stream
            continuation.finish()
            // cleanup
            lock.lock()
            defer { lock.unlock() }
            guard _isExecuting else { return }
            _isExecuting = false
            // cleanup / stop scanning / cancel child task
            onTermination()
        }
        
        func makeAsyncIterator() -> AsyncIterator {
            return AsyncIterator(stream.makeAsyncIterator())
        }
    }
}
