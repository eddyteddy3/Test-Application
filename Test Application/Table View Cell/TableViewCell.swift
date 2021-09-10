//
//  TableViewCell.swift
//  Test Application
//
//  Created by Mouzzam Tahir on 10/09/2021.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var customTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func add(_ text: String) {
        customTextLabel.text = text
    }
}
