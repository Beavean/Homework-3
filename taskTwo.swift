//
//  taskTwo.swift
//  Homework 3
//
//  Created by Beavean on 27.06.2022.
//

import UIKit


class taskTwo: UIViewController {
    
    @IBOutlet weak var bounceButtonFrame: UIButton!
    @IBOutlet weak var redBall: UIView!
    @IBOutlet weak var redBallMovementFrame: UIView!
    
    
    
    @IBAction func bounceButton(_ sender: Any) {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 4, initialSpringVelocity: 5, options: [.autoreverse, .repeat]) {
            self.redBall.center.y = self.redBallMovementFrame.frame.minY + self.redBall.frame.height / 2
       
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        redBall.layer.cornerRadius = redBall.bounds.height / 2
    }
}
