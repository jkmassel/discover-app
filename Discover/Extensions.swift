import Foundation
import SwiftUI
import DiscoverCore
import CryptoKit

extension Article: Identifiable { }

extension CGSize {
    func scaledToWidth(width newWidth: CGFloat) -> CGSize {
        let ratio = width / newWidth
        return CGSize(width: width / ratio, height: height / ratio)
    }
}

extension UIImage {
    var scaledSize: CGSize {
        return CGSize(width: size.width * scale, height: size.height * scale)
    }
}

extension String {
    var sha256: String {
        let data = self.data(using: .utf8)!
        let hash = SHA256.hash(data: data)
        return hash.compactMap { String(format: "%02x", $0) }.joined()
    }
}

