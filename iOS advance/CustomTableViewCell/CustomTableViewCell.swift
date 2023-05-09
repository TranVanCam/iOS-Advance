//
//  CustomTableViewCell.swift
//  tableViewJan26
//
//  Created by Cam Tran on 1/26/23.
//

import UIKit

protocol CustomTableViewCellProtocol {
    func didTapHeartButton(index: Int)
}

class CustomTableViewCell: UITableViewCell {
    
    var delegete: CustomTableViewCellProtocol?
    var currentIndex: Int = 0
    
    @IBOutlet weak var employeeImage: UIImageView!
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var coverView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func didTapHeartButton(_ sender: Any) {
        self.delegete?.didTapHeartButton(index: currentIndex)
    }
    
}
