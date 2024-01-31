//
//  Followers.swift
//  GHFollowers
//
//  Created by Kirill Gusev on 24.09.2023.
//

import Foundation

struct Follower: Codable, Hashable {
    let login: String
    let avatarUrl: String
}

