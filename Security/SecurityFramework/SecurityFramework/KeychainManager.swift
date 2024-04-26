import Foundation

final class KeychainManager {
    enum KeychainError: Error {
        case duplicatedEntry
        case unknown(OSStatus)
    }

    static func save(service: String, account: String, password: Data) throws {
        let query: [String: AnyObject] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service as AnyObject,
            kSecAttrAccount as String: account as AnyObject,
            kSecValueData as String: password as AnyObject,
        ]
        let status = SecItemAdd(query as CFDictionary, nil)

        guard status != errSecDuplicateItem else {
            throw KeychainError.duplicatedEntry
        }

        guard status == errSecSuccess else {
            throw KeychainError.unknown(status)
        }
        print("Saved")
    }

    static func get() throws {

    }
}
