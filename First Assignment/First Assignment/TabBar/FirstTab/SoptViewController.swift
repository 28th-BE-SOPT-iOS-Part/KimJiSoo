//
//  SoptViewController.swift
//  First Assignment
//
//  Created by 김지수 on 2021/04/30.
//

import UIKit


class SoptViewController: UIViewController{
    
  
    static let identifier : String = "SoptViewController"

    @IBOutlet weak var serviceTableView: UITableView!
    @IBOutlet weak var sampleHeaderView: UIView!
    @IBOutlet weak var headerTitleLabel: UILabel!
    @IBOutlet weak var headerSubTitleLabel: UILabel!
    

//  setting button 누르면 Actionsheet 나오게 하기
    
    @IBAction func actionsheetButton(_ sender: UIButton) {
        
        let alert: UIAlertController
        
        alert = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertController.Style.actionSheet)
//                취소 버튼
                var cancelAction: UIAlertAction
                cancelAction = UIAlertAction(title: "취소", style: UIAlertAction.Style.cancel, handler: { (action: UIAlertAction) in
                    
                })
//                내용 버튼
                var editAction: UIAlertAction
                editAction = UIAlertAction(title: "편집", style: UIAlertAction.Style.default, handler: { (action: UIAlertAction) in
                   
                })
                var friendAction: UIAlertAction
                friendAction = UIAlertAction(title: "친구관리", style: UIAlertAction.Style.default, handler: { (action: UIAlertAction) in
                    
                })
                var settingAction: UIAlertAction
                settingAction = UIAlertAction(title: "전체 설정", style: UIAlertAction.Style.default, handler: { (action: UIAlertAction) in
                    
                })
    
//        destructive style 의 버튼
//                var destructiveAction: UIAlertAction
//                destructiveAction = UIAlertAction(title: "destructive", style: UIAlertAction.Style.destructive, handler: { (action: UIAlertAction) in
//                    print("destructive 액션시트 선택함")
//                })
        
        
//              action 실행 부분
                alert.addAction(cancelAction)
                alert.addAction(editAction)
                alert.addAction(friendAction)
                alert.addAction(settingAction)
//              alert.addAction(defaultAction)
//              alert.addAction(destructiveAction)
            
                self.present(alert,animated: true){
                   
                }
            }
    
//    프로필 누르면 Profile Storyboard
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
        

    //  선택된 셀 데이터 전달
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let cell = self.storyboard?.instantiateViewController(identifier:"ProfileViewController")as? ProfileViewController else {return}
        cell.name = self.serviceList[indexPath.row].title
        cell.image = self.serviceList[indexPath.row].iconImageName
        cell.state = self.serviceList[indexPath.row].subtitle


                cell.modalPresentationStyle = .fullScreen

                self.present(cell, animated :true, completion: nil)
        
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    
    //    스와이프해서 숨김 , 차단 :  table view swipe action
    //    순서는 처음것이 가장 trailing 쪽으로 붙는다고 생각 : 먼저 나온게 오른쪽!
        
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let actions1 = UIContextualAction(style: .destructive, title: "차단", handler: { action, view, completionHaldler in
                completionHaldler(true)
            })
        let actions2 = UIContextualAction(style: .normal, title: "숨김", handler: { action, view, completionHaldler in
                completionHaldler(true)
            })
        return UISwipeActionsConfiguration(actions: [actions1, actions2])
        }
    
}


//  테이블뷰 데이터 가져오기
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

