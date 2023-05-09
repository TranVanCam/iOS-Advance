//
//  CollectionViewController.swift
//  iOS advance
//
//  Created by Cam Tran on 5/7/23.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var headTitle: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var users: [User] = User.getDummyDatas()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        self.navigationController?.isNavigationBarHidden = true
        let nib = UINib(nibName: "CustomCollectionViewCell", bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: "CustomCollectionViewCell")
        
        let headerNib = UINib(nibName: "CollectionHeaderView", bundle: .main)
        collectionView.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        
        clwLayout()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as! CustomCollectionViewCell
        let item = users[indexPath.row]
        cell.nameLabel.text = item.name
        cell.avatarImageView.image = UIImage(named: item.avatar)
        return cell
    }
    
    func clwLayout() {
        let screenWidth = UIScreen.main.bounds.width - 10
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        layout.itemSize = CGSize(width: screenWidth/3.01, height: (screenWidth/3.01)*5/4)
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        collectionView!.collectionViewLayout = layout
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
         return CGSize(width: collectionView.frame.width, height: 50)
     }
     
     func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
         switch kind {
         case UICollectionView.elementKindSectionHeader:
                let reusableview = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header", for: indexPath) as! CollectionHeaderView
                reusableview.frame = CGRect(x: 0 , y: 0, width: self.view.frame.width, height: 50)
                
                reusableview.titleLabel.text = "Users"
                reusableview.totalLabel.text = "\(users.count)"
                 return reusableview
         default:
             fatalError("Unexpected element kind")
         }
     }
    

}
