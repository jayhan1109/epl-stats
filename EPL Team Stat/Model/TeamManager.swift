//
//  TeamManager.swift
//  EPL Team Stat
//
//  Created by Jeongho Han on 2021-05-11.
//

import Foundation

class TeamManager{

    // Create TeamManager instance as singleton
    static let shared = TeamManager()
    
    private init() {}
    
    // Variable to store teams
    var teams: [Team] = []
    
    // Fetch data from teams.json
    func fetchData(){
        
        // Check if the file exists or return the function
        guard let fileURL = Bundle.main.url(forResource: "teams", withExtension: "json") else {
            print("Couldn't find the file")
            return
        }
        
        // Parse and decode the data in the file and store into teams array
        do {
            let content = try Data(contentsOf: fileURL)
            let decoder = JSONDecoder()
            let result = try decoder.decode(Teams.self, from: content)
            
            self.teams = result.teams
            
        } catch let error {
            print(error)
            return
        }
    }
    
    // Sort teams by standing
    func sortByStanding(){
        teams = teams.sorted { prev, next in
            prev.standing < next.standing
        }
    }
    
    // Sort teams by name
    func sortByName(){
        teams = teams.sorted { prev, next in
            prev.name < next.name
        }
    }
    
    // Get a team at given index
    func getTeamByIndex(at index: Int) -> Team {
        return teams[index]
    }
}
