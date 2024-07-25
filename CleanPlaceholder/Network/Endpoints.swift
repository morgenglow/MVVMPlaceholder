enum Endpoints: String {
    case albums
    case posts
    case todos
    case photos
    case users

    var url: String {
        switch self {
        case .albums:
            return "\(NetworkManager.shared().baseURL)/albums"
        case .posts:
            return "\(NetworkManager.shared().baseURL)/posts"
        case .todos:
            return "\(NetworkManager.shared().baseURL)/todos"
        case .photos:
            return "\(NetworkManager.shared().baseURL)/photos"
        case .users:
            return "\(NetworkManager.shared().baseURL)/users"
        }
    }
}
