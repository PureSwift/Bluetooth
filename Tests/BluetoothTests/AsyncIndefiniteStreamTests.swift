//
//  AsyncIndefiniteStreamTests.swift
//  Bluetooth
//
//  Exercises AsyncIndefiniteStream: value delivery, stop(), error propagation,
//  and the continuation-based initializer.
//

#if !hasFeature(Embedded)
import Testing
import Foundation
@testable import Bluetooth

@Suite struct AsyncIndefiniteStreamTests {

    struct StreamError: Error, Equatable {}

    /// The build-closure initializer yields values that the iterator receives,
    /// and stop() cancels the producing task (its sleep throws CancellationError).
    @Test func buildClosureYieldsThenStops() async throws {
        let stream = AsyncIndefiniteStream<Int>(bufferSize: 10) { yield in
            yield(10)
            yield(20)
            yield(30)
            // Stay alive until cancelled by stop().
            try await Task.sleep(nanoseconds: 10_000_000_000)
        }

        var iterator = stream.makeAsyncIterator()
        var received = [Int]()
        received.append(try #require(try await iterator.next()))
        received.append(try #require(try await iterator.next()))
        received.append(try #require(try await iterator.next()))
        #expect(received == [10, 20, 30])

        stream.stop()
        let afterStop = try await iterator.next()
        #expect(afterStop == nil)
    }

    /// An error thrown from the build closure finishes the stream with that error.
    @Test func buildClosureThrowsPropagates() async throws {
        let stream = AsyncIndefiniteStream<Int> { yield in
            yield(1)
            throw StreamError()
        }
        var iterator = stream.makeAsyncIterator()
        #expect(try await iterator.next() == 1)
        await #expect(throws: StreamError.self) {
            _ = try await iterator.next()
        }
    }

    /// The continuation-based initializer: values yielded through the
    /// Continuation are received, stop() ends the stream and fires onTermination.
    @Test func continuationYieldAndStop() async throws {
        actor Flag {
            var terminated = false
            func set() { terminated = true }
            func get() -> Bool { terminated }
        }
        let flag = Flag()

        final class Box: @unchecked Sendable {
            var continuation: AsyncIndefiniteStream<Int>.Continuation?
        }
        let box = Box()

        let stream = AsyncIndefiniteStream<Int>(
            onTermination: { Task { await flag.set() } }
        ) { continuation in
            box.continuation = continuation
        }

        let continuation = try #require(box.continuation)
        continuation.yield(1)
        continuation.yield(2)

        var iterator = stream.makeAsyncIterator()
        #expect(try await iterator.next() == 1)
        #expect(try await iterator.next() == 2)

        stream.stop()
        #expect(try await iterator.next() == nil)

        // onTermination runs asynchronously; give it a moment.
        try await Task.sleep(nanoseconds: 10_000_000)
        await #expect(flag.get())
    }

    /// The Continuation can finish the stream with an error.
    @Test func continuationFinishThrowing() async throws {
        final class Box: @unchecked Sendable {
            var continuation: AsyncIndefiniteStream<Int>.Continuation?
        }
        let box = Box()
        let stream = AsyncIndefiniteStream<Int>(onTermination: { }) { continuation in
            box.continuation = continuation
        }
        let continuation = try #require(box.continuation)
        continuation.yield(42)
        continuation.finish(throwing: StreamError())

        var iterator = stream.makeAsyncIterator()
        #expect(try await iterator.next() == 42)
        await #expect(throws: StreamError.self) {
            _ = try await iterator.next()
        }
    }
}
#endif
