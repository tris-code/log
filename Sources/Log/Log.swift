/*
 * Copyright 2017 Tris Foundation and the project authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License
 *
 * See LICENSE.txt in the project root for license information
 * See CONTRIBUTORS.txt for the list of the project authors
 */

public enum Level: String {
    case debug, info, warning, error, critical
}

public struct Log {
    public static var disabled: Bool = false
    public static var delegate: ((String) -> Void) = { message in
        print(message)
    }

    public static var format: ((Level, String) -> String) = { level, message in
        return "[\(level)] \(message)"
    }

    @_versioned
    static func handle(event level: Level, message: @autoclosure () -> String) {
        if !disabled {
            delegate(format(level, message()))
        }
    }

    // suppress warning
    @_versioned static var isDebugBuild: Bool {
        @inline(__always) get {
            return _isDebugAssertConfiguration()
        }
    }

    @inline(__always)
    public static func debug(_ message: @autoclosure () -> String) {
        if isDebugBuild {
            handle(event: .debug, message: message())
        }
    }

    public static func info(_ message: @autoclosure () -> String) {
        handle(event: .info, message: message)
    }

    public static func warning(_ message: @autoclosure () -> String) {
        handle(event: .warning, message: message)
    }

    public static func error(_ message: @autoclosure () -> String) {
        handle(event: .error, message: message)
    }

    public static func critical(_ message: @autoclosure () -> String) {
        handle(event: .critical, message: message)
    }
}
