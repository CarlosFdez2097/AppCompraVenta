//
//  CompraDeEntradasCell.swift
//  App Venta Entradas
//
//  Created by alumnos on 26/11/18.
//  Copyright © 2018 alumnos. All rights reserved.
//

import UIKit

class CompraDeEntradasCell: UITableViewCell
{
    @IBOutlet weak var EventImage: UIImageView!
    @IBOutlet weak var EventTitle: UILabel!
    @IBOutlet weak var EventSlider: UISlider!
    @IBOutlet weak var EventNumTickets: UILabel!
    @IBOutlet weak var EventMoney: UILabel!
    @IBOutlet weak var EventUbication: UILabel!
    @IBOutlet weak var EventBut: UIButton!
    
    public var price: Int = Int()
    
    @IBAction func Slider(_ sender: UISlider)
    {
        EventNumTickets.text = String(Int(EventSlider.value))
        
        var priceTickets: Int = price * Int(EventSlider.value)
        
        EventMoney.text =  String(priceTickets)
    }
}
