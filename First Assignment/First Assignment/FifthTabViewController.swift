//
//  FifthTabViewController.swift
//  First Assignment
//
//  Created by 김지수 on 2021/05/07.
//

import UIKit

class FifthTabViewController: UIViewController {
    @IBOutlet weak var fifthCollectionView: UICollectionView!
    
    private var titleList : [FifthTabDataModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTitleList()
        fifthCollectionView.delegate = self
        fifthCollectionView.dataSource = self

    }
    

    func setTitleList() {
        titleList.append(contentsOf: [
            FifthTabDataModel(title: "메일",
                              innerImage: "messageTabIcon"),
            FifthTabDataModel(title: "캘린더",
                              innerImage: "messageTabIcon"),
            FifthTabDataModel(title: "서랍",
                              innerImage: "messageTabIcon"),
            FifthTabDataModel(title: "카카오콘",
                              innerImage: "messageTabIcon"),
            FifthTabDataModel(title: "메이커스",
                              innerImage: "messageTabIcon"),
            FifthTabDataModel(title: "선물하기",
                              innerImage: "messageTabIcon"),
            FifthTabDataModel(title: "이모티콘",
                              innerImage: "messageTabIcon"),
            FifthTabDataModel(title: "프렌즈",
                              innerImage: "messageTabIcon"),
            FifthTabDataModel(title: "쇼핑하기",
                              innerImage: "messageTabIcon"),
            FifthTabDataModel(title: "스타일",
                              innerImage: "messageTabIcon"),
            FifthTabDataModel(title: "주문하기",
                              innerImage: "messageTabIcon"),
            FifthTabDataModel(title: "멜론티켓",
                              innerImage: "messageTabIcon"),
            FifthTabDataModel(title: "게임",
                              innerImage: "messageTabIcon"),
            FifthTabDataModel(title: "멜론",
                              innerImage: "messageTabIcon"),
            FifthTabDataModel(title: "헤어샵",
                              innerImage: "messageTabIcon"),
            FifthTabDataModel(title: "전체서비스",
                              innerImage: "messageTabIcon")
        ])
    }

}

extension FifthTabViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titleList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard  let nameCell = collectionView.dequeueReusableCell(withReuseIdentifier: FifthCollectionViewCell.idetifier, for: indexPath)as? FifthCollectionViewCell else {
            return UICollectionViewCell()
        }
        nameCell.setData(title: titleList[indexPath.row].title,
                          iconName: titleList[indexPath.row].innerImage)
        return nameCell
    }
}


extension FifthTabViewController : UICollectionViewDelegate {
    
}


extension FifthTabViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        
        let cellwidth = width * (70/375)
        let cellHeight = cellwidth * (70/70)
        
        return CGSize(width: cellwidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 19
        }
    
    func collectionView(_collectionView:UICollectionView, layout collectionViewLayout:UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
}



