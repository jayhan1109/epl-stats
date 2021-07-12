//
//  TeamViewController.swift
//  EPL Team Stat
//
//  Created by Jeongho Han on 2021-05-11.
//

import UIKit

class TeamViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var stadiumLabel: UILabel!
    @IBOutlet weak var standingTitle: UILabel!
    @IBOutlet weak var standingLabel: UILabel!
    @IBOutlet weak var matchTitle: UILabel!
    @IBOutlet weak var matchLabel: UILabel!
    @IBOutlet weak var winTitle: UILabel!
    @IBOutlet weak var winLabel: UILabel!
    @IBOutlet weak var loseTitle: UILabel!
    @IBOutlet weak var loseLabel: UILabel!
    @IBOutlet weak var goalTitle: UILabel!
    @IBOutlet weak var goalLabel: UILabel!
    @IBOutlet weak var winRateTitle: UILabel!
    @IBOutlet weak var winRateLabel: UILabel!
    
    // MARK: - Properties
    
    var team: Team?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    // MARK: - Helpers
    
    // Configure UI with team variable
    func updateUI(){
        
        guard let team = team else { return }
        
        let outlets = [nameLabel, stadiumLabel, standingTitle, matchTitle, winTitle, loseTitle, goalTitle, winRateTitle]
        
        nameLabel.text = team.name
        imgView.image = UIImage(named: team.image)
        stadiumLabel.text = team.stadium
        standingLabel.text = "\(team.standing)"
        matchLabel.text = "\(team.stat.matches)"
        winLabel.text = "\(team.stat.wins)"
        loseLabel.text = "\(team.stat.loses)"
        goalLabel.text = "\(team.stat.goals)"
        winRateLabel.text = String(format: "%.0f", Double(team.stat.wins * 100) / Double(team.stat.matches + team.stat.loses)) + "%"
        
        outlets.forEach { label in
            label?.backgroundColor = UIColorFromHex(rgbValue: team.color)
        }
        
        // Set text color for the teams in bright team list
        if(K.Teams.brightTeams.contains(team.name)){
            print("yoyo")
            outlets.forEach { label in
                label?.textColor = UIColorFromHex(rgbValue: K.Color.brightTeamColor)
            }
        }
    }
    
    // Return UIColor with hex color string
    func UIColorFromHex(rgbValue:String, alpha:Double = 1.0)->UIColor {
        
        // Get last 6 characters and set it as hex string
        if let hexValue = UInt32(String(rgbValue.suffix(6)), radix: 16) {
            // Get red, green, blue with bit And and Shift operator
            let red = CGFloat((hexValue & 0xFF0000) >> 16)/255.0
            let green = CGFloat((hexValue & 0x00FF00) >> 8)/255.0
            let blue = CGFloat(hexValue & 0x0000FF)/255.0

            return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
        }
        
        return UIColor(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    // MARK: - IBActions
    
    // Close current ViewController
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
