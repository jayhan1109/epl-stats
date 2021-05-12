//
//  Team.swift
//  EPL Team Stat
//
//  Created by Jeongho Han on 2021-05-11.
//

import Foundation

struct Teams: Codable{
    var teams: [Team]
}

struct Team: Codable{
    var name: String
    var image: String
    var standing: Int
    var stadium: String
    var stat: Stat
}

struct Stat: Codable{
    var matches: Int
    var wins: Int
    var loses: Int
    var goals: Int
}
