//
//  CLSInstitutionTableViewCell.swift
//  CLSTestMVVM
//
//  Created by StephenChen on 25/11/2017.
//  Copyright © 2017 StephenChen. All rights reserved.
//

import UIKit

class CLSInstitutionTableViewCell: UITableViewCell {

    @IBOutlet weak var country: UILabel!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var address: UILabel!
    
    @IBOutlet weak var phoneNumber: UILabel!
    
    @IBOutlet weak var applyList: UILabel!
    
    @IBOutlet weak var verifyDate: UILabel!
    
    @IBOutlet weak var websiteURL: UILabel!

    @IBOutlet weak var bgView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
