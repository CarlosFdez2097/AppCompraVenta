
import UIKit
import Foundation


class BuyViewController: UIViewController , UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var tableView: UITableView!
    
    var nameEvents:[String] = ["UMF","Cavo De Plata","Tomorroland"]
    var MoneyEvents:[String] = ["10","15","20"]
    var DateEvents:[String] = []
    var ImageEvents:[String] = ["EventoColores","Eventos2","Tomorroland"]
    
    var position:Int = Int()
    var clave:UInt32 = 36
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 150;
        
        DateEvents.append(crearfecha(year: 2019, month: 10, day: 20))
        DateEvents.append(crearfecha(year: 2018, month: 1, day: 22))
        DateEvents.append(crearfecha(year: 2020, month: 10, day: 25))
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        self.position = 0
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return nameEvents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let celda = tableView.dequeueReusableCell(withIdentifier: "EventosCelda", for: indexPath) as! CompraDeEntradasCell
        
        if(self.position < nameEvents.count)
        {
            celda.EventTitle.text = nameEvents[self.position]
            celda.EventUbication.text = DateEvents[self.position]
            celda.EventMoney.text = MoneyEvents[self.position] + " " + "$"
            celda.price = Int(MoneyEvents[self.position])!
            celda.EventImage.image = UIImage(named: ImageEvents[self.position])
            celda.EventSlider.value = 1
            celda.EventNumTickets.text = "1 Tickets"
            celda.EventBut.tag = indexPath.row
            
            self.position += 1
        }
        return celda
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let buttonPress = sender as! UIButton
        
        let celda = tableView.cellForRow(at: IndexPath.init(row: buttonPress.tag, section: 0)) as! CompraDeEntradasCell
        
        let codigo = cifrado(mensaje: String(Int(arc4random_uniform(1000000000))), clave: clave)
        
        let datosTabla = OwnTicketsViewController()
        
        datosTabla.cargar()
        datosTabla.nameEvents.append(celda.EventTitle.text!)
        datosTabla.ImageEvents.append(ImageEvents[buttonPress.tag])
        datosTabla.NumTicketsEvents.append(String(Int(celda.EventSlider.value)))
        datosTabla.UbicationEvents.append(celda.EventUbication.text!)
        datosTabla.CodigosEvents.append(codigo)
        datosTabla.guardar()
        
        let destino  = segue.destination as! DetalleViewController
        
        destino.NameEvent = celda.EventTitle.text!
        destino.ImageEvent = ImageEvents[buttonPress.tag]
        destino.TicketsEvent = String(Int(celda.EventSlider.value))
        destino.UbicationEvent = celda.EventUbication.text!
        destino.CodeEvent = codigo
        destino.despegable = true
    }
    
    /* Este metdo crifra un string */
    
    func cifrado(mensaje: String, clave: UInt32) -> String {
        var mensajeCifrado = ""
        for letra in mensaje {
            var numero = letraANumero(letra: letra)
            numero += clave
            let letraCifrada = numeroALetra(numero: numero)
            mensajeCifrado.append(letraCifrada)
        }
        return mensajeCifrado
    }
    
    /* Es un metdo que pasa de letra a numero */
    
    func letraANumero(letra: Character) -> UInt32 {
        return UnicodeScalar(String(letra))!.value
    }
    
    /* Es un metdo que pasa de numero a letra */
    
    func numeroALetra(numero: UInt32) -> Character {
        return Character(UnicodeScalar(numero)!)
    }
    
    /* Es un metodo que crea un fecha con tres int */
    
    func crearfecha(year:Int , month:Int , day:Int ) -> String
    {
        var firstDateComponents = DateComponents()
        
        firstDateComponents.day = day
        firstDateComponents.month = month
        firstDateComponents.year = year
        
        let firstDate = Calendar(identifier: Calendar.Identifier.gregorian).date(from: firstDateComponents)
        
        let dateStringFormatter = DateFormatter()
        
        dateStringFormatter.dateFormat = "dd/MM/yyyy"
        
        print(dateStringFormatter.string(from: firstDate!))
        
        return dateStringFormatter.string(from: firstDate!)
    }
}
        

