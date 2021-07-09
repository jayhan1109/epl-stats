//
//  StandingViewController.swift
//  EPL Team Stat
//
//  Created by Jeongho Han on 2021-05-11.
//

import UIKit

class StandingViewController: UIViewController {

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        TeamManager.shared.sortByStanding()
    }
    
    // MARK: - IBAction
    
    // Close current ViewController
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        TeamManager.shared.sortByName()
    }
}

// MARK: - UITableViewDataSource & UITableViewDelegate

extension StandingViewController : UITableViewDataSource, UITableViewDelegate {
    
    // The number of cells to show
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TeamManager.shared.teams.count
    }
    
    // Set up TableView's each cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: K.Standing.cellIdentifier, for: indexPath) as? StandingCell else {
            return UITableViewCell()
        }
        
        let team = TeamManager.shared.getTeamByIndex(at: indexPath.row)
        
        cell.updateUI(standing: "\(team.standing)", imageName: team.image, name: team.name)
        
        return cell
    }
}

// MARK: - StandingCell
// UITableViewCell to show list of teams at StandingViewController
class StandingCell: UITableViewCell{
    @IBOutlet weak var standingLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    func updateUI(standing: String ,imageName: String, name: String){
        standingLabel.text = standing
        imgView.image = UIImage(named: imageName)
        nameLabel.text = name
    }
}
