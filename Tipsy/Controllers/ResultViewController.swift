

import UIKit

class ResultViewController: UIViewController {
    
    var total : String?
    var tip : String?
    var split : String?
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = total
        settingsLabel.text = "Split between \(split!) people, with \(tip!)% tip."

        
    }
    
    @IBAction func recalculatePressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
   

}
