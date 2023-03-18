//
//  MyTableViewCell.swift
//  UITableViewController
//
//  Created by Дмитрий Гусев on 18.03.2023.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var detailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }

    public func refresh(_ model: Model) {
        nameLabel.text = model.name
        detailLabel.text = model.prof
    }
}
