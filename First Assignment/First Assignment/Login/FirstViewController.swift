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
    
//알림 보내기
    func Alert(title: String) {
            DispatchQueue.main.async {
                let controller = UIAlertController(title: title, message: nil, preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "닫기", style: .cancel) { (action) in
                }

                controller.addAction(cancelAction)
                self.present(controller, animated: true, completion: nil)
            }
        }


//   새로운 계정 만들기
    
    @IBAction func MakeAccountButtonClicked(_ sender: Any) {
        
        if self.emailTextField.hasText && self.PasswordTextField.hasText && self.PasswordCheckTextField.hasText {
        
        self.makeRequestAlert(title: "알림", message: "회원가입을 하시겠습니까?", okAction: {_ in self.signupAction()
        })
        
// 비밀번호 와 확인 비밀번호가 일치할 때만 가입이 가능하게
        
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
            
        }
    }
    
            func signupAction()
            {
                SignupService.shared.signup(email: self.emailTextField.text!, password: self.PasswordTextField.text!, passwordcheck: self.PasswordCheckTextField.text!) { result in
                    switch result
                    {
                    case .success(let message):
                        
                        if let message = message as? String{
                            self.makeAlert(title: "알림",
                                           message: message,
                                           okAction: {_ in
                                            
                                            let storyboard = UIStoryboard(name: "TabStoryboard", bundle: nil)
                                            guard let mainVC =
                                                    storyboard.instantiateViewController(identifier: "MainTabBarController") as? MainTabBarController else {return}
                                            self.navigationController?.pushViewController(mainVC, animated: true)
                                           })
                        }
                    case .requestErr(let message):
                        if let message = message as? String{
                            self.makeAlert(title: "알림", message: message)
                        }
                        
                    default : print("Error")
                    }
                }
            }
            
        }
//      탭바 컨트롤러로 push 하기
//        let storyboard = UIStoryboard(name: "TabStoryboard", bundle: nil)
//
//        guard let mainVC = storyboard.instantiateViewController(identifier: "TabBarController") as? TabBarController
//        else {return}
//
//        self.navigationController?.pushViewController(mainVC, animated: true)
    
    

