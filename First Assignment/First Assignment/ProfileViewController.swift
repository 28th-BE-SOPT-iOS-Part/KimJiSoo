//
//  ProfileViewController.swift
//  First Assignment
//
//  Created by 김지수 on 2021/04/22.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
//       SwipeDown 선언
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture(_:)))
                swipeDown.direction = UISwipeGestureRecognizer.Direction.down
                self.view.addGestureRecognizer(swipeDown)

        // Do any additional setup after loading the view.
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
