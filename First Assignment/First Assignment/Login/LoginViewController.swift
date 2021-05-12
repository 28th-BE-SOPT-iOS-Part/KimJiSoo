//
//  LoginViewController.swift
//  First Assignment
//
//  Created by 김지수 on 2021/05/13.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
    }
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        
        self.makeRequestAlert(title: "알림",
                                      message: "로그인을 하시겠습니까?",
                                      okAction: { _ in
                                        self.loginAction()
                                      })
       
        
        
    }
    
    func loginAction()
        {
            LoginService.shared.login(email: self.emailTextField.text!, password: self.passwordTextField.text!) { result in
                switch result
                {
                case .success(let message):
                    
                    if let message = message as? String{
                        
                        self.makeAlert(title: "알림",
                                       message: message,
                                       okAction : { _ in
                                        let storyboard = UIStoryboard(name: "TabStoryboard", bundle: nil)
                                        guard let mainVC =
                                                storyboard.instantiateViewController(identifier: "MainTabBarController") as? MainTabBarController else {return}
                                        self.navigationController?.pushViewController(mainVC, animated: true)
                                       })

                    }
                    
                case .requestErr(let message):
                    
                    if let message = message as? String{
                        
                        self.makeAlert(title: "알림",
                                  message: message)
                    }
                               
                    
                default :
                    print("ERROR")
                }
            }
        }
        
    
    @IBAction func signupButtonClicked(_ sender: Any) {
        print("dd")
        guard let nextVC = self.storyboard?.instantiateViewController(identifier:"FirstViewController")as? FirstViewController else {return}
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
