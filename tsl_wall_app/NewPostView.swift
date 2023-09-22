//
//  NewPostView.swift
//  tsl_wall_app
//
//  Created by Ruben Hales on 9/25/23.
//

import SwiftUI

struct NewPostView: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var newPost = ""
    
    var body: some View {
        VStack {
            TextField("Post", text: $newPost)
            
            Button {
                dataManager.addPost(postBreed: newPost)
            } label:  {
                Text("Save")
            }
        }
        .padding()
    }
}
struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView().environmentObject(DataManager())
    }
}
