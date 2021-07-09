//
//  ViewController.swift
//  EPL Team Stat
//
//  Created by Jeongho Han on 2021-05-11.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - IBOutlet
    
    @IBOutlet weak var standingButton: UIButton!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Fetch data and store into TeamManger's teams array
        TeamManager.shared.fetchData()
    }
    
    // MARK: - IBAction
    
    @IBAction func showStanding(_ sender: UIButton) {
        performSegue(withIdentifier: K.Standing.segueIdentifier , sender: nil)
    }
}

// MARK: - UITableViewDataSource & UITableViewDelegate

extension HomeViewController:  UITableViewDataSource, UITableViewDelegate {
    
    // The number of cells to show
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TeamManager.shared.teams.count
    }
    
    // Set up TableView's each cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: K.Home.cellIdentifier, for: indexPath) as? ListCell else {
            return UITableViewCell()
        }
        
        let team = TeamManager.shared.getTeamByIndex(at: indexPath.row)
        
        cell.updateUI(imageName: team.image, name: team.name)
        
        return cell
    }
    
    // Trigger when tableview cell is clicked
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: K.Home.segueIdentifier, sender: indexPath.row)
    }
    
    // Initial setup for TeamViewController when performSegue to the TeamViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.Home.segueIdentifier {
            let vc = segue.destination as? TeamViewController
            
            if let idx = sender as? Int{
                vc?.team = TeamManager.shared.getTeamByIndex(at: idx)
            }
        }
    }
}

// MARK: - ListCell
// UITableViewCell to show list of teams at HomeViewController
class ListCell: UITableViewCell{
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    func updateUI(imageName: String, name: String){
        imgView.image = UIImage(named: imageName)
        nameLabel.text = name
    }
}
