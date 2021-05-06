//
//  SoptViewController.swift
//  First Assignment
//
//  Created by 김지수 on 2021/04/30.
//

import UIKit

class SoptViewController: UIViewController {
    
    @IBOutlet weak var serviceTableView: UITableView!
    
    @IBOutlet weak var sampleHeaderView: UIView!
    @IBOutlet weak var headerTitleLabel: UILabel!
    @IBOutlet weak var headerSubTitleLabel: UILabel!
    
    @IBAction func ChangeButtonClicked(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(identifier:"ProfileViewController")as? ProfileViewController else {return}
                
                nextVC.modalPresentationStyle = .fullScreen
        
        nextVC.image = ""
        nextVC.name = self.headerTitleLabel.text ?? ""
        nextVC.state = self.headerSubTitleLabel.text ?? ""
        
                self.present(nextVC, animated :true, completion: nil)
    }
    
    
    var serviceList : [ServiceListDataModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        setServiceList()
        
        serviceTableView.estimatedRowHeight = 100
                
        serviceTableView.delegate = self
        serviceTableView.dataSource = self
        serviceTableView.separatorStyle = .none
    }


    


    func setServiceList()
        {
        _ = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height:150))
        
            serviceList.append(contentsOf: [
                ServiceListDataModel(iconImageName: "profileImage1",
                                title: "안솝트",
                                subtitle: "배고파요"),
                
                ServiceListDataModel(iconImageName: "profileImage2",
                                title: "최솝트",
                                subtitle: "피곤해요"),
                
                ServiceListDataModel(iconImageName: "profileImage3",
                                title: "정솝트",
                                subtitle: "시험언제끝나죠?"),
                
                ServiceListDataModel(iconImageName: "profileImage4",
                                title: "이솝트",
                                subtitle: "ㅠㅠㅠㅠ"),
                
                ServiceListDataModel(iconImageName: "profileImage5",
                                title: "유솝트",
                                subtitle: "나는 상태메세지!"),
                
                ServiceListDataModel(iconImageName: "profileImage6",
                                title: "박솝트",
                                subtitle: "원하는대로 바꿔보세요 ^_^"),
                
                ServiceListDataModel(iconImageName: "profileImage7",
                                title: "최솝트",
                                subtitle: "넘 덥다.."),
                
                ServiceListDataModel(iconImageName: "profileImage8",
                                title: "원솝트",
                                subtitle: "배고파요"),
                
                ServiceListDataModel(iconImageName: "profileImage9",
                                title: "투솝트",
                                subtitle: "내꿈은 대나무부자"),
                
                ServiceListDataModel(iconImageName: "profileImage10",
                                title: "권솝트",
                                subtitle: "걱정말라구!")
                
                
                
            ])
        }
    
}

extension SoptViewController : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension}
        
       
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let cell = self.storyboard?.instantiateViewController(identifier:"ProfileViewController")as? ProfileViewController else {return}
        cell.name = self.serviceList[indexPath.row].title
        cell.image = self.serviceList[indexPath.row].iconImageName
        cell.state = self.serviceList[indexPath.row].subtitle
        

                cell.modalPresentationStyle = .fullScreen

                self.present(cell, animated :true, completion: nil)
    }
        
        
////
            
    
}

extension SoptViewController : UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return serviceList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let serviceCell = tableView.dequeueReusableCell(withIdentifier: SoptTableViewCell.identifier, for: indexPath)
                
                
                as? SoptTableViewCell else {return UITableViewCell() }
        
        serviceCell.setData(imageName: serviceList[indexPath.row].iconImageName,
                            title: serviceList[indexPath.row].title,
                            subtitle: serviceList[indexPath.row].subtitle)
        
        return serviceCell
    }
}
