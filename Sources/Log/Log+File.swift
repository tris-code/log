/*
 * Copyright 2017 Tris Foundation and the project authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License
 *
 * See LICENSE.txt in the project root for license information
 * See CONTRIBUTORS.txt for the list of the project authors
 */

import class Foundation.FileManager
import class Foundation.FileHandle

extension Log {
    public static func writeToFile(atPath path: String) {
        if !FileManager.default.fileExists(atPath: path) {
            guard FileManager.default.createFile(
                atPath: path, contents: nil) else {
                    fatalError("can't create log file at \(path)")
            }
        }
        delegate = { message in
            guard let log = FileHandle(forUpdatingAtPath: path),
                let data = message.appending("\n").data(using: .utf8) else {
                    return
            }
            log.seekToEndOfFile()
            log.write(data)
            log.closeFile()
        }
    }
}
