//
//  TwitterUser.swift
//  Twitters
//
//  Created by Rivaldo Fernandes on 03/02/23.
//

import Foundation
import Firebase

struct TwitterUser: Codable {
    let id: String
    var displayName: String = ""
    var username: String = ""
    var followersCount: Double = 0
    var followingCount: Double = 0
    var createdOn: Date = Date()
    var bio: String = ""
    var avatarPath: String = ""
    var isUserOnboarded: Bool = false
    
    
    init(from user: User){
        self.id = user.uid
    }
}
