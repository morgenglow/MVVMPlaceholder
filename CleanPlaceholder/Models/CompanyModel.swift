struct Company: Codable {
    let name: String
    let catchPhrase: String
    let bs: String

    init(name: String, catchPhrase: String, bs: String) {
        self.name = name
        self.catchPhrase = catchPhrase
        self.bs = bs
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.catchPhrase = try container.decode(String.self, forKey: .catchPhrase)
        self.bs = try container.decode(String.self, forKey: .bs)
    }
}
