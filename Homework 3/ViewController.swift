//
//  ViewController.swift
//  Homework 3
//
//  Created by Beavean on 25.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tasksTableView: UITableView!
    
    let arrayOfTasks = ["taskOne", "taskTwo", "taskThree", "taskFour", "taskFive", "taskSix", "taskSeven"]
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tasksTableView.dataSource = self
        tasksTableView.delegate = self
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let main = UIStoryboard(name: "Main", bundle: nil)
        let taskOneViewController =  main.instantiateViewController(withIdentifier: "taskOne")
        navigationController?.pushViewController(taskOneViewController, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  UITableViewCell()
        cell.textLabel?.text = arrayOfTasks[indexPath.row]
        return cell
    }
}



