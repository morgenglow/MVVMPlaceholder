struct Geo: Codable {
    let lat : String
    let lng : String

    init(lat: String, lng: String) {
        self.lat = lat
        self.lng = lng
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.lat = try container.decode(String.self, forKey: .lat)
        self.lng = try container.decode(String.self, forKey: .lng)
    }
}
