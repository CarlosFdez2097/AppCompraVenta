
import UIKit


class BuyViewController: UIViewController , UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var tableView: UITableView!
    
    var nameEvents:[String] = ["primer evento","segundo evento","tercer evento"]
    var MoneyEvents:[String] = ["10","15","20"]
    var UbicationEvents:[String] = ["madrid","barcelona","valencia"]
    var ImageEvents:[String] = ["EventoColores","Eventos2","Tomorroland"]
    
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
        let celda = tableView.dequeueReusableCell(withIdentifier: "EventosCelda", for: indexPath) as! CompraDeEntradasCell
        

        celda.EventTitle.text = nameEvents[self.position]
        celda.EventUbication.text = UbicationEvents[self.position]
        celda.EventMoney.text = MoneyEvents[self.position]
        celda.price = Int(MoneyEvents[self.position])!
        celda.EventImage.image = UIImage(named: ImageEvents[self.position])
        celda.EventSlider.value = 1
        celda.EventNumTickets.text = "1"
        celda.EventBut.tag = indexPath.row
        
        self.position += 1
        return celda
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let buttonPress = sender as! UIButton
        

        var celda = tableView.cellForRow(at: IndexPath.init(row: buttonPress.tag, section: 0)) as! CompraDeEntradasCell
        
        var destino  = segue.destination as! OwnTicketsViewController
        
        destino.nameEvents.append(celda.EventTitle)
        
        }
    }
        

