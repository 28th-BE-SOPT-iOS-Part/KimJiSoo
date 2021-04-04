//
//  SecondViewController.swift
//  First Assignment
//
//  Created by 김지수 on 2021/04/03.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var messageLabel: UILabel!
    
    var message : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLabel()
      
    }
    
    func setLabel()
    {
        if let msg = self.message{
            messageLabel.text = "\(msg) 님"
        }
    
    
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
     
        self.dismiss(animated: true, completion: nil)
        

    }
    
}
