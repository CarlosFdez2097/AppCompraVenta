//
//  DetalleViewController.swift
//  App Venta Entradas
//
//  Created by alumnos on 5/12/18.
//  Copyright © 2018 alumnos. All rights reserved.
//

import UIKit

class DetalleViewController: UIViewController
{
    @IBOutlet weak var EventImage: UIImageView!
    @IBOutlet weak var EventName: UILabel!
    @IBOutlet weak var EventCode: UILabel!
    
    var NameEvent:String = ""
    var ImageEvent:String = ""
    var CodeEvent = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        EventImage.image = UIImage(named: ImageEvent)
        EventName.text = NameEvent
        EventCode.text = CodeEvent
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
}

