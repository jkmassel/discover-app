import SwiftUI

@main
struct DiscoverApp: App {

    init() {
        // setupStyles()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }

    func setupStyles() {
        let descriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: .largeTitle).withDesign(.serif)!.withSymbolicTraits(.traitBold)!
        UINavigationBar.appearance().largeTitleTextAttributes = [.font: UIFont(descriptor: descriptor, size: 48) ]

        UINavigationBar.appearance().titleTextAttributes = [.font: UIFont(descriptor: descriptor, size: 24)]
    }
}

struct Style {
    static let heading = Font.system(.largeTitle, design: .serif)
    static let articleTitle = Font.system(.title, design: .default)
//    static let articleTitle = Font.system(.title, design: .serif)
}
