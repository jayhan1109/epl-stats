//
//  TeamViewController.swift
//  EPL Team Stat
//
//  Created by Jeongho Han on 2021-05-11.
//

import UIKit

class TeamViewController: UIViewController {
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
    
    var team: Team?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    func updateUI(){
        nameLabel.text = team?.name
        imgView.image = UIImage(named: team?.image ?? "epl")
        stadiumLabel.text = team?.stadium
        standingLabel.text = "\(team?.standing ?? 0)"
        matchLabel.text = "\(team?.stat.matches ?? 0)"
        winLabel.text = "\(team?.stat.wins ?? 0)"
        loseLabel.text = "\(team?.stat.loses ?? 0)"
        goalLabel.text = "\(team?.stat.goals ?? 0)"
        winRateLabel.text = String(format: "%.0f", Double((team?.stat.wins)! * 100) / Double((team?.stat.matches)! + (team?.stat.loses)!)) + "%"
        
        nameLabel.backgroundColor = UIColorFromHex(rgbValue: team!.color)
        stadiumLabel.textColor = UIColorFromHex(rgbValue: team!.color)
        standingTitle.backgroundColor = UIColorFromHex(rgbValue: team!.color)
        matchTitle.backgroundColor = UIColorFromHex(rgbValue: team!.color)
        winTitle.backgroundColor = UIColorFromHex(rgbValue: team!.color)
        loseTitle.backgroundColor = UIColorFromHex(rgbValue: team!.color)
        goalTitle.backgroundColor = UIColorFromHex(rgbValue: team!.color)
        winRateTitle.backgroundColor = UIColorFromHex(rgbValue: team!.color)
        
        if(team?.name == "Fulham" ||
            team?.name == "Leeds United" ||
            team?.name == "Manchester City" ||
            team?.name == "Tottenham Hotspur" ||
            team?.name == "West Bromwich Albion" ||
            team?.name == "Wolverhampton Wanderers"){
            
            print("yo")
            
            nameLabel.textColor = UIColorFromHex(rgbValue: "#2f2f2f")
            standingTitle.textColor = UIColorFromHex(rgbValue: "#2f2f2f")
            matchTitle.textColor = UIColorFromHex(rgbValue: "#2f2f2f")
            winTitle.textColor = UIColorFromHex(rgbValue: "#2f2f2f")
            loseTitle.textColor = UIColorFromHex(rgbValue: "#2f2f2f")
            goalTitle.textColor = UIColorFromHex(rgbValue: "#2f2f2f")
            winRateTitle.textColor = UIColorFromHex(rgbValue: "#2f2f2f")
        }
    }
    
    func UIColorFromHex(rgbValue:String, alpha:Double=1.0)->UIColor {
        
        if let hexValue = UInt(String(rgbValue.suffix(6)), radix: 16) {
            let red = CGFloat((hexValue & 0xFF0000) >> 16)/256.0
            let green = CGFloat((hexValue & 0xFF00) >> 8)/256.0
            let blue = CGFloat(hexValue & 0xFF)/256.0

            return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
        }
        
        return UIColor(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
