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
    public static var delegate: ((Level, String) -> Void) = { print("[\($0)] \($1)") }

    static func handle(event level: Level, message: String) {
        if !disabled {
            delegate(level, message)
        }
    }

    public static func debug(_ message: String) {
        handle(event: .debug, message: message)
    }

    public static func info(_ message: String) {
        handle(event: .info, message: message)
    }

    public static func warning(_ message: String) {
        handle(event: .warning, message: message)
    }

    public static func error(_ message: String) {
        handle(event: .error, message: message)
    }

    public static func critical(_ message: String) {
        handle(event: .critical, message: message)
    }
}
