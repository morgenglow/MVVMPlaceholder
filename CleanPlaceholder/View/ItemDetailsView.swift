import Firebase
import SwiftUI

struct ItemDetailsView: View {

    var object: ItemModel

    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                Text("Username")
                    .fontWeight(.bold)
                    .padding(3)
                    .frame(width: 100, alignment: .leading)
                Text(object.username)
                    .padding(3)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .onAppear() {
                Analytics.logEvent(AnalyticsEventScreenView,
                                   parameters: [AnalyticsEventViewItem: "\(object.username)"])
            }
            HStack(alignment: .top) {
                Text("ID")
                    .fontWeight(.bold)
                    .padding(3)
                    .frame(width: 100, alignment: .leading)
                Text(String(object.id))
                    .padding(3)
                    .frame(maxWidth: .infinity,alignment: .leading)
            }
            .onAppear() {
                Analytics.logEvent(AnalyticsEventScreenView,
                                   parameters: [AnalyticsEventViewItem: "\(object.id)"])
            }
            HStack(alignment: .top) {
                Text("Email")
                    .fontWeight(.bold)
                    .padding(3)
                    .frame(width: 100, alignment: .leading)
                Text(object.email)
                    .padding(3)
                    .frame(maxWidth: .infinity,alignment: .leading)
            }
            .onAppear() {
                Analytics.logEvent(AnalyticsEventScreenView,
                                   parameters: [AnalyticsEventViewItem: "\(object.email)"])
            }
            HStack(alignment: .top) {
                Text("Address")
                    .fontWeight(.bold)
                    .padding(3)
                    .frame(width: 100, alignment: .leading)
                Text(object.address!.street + object.address!.suite + object.address!.city + object.address!.zipcode + object.address!.geo!.lat + object.address!.geo!.lng)
                    .padding(3)
                    .frame(maxWidth: .infinity,alignment: .leading)
            }
            .onAppear() {
                Analytics.logEvent(AnalyticsEventScreenView,
                                   parameters: [AnalyticsEventViewItem: "\(object.address.debugDescription)"])
            }
            HStack(alignment: .top) {
                Text("Phone")
                    .fontWeight(.bold)
                    .padding(3)
                    .frame(width: 100, alignment: .leading)
                Text(object.phone)
                    .padding(3)
                    .frame(maxWidth: .infinity,alignment: .leading)
            }
            .onAppear() {
                Analytics.logEvent(AnalyticsEventScreenView,
                                   parameters: [AnalyticsEventViewItem: "\(object.phone)"])
            }
            HStack(alignment: .top) {
                Text("Website")
                    .fontWeight(.bold)
                    .padding(3)
                    .frame(width: 100, alignment: .leading)
                Text(object.website)
                    .padding(3)
                    .frame(maxWidth: .infinity,alignment: .leading)
            }
            .onAppear() {
                Analytics.logEvent(AnalyticsEventScreenView,
                                   parameters: [AnalyticsEventViewItem: "\(object.website)"])
            }
            Spacer()
        }
        .padding()
        .navigationTitle(object.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
