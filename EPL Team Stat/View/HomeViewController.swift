//
//  ViewController.swift
//  EPL Team Stat
//
//  Created by Jeongho Han on 2021-05-11.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var standingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TeamManager.shared.fetchData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TeamManager.shared.teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell", for: indexPath) as? ListCell else {
            return UITableViewCell()
        }
        
        let team = TeamManager.shared.getTeamByIndex(at: indexPath.row)
        
        cell.imgView.image = UIImage(named: team.image)
        cell.nameLabel.text = team.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "teamSegue", sender: indexPath.row)
    }
    
    @IBAction func showStanding(_ sender: UIButton) {
        performSegue(withIdentifier: "standingSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "teamSegue"{
            let vc = segue.destination as? TeamViewController
            
            if let idx = sender as? Int{
                vc?.team = TeamManager.shared.getTeamByIndex(at: idx)
            }
        }
    }
}

class ListCell: UITableViewCell{
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    func updateUI(image: String, name: String){
        imgView.image = UIImage(named: image)
        nameLabel.text = name
    }
}
