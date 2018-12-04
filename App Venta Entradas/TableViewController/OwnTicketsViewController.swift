//
//  OwnTicketsViewController.swift
//  App Venta Entradas
//
//  Created by alumnos on 4/12/18.
//  Copyright © 2018 alumnos. All rights reserved.
//


import UIKit

class OwnTicketsViewController: UIViewController , UITableViewDataSource, UITableViewDelegate
{

    @IBOutlet weak var tableview: UITableView!
    
    var nameEvents:[String] = []
    var NumTicketsEvents:[String] = []
    var UbicationEvents:[String] = []
    var ImageEvents:[String] = []
    var position:Int = Int()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 150;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return nameEvents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let celda = tableView.dequeueReusableCell(withIdentifier: "EventosCompradasCelda", for: indexPath) as! EntradasCompradasTableViewCell
        
        
        celda.EventTitle.text = nameEvents[self.position]
        celda.EventUbication.text = UbicationEvents[self.position]
        celda.EventImage.image = UIImage(named: ImageEvents[self.position])
        celda.EventNumTickets.text = NumTicketsEvents[self.position]
        
        self.position += 1
        
        return celda
    }
    
}
