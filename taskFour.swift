//
//  taskFour.swift
//  Homework 3
//
//  Created by Beavean on 28.06.2022.
//

import UIKit

class taskFour: UIViewController {
    
    @IBOutlet weak var taskFourTableView: UITableView!
    
    let arrayOfMonths = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.title = "taskFour"
        taskFourTableView.dataSource = self
        taskFourTableView.delegate = self
    }
}

extension taskFour: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        if let mainViewController = mainStoryboard.instantiateViewController(withIdentifier: "taskFourViewController") as? taskFourViewController {
            navigationController?.pushViewController(mainViewController, animated: true)
            mainViewController.monthNumber = (indexPath.row + 1)
            mainViewController.monthName = arrayOfMonths[indexPath.row]
        }
    }
}

extension taskFour: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfMonths.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  UITableViewCell()
        cell.textLabel?.text = arrayOfMonths[indexPath.row]
        return cell
    }
}

class taskFourViewController: UIViewController {
    
    @IBOutlet weak var upperLabel: UILabel!
    @IBOutlet weak var lowerLabel: UILabel!
    
    var monthName = ""
    var monthNumber = 0
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        upperLabel.text = "\(monthNumber)"
        lowerLabel.text = monthName
    }
}
