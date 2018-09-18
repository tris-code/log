/******************************************************************************
 *                                                                            *
 * Tris Foundation disclaims copyright to this source code.                   *
 * In place of a legal notice, here is a blessing:                            *
 *                                                                            *
 *     May you do good and not evil.                                          *
 *     May you find forgiveness for yourself and forgive others.              *
 *     May you share freely, never taking more than you give.                 *
 *                                                                            *
 ******************************************************************************/

extension Log {
    public struct Terminal: LogProtocol {
        public static var shared: Terminal = {
            return Terminal()
        }()

        public var format: ((Message) -> String) = { message in
            return "[\(message.level)] \(message.payload)"
        }

        public func handle(_ message: Message) {
            print(format(message))
        }
    }
}
