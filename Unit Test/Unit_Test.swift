//
//  Unit_Test.swift
//  Unit Test
//
//  Created by Jeongho Han on 2021-07-11.
//

import XCTest

class Unit_Test: XCTestCase {
    
    var teams : [Team] = []

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        
        // Check if the file exists or return the function
        guard let fileURL = Bundle.main.url(forResource: "teams", withExtension: "json") else {
            XCTFail("Failed to find teams.json")
            return
        }
        
        // Parse and decode the data in the file and store into teams array
        do {
            let content = try Data(contentsOf: fileURL)
            let decoder = JSONDecoder()
            let result = try decoder.decode(Teams.self, from: content)
            
            teams = result.teams
            
        } catch{
            XCTFail("Error when parsing team data")
        }
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTheNumberOfFetchedTeamsEquals20() {
        
        let expectation = XCTestExpectation(description: "Get teams data from teams.json and the number should be 20")
        
        if teams.count == 20 {
            // Success to test
            expectation.fulfill()
        } else{
            XCTFail("The number of teams is not 20")
        }
        
        wait(for: [expectation], timeout: 3.0)
    }

    func testSortByStanding() {
        let expectation = XCTestExpectation(description: "Sort the teams by standing")
        
        teams = teams.sorted { prev, next in
            prev.standing < next.standing
        }
        
        if teams.first?.name == "Manchester City" && teams.last?.name == "Sheffield United" {
            // Success to test
            expectation.fulfill()
        } else{
            XCTFail("Sort by standing didn't work")
        }
        
        wait(for: [expectation], timeout: 3.0)
    }
    
    func testSortByName() {
        let expectation = XCTestExpectation(description: "Sort the teams by name")
        
        teams = teams.sorted { prev, next in
            prev.name < next.name
        }
        
        if teams.first?.name == "Arsenal" && teams.last?.name == "Wolverhampton Wanderers" {
            // Success to test
            expectation.fulfill()
        } else{
            XCTFail("Sort by name didn't work")
        }
        
        wait(for: [expectation], timeout: 3.0)
    }
}
