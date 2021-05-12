//
//  StandingViewController.swift
//  EPL Team Stat
//
//  Created by Jeongho Han on 2021-05-11.
//

import UIKit

class StandingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        TeamManager.shared.sortByStanding()
    }
    
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        TeamManager.shared.sortByName()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TeamManager.shared.teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "standingCell", for: indexPath) as? StandingCell else {
            return UITableViewCell()
        }
        
        let team = TeamManager.shared.getTeamByIndex(at: indexPath.row)
        
        cell.standingLabel.text = "\(team.standing)"
        cell.imgView.image = UIImage(named: team.image)
        cell.nameLabel.text = team.name
        
        return cell
    }
}

class StandingCell: UITableViewCell{
    @IBOutlet weak var standingLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
}
