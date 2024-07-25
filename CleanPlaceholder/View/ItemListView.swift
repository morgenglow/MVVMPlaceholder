import SwiftUI

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
                    }
                }
            }
            .onAppear(perform: {
                viewModel.fetchUsers()
            })
        }
    }
}
