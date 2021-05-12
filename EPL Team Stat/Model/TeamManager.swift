//
//  TeamManager.swift
//  EPL Team Stat
//
//  Created by Jeongho Han on 2021-05-11.
//

import Foundation

class TeamManager{

    static let shared = TeamManager()
    
    var teams: [Team] = []
    
    // Fetch data from teams.json
    func fetchData(){
        guard let fileURL = Bundle.main.url(forResource: "teams", withExtension: "json") else {
            print("Couldn't find the file")
            return
        }
        
        do {
            let content = try Data(contentsOf: fileURL)
            let decoder = JSONDecoder()
            let res = try decoder.decode(Teams.self, from: content)
            
            // Set teams sorted
            self.teams = res.teams
            
        } catch let error {
            print(error)
            return
        }
    }
    
    func sortByStanding(){
        teams = teams.sorted { prev, next in
            prev.standing < next.standing
        }
    }
    
    func sortByName(){
        teams = teams.sorted { prev, next in
            prev.name < next.name
        }
    }
    
    func getTeamByIndex(at index: Int) -> Team{
        return teams[index]
    }
}
