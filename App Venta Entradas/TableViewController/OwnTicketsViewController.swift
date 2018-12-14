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
    var CodigosEvents:[String] = []
    var position:Int = Int()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        tableview.dataSource = self
        tableview.delegate = self
        tableview.rowHeight = 125
        //self.guardar()
        self.cargar()
        
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        self.position = 0
        self.cargar()
        tableview.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return nameEvents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let celda = tableView.dequeueReusableCell(withIdentifier: "EventosCompradasCelda", for: indexPath) as! EntradasCompradasTableViewCell
        
        if(self.position < nameEvents.count)
        {
            celda.EventTitle.text = nameEvents[self.position]
            celda.EventsUbications.text = UbicationEvents[self.position]
            celda.EventImage.image = UIImage(named: ImageEvents[self.position])
            celda.EventNumTickets.text = NumTicketsEvents[self.position] + " " + "Tickets"
            celda.Eventbtn.tag = indexPath.row
            
            self.position += 1
        }
      return celda
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let buttonPress = sender as! UIButton

        let celda = tableview.cellForRow(at: IndexPath.init(row: buttonPress.tag, section: 0)) as! EntradasCompradasTableViewCell
        
        let destino  = segue.destination as! DetalleViewController
        
        destino.NameEvent = nameEvents[buttonPress.tag]
        destino.ImageEvent = ImageEvents[buttonPress.tag]
        destino.TicketsEvent = NumTicketsEvents[buttonPress.tag]
        destino.UbicationEvent = UbicationEvents[buttonPress.tag]
        destino.CodeEvent = CodigosEvents[buttonPress.tag]
        
    }
    
    /* Guarda los datos en UserDefault */
    
    func guardar()
    {
        let EventsData = UserDefaults.standard
        
        EventsData.set(self.nameEvents, forKey: "nameEvents")
        EventsData.set(self.NumTicketsEvents, forKey: "NumTicketsEvents")
        EventsData.set(self.ImageEvents, forKey: "ImageEvents")
        EventsData.set(self.UbicationEvents, forKey: "UbicationEvents")
        EventsData.set(self.CodigosEvents, forKey: "CodigosEvents")
        
        
    }
    
    /* Carga los datos en UserDefault */
    
    func cargar()
    {
        let EventsData = UserDefaults.standard
        
        if(EventsData.object(forKey: "nameEvents") != nil)
        {
            self.nameEvents = EventsData.object(forKey: "nameEvents") as! [String]
            self.NumTicketsEvents = EventsData.object(forKey: "NumTicketsEvents") as! [String]
            self.ImageEvents = EventsData.object(forKey: "ImageEvents") as! [String]
            self.UbicationEvents = EventsData.object(forKey: "UbicationEvents") as! [String]
            self.CodigosEvents = EventsData.object(forKey: "CodigosEvents") as! [String]
        }
    }
}
