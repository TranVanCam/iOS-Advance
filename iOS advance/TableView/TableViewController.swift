//
//  TableViewController.swift
//  iOS advance
//
//  Created by Cam Tran on 5/8/23.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CustomTableViewCellProtocol {
    func didTapHeartButton(index: Int) {
        print("click: \(users[index].name)")
    }
    
    
    var users: [User] = User.getDummyDatas()
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        let item = users[indexPath.row]
        cell.nameLable.text = item.name
        cell.employeeImage.image = UIImage(named: item.avatar)
        cell.currentIndex = indexPath.row
        cell.delegete = self
        cell.coverView.layer.cornerRadius = 15
        cell.coverView.layer.borderWidth = 2
        cell.coverView.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
        
        cell.showsReorderControl = true
        cell.selectionStyle = .none
        cell.accessoryType = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Delete") { [self] (contextualAction, view, boolValue) in
            print(" - Delete item")
            users.remove(at: indexPath.row)
            tableView.reloadData()
            
        }
        return UISwipeActionsConfiguration(actions: [action])
        }
    

}
