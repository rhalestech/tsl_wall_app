//
//  ListView.swift
//  tsl_wall_app
//
//  Created by Ruben Hales on 9/23/23.
//

import SwiftUI
import FirebaseAuth

struct ListView: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var showPopup = false
    
    var body: some View {
        NavigationView {
            List(dataManager.posts, id: \.id) { post in
                Text(post.breed)
            }
            .navigationTitle("Posts")
            .navigationBarItems(
                leading: Button(action: logout) {
                    Text("Logout")
                },
                trailing: Button(action: {
                    showPopup.toggle()
                }, label: {
                    Image(systemName: "plus")
                })
            )
            .sheet(isPresented: $showPopup) {
                NewPostView()
            }
        }
        .onAppear {
            dataManager.fetchPosts()
        }
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("Error signing out: \(error)")
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView().environmentObject(DataManager())
    }
}
