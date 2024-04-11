//
//  Task+Extensions.swift
//  SwiftUIAsyncAppInit
//
//  Created by Viacheslav Tkachenko on 11.04.2024.
//

import Foundation

extension Task where Success == Never, Failure == Never {
    public static func sleep(interval: Double) async {
        try? await sleep(nanoseconds: UInt64(interval * 1e9))
    }
}

// the solution was found here:
// https://stackoverflow.com/a/77300959/1852661
extension Task where Failure == Error {
    /// Performs an async task in a sync context.
    ///
    /// - Note: This function blocks the thread until the given operation is finished. The caller is responsible for managing multithreading.
    static func synchronous(priority: TaskPriority? = nil, operation: @escaping @Sendable () async throws -> Success) {
        let semaphore = DispatchSemaphore(value: 0)
        
        Task(priority: priority) {
            defer { semaphore.signal() }
            return try await operation()
        }
        
        semaphore.wait()
    }
}

