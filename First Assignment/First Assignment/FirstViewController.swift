//
//  FirstViewController.swift
//  First Assignment
//
//  Created by 김지수 on 2021/04/03.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var PasswordCheckTextField: UITextField!
    
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
    
 
    
    @IBAction func MakeAccountButtonClicked(_ sender: Any) {
 
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
        
        let pwc = PasswordCheckTextField.text
       
        if pwc?.isEmpty ?? true {
                Alert(title: "비밀번호를 한번 더 입력하세요")
                return;
        }
        
        guard let password = PasswordTextField.text, let passwordCheck = PasswordCheckTextField.text, password == passwordCheck else {
                    Alert(title: "비밀번호가 일치하지 않습니다.")
                    return
                }
        
        guard let nextVC = self.storyboard?.instantiateViewController(identifier:"SecondViewController")as? SecondViewController else {return}
        
        nextVC.message = emailTextField.text
        
        nextVC.modalPresentationStyle = .fullScreen
        nextVC.modalTransitionStyle = .coverVertical
              
        self.present(nextVC, animated :true, completion: {self.navigationController?.popViewController(animated: true)})
    }
}
    

