import XCTest

extension LogTests {
    static let __allTests = [
        ("testEnabled", testEnabled),
        ("testFormat", testFormat),
        ("testLevel", testLevel),
        ("testLog", testLog),
    ]
}

#if !os(macOS)
public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(LogTests.__allTests),
    ]
}
#endif