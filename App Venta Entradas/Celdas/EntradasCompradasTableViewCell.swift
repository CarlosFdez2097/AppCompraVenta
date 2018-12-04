
//
//  EntradasCompradasTableViewCell.swift
//  App Venta Entradas
//
//  Created by alumnos on 3/12/18.
//  Copyright © 2018 alumnos. All rights reserved.
//

import UIKit

class EntradasCompradasTableViewCell: UITableViewCell {

    
    @IBOutlet weak var EventTitle: UILabel!
    @IBOutlet weak var EventNumTickets: UILabel!
    @IBOutlet weak var EventsUbications: UILabel!
    @IBOutlet weak var EventImange: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
