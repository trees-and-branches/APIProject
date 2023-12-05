//
//  StateRepTableViewCell.swift
//  APIProject
//
//  Created by shark boy on 12/4/23.
//

import UIKit

class StateRepTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var partyLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(with stateRep: StateRep) {
        nameLabel.text = stateRep.name
        partyLabel.text = stateRep.party
        phoneNumberLabel.text = stateRep.phone
    }

}
