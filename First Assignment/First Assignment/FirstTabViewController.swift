//
//  FirstTabViewController.swift
//  First Assignment
//
//  Created by 김지수 on 2021/04/22.
//

import UIKit

class FirstTabViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func ChangeButtonClicked(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(identifier:"ProfileViewController")as? ProfileViewController else {return}
        
        nextVC.modalPresentationStyle = .fullScreen
     
        self.present(nextVC, animated :true, completion: nil)
    }
 

}
