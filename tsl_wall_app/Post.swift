//
//  Post.swift
//  tsl_wall_app
//
//  Created by Ruben Hales on 9/23/23.
//

import SwiftUI
import FirebaseFirestoreSwift

struct Post: Identifiable, Codable {
    @DocumentID var id: String?
    var breed: String
    var postId: Int?
}
