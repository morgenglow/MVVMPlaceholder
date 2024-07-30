import SwiftUI
import Firebase

struct ItemListView: View {
    @ObservedObject var viewModel = ItemListViewModel()

    var body: some View {

        NavigationView {
            VStack{
                if viewModel.isLoading {
                    ProgressView("Loading...")
                }
                else if let error =  viewModel.errorMessage { Text(error)} else {
                    List(viewModel.users) { user in
                        NavigationLink(destination: ItemDetailsView(object: user)){
                            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, content: {
                                Text(user.name)
                            })
                        }.navigationTitle("User List")
                            .onSubmit {
                                Analytics.logEvent(AnalyticsEventScreenView,
                                                   parameters: [AnalyticsParameterScreenName: "\(ItemListView.self)"])
                            }
                    }
                }
            }
            .onAppear(perform: {
                viewModel.fetchUsers()
            })
            .onAppear(){
                Analytics.logEvent(AnalyticsEventScreenView,
                                   parameters: [AnalyticsParameterScreenName: "\(ItemListView.self)",
                                               AnalyticsParameterScreenClass: "\(ItemListView.self)"])
            }
        }
    }
}
