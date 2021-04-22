//
//  ViewController.swift
//  First Assignment
//
//  Created by 김지수 on 2021/04/03.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
 
     
    }
    
    
//로그인 하기
    @IBAction func loginButtonClicked(_ sender: Any) {
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                
        guard let mainVC = storyboard.instantiateViewController(identifier: "MainTabBarController") as? MainTabBarController
        else {return}
                
        self.navigationController?.pushViewController(mainVC, animated: true)
       
    }
    
    
//    새로운 계정 가입하기
    @IBAction func signupButtonClicked(_ sender: Any) {
        
    
        guard let nextVC = self.storyboard?.instantiateViewController(identifier:"FirstViewController")as? FirstViewController else {return}
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

