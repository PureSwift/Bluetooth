//
//  AsyncIndefiniteStream.swift
//
//
//  Created by Alsey Coleman Miller on 4/12/22.
//

/// Async Stream that will produce values until `stop()` is called.
public struct AsyncIndefiniteStream <Element>: AsyncSequence {
    
    let storage: Storage
    
    public init(
        bufferSize: Int = 100,
        unfolding produce: @escaping () async throws -> Element
    ) {
        let storage = Storage()
        let stream = AsyncThrowingStream<Element, Error>(Element.self, bufferingPolicy: .bufferingNewest(bufferSize)) { continuation in
            let task = Task {
                do {
                    while Task.isCancelled == false {
                        let value = try await produce()
                        continuation.yield(value)
                    }
                }
                catch _ as CancellationError { } // end
                catch {
                    continuation.finish(throwing: error)
                }
                continuation.finish()
            }
            storage.task = task
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
}

public extension AsyncIndefiniteStream {
    
    struct AsyncIterator: AsyncIteratorProtocol {
                
        private(set) var iterator: AsyncThrowingStream<Element, Error>.AsyncIterator
        
        init(_ iterator: AsyncThrowingStream<Element, Error>.AsyncIterator) {
            self.iterator = iterator
        }
        
        public mutating func next() async throws -> Element? {
            return try await iterator.next()
        }
    }
}

public extension AsyncIndefiniteStream {
    
    struct Continuation {
        
        let continuation: AsyncThrowingStream<Element, Error>.Continuation
        
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
                
        var stream: AsyncThrowingStream<Element, Error>!
                
        var task: Task<(), Never>!
        
        init() { }
        
        func stop() {
            assert(task != nil)
            assert(task.isCancelled == false)
            task?.cancel()
        }
        
        func makeAsyncIterator() -> AsyncIterator {
            return AsyncIterator(stream.makeAsyncIterator())
        }
    }
}
