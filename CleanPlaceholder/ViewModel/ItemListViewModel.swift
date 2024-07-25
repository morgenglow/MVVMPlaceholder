import Combine
import Foundation

class ItemListViewModel: ObservableObject {

    @Published var users = [ItemModel]();
    @Published var isLoading = false
    @Published var errorMessage: String?

    private var cancellables = Set<AnyCancellable>()

    func fetchUsers() {
        isLoading = true
        errorMessage = nil

        let url = URL(string: Endpoints.users.url)!

        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [ItemModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                case .finished:
                    break
                }
                self.isLoading = false
            }, receiveValue: { item in
                self.users = item
            })
            .store(in: &self.cancellables)
    }
}
