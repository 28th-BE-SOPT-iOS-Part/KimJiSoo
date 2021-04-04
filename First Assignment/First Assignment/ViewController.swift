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
    
    
    func Alert(title: String) {
            DispatchQueue.main.async {
                let controller = UIAlertController(title: title, message: nil, preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "닫기", style: .cancel) { (action) in
                }
                
                controller.addAction(cancelAction)
                self.present(controller, animated: true, completion: nil)
            }
        }
    
  
    @IBAction func loginButtonClicked(_ sender: Any) {
        
        
    
        guard let nextVC = self.storyboard?.instantiateViewController(identifier:"SecondViewController")as? SecondViewController else {return}
        
        nextVC.message = emailTextField.text
        
        let email = emailTextField.text
        if email?.isEmpty ?? true {
                Alert(title: "이메일을 입력하세요")
                return;
        }
        
        let pw = PasswordTextField.text
       
        if pw?.isEmpty ?? true {
                Alert(title: "비밀번호를 입력하세요")
                return;
        }
        
        nextVC.modalPresentationStyle = .automatic
        nextVC.modalTransitionStyle = .coverVertical
        
        
        self.present(nextVC, animated :true, completion: nil)
    }
    
    
    @IBAction func signupButtonClicked(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(identifier:"FirstViewController")as? FirstViewController else {return}
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

