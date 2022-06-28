//
//  taskThree.swift
//  Homework 3
//
//  Created by Beavean on 27.06.2022.
//

import UIKit

class taskThree: UIViewController {
    
    @IBOutlet weak var ballMovingFrame: UIView!
    @IBOutlet weak var orangeBall: UIView!
    var newSafeArea = UIEdgeInsets()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        orangeBall.layer.cornerRadius = orangeBall.bounds.height / 2
        newSafeArea = self.view.safeAreaInsets
    }
    
    @IBAction func runButton(_ sender: Any) {
        UIView.animate(withDuration: 1, delay: 0, options: []) {
            self.orangeBall.center.x = self.ballMovingFrame.frame.maxX - self.orangeBall.frame.width / 2
        } completion: { _ in
            UIView.animate(withDuration: 1, delay: 0, options: []) {
                self.orangeBall.center.y = self.ballMovingFrame.frame.maxY - self.orangeBall.frame.height / 2
            } completion: { _ in
                UIView.animate(withDuration: 1, delay: 0, options: []) {
                    self.orangeBall.center.x = self.ballMovingFrame.frame.minX + self.orangeBall.frame.width / 2
                } completion: { _ in
                    UIView.animate(withDuration: 1, delay: 0, options: []) {
                        self.orangeBall.center.y = self.ballMovingFrame.frame.minY + self.orangeBall.frame.width / 2
                    }
                }
            }
        }
    }
}
