//
//  Tweet.swift
//  Twitters
//
//  Created by Rivaldo Fernandes on 04/02/23.
//

import Foundation


struct Tweet: Codable {
    let id: String
    let author: TwitterUser
    let tweetContent: String
    var likesCount: Int
    var likers: [String]
    let isReply: Bool
    
}