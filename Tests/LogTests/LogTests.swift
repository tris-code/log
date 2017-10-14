/*
 * Copyright 2017 Tris Foundation and the project authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License
 *
 * See LICENSE.txt in the project root for license information
 * See CONTRIBUTORS.txt for the list of the project authors
 */

import Test
import Dispatch
import Foundation
@testable import Log

class LogTests: TestCase {
    var enabled: Bool! = nil
    var level: Log.Level! = nil
    var format: ((Log.Level, String) -> String)! = nil
    var delegate: ((String) -> Void)! = nil

    override func setUp() {
        enabled = Log.enabled
        level = Log.level
        format = Log.format
        delegate = Log.delegate
    }

    override func tearDown() {
        Log.enabled = enabled
        Log.level = level
        Log.format = format
        Log.delegate = delegate
    }

    func testLog() {
        var global: String? = nil

        Log.delegate = { message in
            global = message
        }

        Log.debug("log")
        assertEqual(global, "[debug] log")

        Log.info("log")
        assertEqual(global, "[info] log")

        Log.warning("log")
        assertEqual(global, "[warning] log")

        Log.error("log")
        assertEqual(global, "[error] log")
        
        Log.critical("log")
        assertEqual(global, "[critical] log")
    }

    func testFormat() {
        var global: String? = nil

        Log.delegate = { message in
            global = message
        }

        Log.format = { level, message in
            return "level: \(level), message: \(message)"
        }

        Log.debug("log")
        assertEqual(global, "level: debug, message: log")
    }

    func testEnabled() {
        var global: String? = nil

        assertTrue(Log.enabled)
        Log.enabled = false
        assertFalse(Log.enabled)

        Log.delegate = { message in
            global = message
        }

        Log.debug("log")
        assertEqual(global, nil)
    }

    func testLevel() {
        var global: String? = nil

        Log.delegate = { message in
            global = message
        }

        Log.debug("log")
        assertEqual(global, "[debug] log")
        global = nil

        Log.level = .info
        Log.debug("log")
        assertEqual(global, nil)

        Log.info("log")
        assertEqual(global, "[info] log")
        global = nil

        Log.level = .warning
        Log.debug("log")
        assertEqual(global, nil)

        Log.warning("log")
        assertEqual(global, "[warning] log")
        global = nil

        Log.level = .error
        Log.debug("log")
        assertEqual(global, nil)

        Log.error("log")
        assertEqual(global, "[error] log")
        global = nil

        Log.level = .critical
        Log.debug("log")
        assertEqual(global, nil)

        Log.critical("log")
        assertEqual(global, "[critical] log")
    }


    static var allTests = [
        ("testLog", testLog),
        ("testFormat", testFormat),
        ("testEnabled", testEnabled),
        ("testLevel", testLevel),
    ]
}
