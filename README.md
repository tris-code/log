# Log

Simple log module.

## Package.swift

```swift
.package(url: "https://github.com/tris-code/log.git", .branch("master"))
```

## Memo

```swift
public enum Level: String {
    case debug, info, warning, error, critical
}

func log(event: Level, message: String)

struct Log {
    static var disabled: Bool = false
    static var delegate: ((Level, String) -> Void)

    static func debug(_ message: String)
    static func info(_ message: String)
    static func warning(_ message: String)
    static func error(_ message: String)
    static func critical(_ message: String)
}
```

## Usage

```swift
// Option 0
log(event: .warning, message: "message")

// Option 1
Log.info("message")

// Overwrite delegate
Log.delegate = { level, message in
    if level != .debug {
        print("[\(level)] \(message)")
    }
}

// Disable logging
Log.disabled = true
```
