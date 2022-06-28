//
//  taskFive.swift
//  Homework 3
//
//  Created by Beavean on 28.06.2022.
//

import UIKit

class taskFive: UIViewController {
    
    
    @IBOutlet weak var taskFiveTableView: UITableView!
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.title = "Posts"
        taskFiveTableView.dataSource = self
        taskFiveTableView.delegate = self
        
        taskFiveTableView.register(UINib(nibName: "taskFiveTableViewCell", bundle: nil), forCellReuseIdentifier: "taskFiveTableViewCell")
    }
}

class Post {
    var avatarImageName: String
    var postImageName: String
    var viewCount: Int
    var postDescription: String
    var countOfComments: Int
    var postedAt: String
    
    init(avatarImageName: String, postImageName: String, viewCount: Int, postDescription: String, countOfComments: Int, postedAt: String) {
        self.avatarImageName = avatarImageName
        self.postImageName = postImageName
        self.viewCount = viewCount
        self.postDescription = postDescription
        self.countOfComments = countOfComments
        self.postedAt = postedAt
    }
}

extension taskFive: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 390
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension taskFive: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =  tableView.dequeueReusableCell(withIdentifier: "taskFiveTableViewCell", for: indexPath) as? taskFiveTableViewCell  else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.avatarImage.layer.cornerRadius = cell.avatarImage.frame.height / 2
        cell.avatarImage.clipsToBounds = true
        cell.profileName.text = pluto.avatarImageName
        cell.avatarImage.image = UIImage(named: pluto.avatarImageName)
        cell.postImage.image = UIImage(named: pluto.postImageName)
        cell.postComment.text = "\(pluto.avatarImageName): \(pluto.postDescription)"
        cell.viewCount.text = "\(pluto.viewCount) views"
        cell.otherComments.text = "View all \(pluto.countOfComments) comments"
        cell.timeSincePosted.text = pluto.postedAt
        return cell
    }
}

let pluto = Post(avatarImageName: "Pluto", postImageName: "Pluto", viewCount: 123, postDescription: "(minor-planet designation: 134340 Pluto) is a dwarf planet in the Kuiper belt, a ring of bodies beyond the orbit of Neptune.", countOfComments: 2, postedAt: "February 18, 1930")


