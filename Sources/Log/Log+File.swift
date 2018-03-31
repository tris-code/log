/*
 * Copyright 2017 Tris Foundation and the project authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License
 *
 * See LICENSE.txt in the project root for license information
 * See CONTRIBUTORS.txt for the list of the project authors
 */

import File

extension Log {
    public static func writeToFile(atPath path: String) throws {
        try writeToFile(at: Path(string: path))
    }

    public static func writeToFile(at path: Path) throws {
        let file = try File(path: path)
        try write(to: file)
    }

    public static func write(to file: File) throws {
        if !file.isExists {
            try file.create(withIntermediateDirectories: true)
        }
        let stream = try file.open(flags: .write)
        try stream.seek(to: .end)
        delegate = { message in
            do {
                try stream.write(message)
                try stream.write("\n")
                try stream.flush()
            } catch {
                print("can't write log message:", message)
            }
        }
    }
}
