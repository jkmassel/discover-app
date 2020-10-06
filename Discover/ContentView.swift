import SwiftUI
import DiscoverCore
import SDWebImageSwiftUI

struct ArticleView: View {

    let article: Article

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            WebImage(url: article.image)
                .resizable()
                .indicator(.activity)
                .transition(.fade)
                .scaledToFill()
            Text(article.title)
                .font(Style.articleTitle)
                .lineLimit(4)
                .padding()
        }
    }
}

struct ContentView: View {
    @ObservedObject var provider = ArticleProvider()

    var body: some View {
        NavigationView {
            Group {
                if provider.isLoading {
                    ProgressView()
                }
                else {
                    if provider.articles.isEmpty {
                        Text("No Articles Found")
                            .font(.headline)
                    }
                    else {
                        ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/) {
                            LazyVStack {
                                ForEach(provider.articles) { article in
                                    NavigationLink(
                                        destination: WebView(article: article)
                                            .navigationBarTitle(article.title, displayMode: .inline)
                                        ,
                                        label: {
                                            ArticleView(article: article)
                                                .listRowInsets(EdgeInsets())

                                        }
                                    ).buttonStyle(PlainButtonStyle())
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Discover")
        }
        .onAppear { provider.load() }
        .onDisappear { provider.cancel() }
    }
}


struct ContentView_Previews: PreviewProvider {
    static let article = Article(id: "article", title: UUID().uuidString, content: UUID().uuidString, image: URL(string: "https://google.com")!, source: URL(string: "https://google.com")!)

    static var previews: some View {
        ArticleView(article: article)
            .frame(width: 400.0)
            .previewLayout(.sizeThatFits)
    }
}
