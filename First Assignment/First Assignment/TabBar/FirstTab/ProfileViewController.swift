//
//  ProfileViewController.swift
//  First Assignment
//
//  Created by 김지수 on 2021/04/22.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    
    
    var name : String = ""
    var image : String = ""
    var state : String = ""

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.nameLabel.text = name
        self.stateLabel.text = state
        
       
        // 이미지가 존재하면 받아온 이미지로, 없으면 기본이미지로 보여주기
        if let image = UIImage(named: image) {
            self.iconImageView.image = image
        } else {
            self.iconImageView.image = UIImage(named: "profileUserImg")
        }

    
      
        
        
//      SwipeDown 선언
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture(_:)))
                swipeDown.direction = UISwipeGestureRecognizer.Direction.down
                self.view.addGestureRecognizer(swipeDown)

        
    }
//    swipe 해서 dismiss 하기
    
        func swipeRecognizer() {
            let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture(_:)))
            swipeDown.direction = UISwipeGestureRecognizer.Direction.down
            self.view.addGestureRecognizer(swipeDown)
            
        }
        
        @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer){
            if let swipeGesture = gesture as? UISwipeGestureRecognizer {
                switch swipeGesture.direction{
                case UISwipeGestureRecognizer.Direction.down:
                    // 스와이프 시, 원하는 기능 구현.
                    self.dismiss(animated: true, completion: nil)
                default: break
                }
            }
        }



//클릭해서 dismiss 하기
    @IBAction func BackButtonClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}


