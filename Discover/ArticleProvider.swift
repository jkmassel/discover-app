import Combine
import DiscoverCore
import HTMLEntities

class ArticleProvider: ObservableObject {
    @Published var articles: [Article] = []
    @Published var error: Error? = nil
    @Published var isLoading: Bool = false

    private let remote = ArticleRemote()
    private var cancellable: AnyCancellable?

    func load() {

        self.isLoading = true

        cancellable = _load()
            .replaceError(with: [])
            .map {
                $0.map {

                    Article(id: $0.id, title: $0.title, content: $0.content.htmlUnescape(), image: $0.image, source: $0.source)
                }
            }
            .receive(on: DispatchQueue.main)
            .handleEvents(receiveCompletion: { _ in
                self.isLoading = false
            }, receiveCancel: {
                self.isLoading = false
            })
            .assign(to: \.articles, on: self)
    }

    func cancel() {
        cancellable?.cancel()
    }

    private func _load() -> Future<[Article], Error> {
        return Future() { promise in
            self.remote.getArticles { result in
                promise(result)
            }
        }
    }
}
