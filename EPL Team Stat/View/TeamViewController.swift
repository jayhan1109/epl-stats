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
    @IBOutlet weak var standingLabel: UILabel!
    @IBOutlet weak var matchLabel: UILabel!
    @IBOutlet weak var winLabel: UILabel!
    @IBOutlet weak var loseLabel: UILabel!
    @IBOutlet weak var goalLabel: UILabel!
    @IBOutlet weak var winRate: UILabel!
    
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
        winRate.text = String(format: "%.0f", Double((team?.stat.wins)! * 100) / Double((team?.stat.matches)! + (team?.stat.loses)!)) + "%"
    }
    
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
