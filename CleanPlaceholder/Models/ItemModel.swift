import Foundation

struct ItemModel: Codable,Identifiable {
    let temp = UUID()
    let id: Int
    let name: String
    let username: String
    let email: String
    let phone: String
    let website: String
    let address : Address?
    let company: Company?


    init(id: Int, name: String, username: String, email: String, phone: String, website: String, address: Address?, company: Company?) {
        self.id = id
        self.name = name
        self.username = username
        self.email = email
        self.phone = phone
        self.website = website
        self.address = address
        self.company = company
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.username = try container.decode(String.self, forKey: .username)
        self.email = try container.decode(String.self, forKey: .email)
        self.phone = try container.decode(String.self, forKey: .phone)
        self.website = try container.decode(String.self, forKey: .website)
        self.address = try container.decodeIfPresent(Address.self, forKey: .address)
        self.company = try container.decodeIfPresent(Company.self, forKey: .company)
    }







}
