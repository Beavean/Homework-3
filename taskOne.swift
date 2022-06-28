//
//  taskOne.swift
//  Homework 3
//
//  Created by Beavean on 25.06.2022.
//

import UIKit

class taskOne: UIViewController {
    
    @IBOutlet weak var taskOneTableView: UITableView!
    
    
    let arrayOfScreens = ["firstScreen", "secondScreen", "thirdScreen", "fourthScreen"]
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.title = "taskOne"
        taskOneTableView.dataSource = self
        taskOneTableView.delegate = self
    }
}

extension taskOne: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let main = UIStoryboard(name: "Main", bundle: nil)
        let taskOneViewController =  main.instantiateViewController(withIdentifier: arrayOfScreens[indexPath.row])
        navigationController?.pushViewController(taskOneViewController, animated: true)
    }
}

extension taskOne: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfScreens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  UITableViewCell()
        cell.textLabel?.text = arrayOfScreens[indexPath.row]
        return cell
    }
}

class firstScreen: UIViewController {
    @IBOutlet weak var firstScreenGreenCircle: UIView!
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        firstScreenGreenCircle.layer.cornerRadius = firstScreenGreenCircle.frame.height / 2
    }
}

class secondScreen: UIViewController {
    
    
    @IBOutlet weak var greenCircle: UIView!
    @IBOutlet weak var yellowCircle: UIView!
    @IBOutlet weak var redCircle: UIView!
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        greenCircle.layer.cornerRadius = greenCircle.bounds.height / 2
        yellowCircle.layer.cornerRadius = yellowCircle.bounds.height / 2
        redCircle.layer.cornerRadius = redCircle.bounds.height / 2
    }
}

class thirdScreen: UIViewController {
    
    @IBOutlet weak var yellowCircle: UIView!
    @IBOutlet weak var greenCircle: UIView!
    @IBOutlet weak var redCircle: UIView!
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        greenCircle.layer.cornerRadius = greenCircle.bounds.height / 2
        yellowCircle.layer.cornerRadius = yellowCircle.bounds.height / 2
        redCircle.layer.cornerRadius = redCircle.bounds.height / 2
        yellowCircle.alpha = 0.7
    }
}

class fourthScreen: UIViewController {
    
    @IBOutlet weak var boundingCircle: UIView!
    @IBOutlet weak var redCircle: UIView!
    @IBOutlet weak var yellowCircle: UIView!
    @IBOutlet weak var greenCircle: UIView!
    @IBOutlet weak var blueCircle: UIView!
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        boundingCircle.layer.cornerRadius = boundingCircle.bounds.height / 2
        boundingCircle.clipsToBounds = true
        greenCircle.layer.cornerRadius = greenCircle.bounds.height / 2
        yellowCircle.layer.cornerRadius = yellowCircle.bounds.height / 2
        redCircle.layer.cornerRadius = redCircle.bounds.height / 2
        blueCircle.layer.cornerRadius = redCircle.bounds.height / 2
    }
}


