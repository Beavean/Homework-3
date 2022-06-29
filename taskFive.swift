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

let pluto = Post(avatarImageName: "Pluto", postImageName: "Pluto", viewCount: 123, postDescription: "(minor-planet designation: 134340 Pluto) is a dwarf planet in the Kuiper belt, a ring of bodies beyond the orbit of Neptune.", countOfComments: 2, postedAt: "February 18, 1930")
let neptune = Post(avatarImageName: "Neptune", postImageName: "Neptune", viewCount: 999, postDescription: "is the eighth and farthest-known Solar planet from the Sun. In the Solar System, it is the fourth-largest planet by diameter, the third-most-massive planet, and the densest giant planet.", countOfComments: 2, postedAt: "23 September 1846")
let saturn =  Post(avatarImageName: "Saturn", postImageName: "Saturn", viewCount: 555, postDescription: "is the sixth planet from the Sun and the second-largest in the Solar System, after Jupiter", countOfComments: 123, postedAt: "Something like 1655")

let arrayOfPosts = [pluto, neptune, saturn]

extension taskFive: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 390
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension taskFive: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let post =  tableView.dequeueReusableCell(withIdentifier: "taskFiveTableViewCell", for: indexPath) as? taskFiveTableViewCell  else { return UITableViewCell() }
        let item = arrayOfPosts[indexPath.row]
        post.selectionStyle = .none
        post.avatarImage.layer.cornerRadius = post.avatarImage.frame.height / 2
        post.avatarImage.clipsToBounds = true
        post.profileName.text = item.avatarImageName
        post.avatarImage.image = UIImage(named: item.avatarImageName)
        post.postImage.image = UIImage(named: item.postImageName)
        post.postComment.text = "\(item.avatarImageName) - \(item.postDescription)"
        post.viewCount.text = "\(item.viewCount) views"
        post.otherComments.text = "View all \(item.countOfComments) comments"
        post.timeSincePosted.text = item.postedAt
        return post
    }
}


