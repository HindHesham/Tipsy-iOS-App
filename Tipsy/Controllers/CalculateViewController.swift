
import UIKit

class CalculateViewController: UIViewController, UITextFieldDelegate {

    var calculatorModel = CalculatorModel()
    
    @IBOutlet weak var billTextField: UITextField!
    
    
    @IBOutlet weak var zeroPctButton: UIButton!
    
    @IBOutlet weak var tenPctButton: UIButton!
    
    @IBOutlet weak var twentyPctButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.1
    var numberOfPeople = 2
    var retult2Decimel = "0.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billTextField.delegate = self
    }

    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        
        let buttonTitleDroppedLastPersentatge = buttonTitle.dropLast()
        let buttonDoubleValue = Double(buttonTitleDroppedLastPersentatge)!
        tip = buttonDoubleValue
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
  
        billTextField.endEditing(true)
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value) 
    }
    
    
    
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let bill = billTextField.text!

        if(bill != ""){
            let billTotal = Double(bill)!
            
            calculatorModel.calculateTips(billTotal: billTotal, tip: tip, numberOfPeople: numberOfPeople)
            
            self.performSegue(withIdentifier: "goToResult", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "goToResult"){
            let destinationVC = segue.destination as! ResultViewController
            
            destinationVC.total = calculatorModel.getFinalRetult2Decimel()
            destinationVC.split = calculatorModel.getNumberOfPeople()
            destinationVC.tip = calculatorModel.getTips()
        }
    }
}

