
import UIKit

class CalculatorViewController: UIViewController {
    
    var tipSelected: Float?
    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var splitNumber: Float = 0
    var billText: Float = 0
    
    override func viewDidLoad() {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        splitNumberLabel.text = "0"
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        if sender.currentTitle == "0%" {
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            tipSelected = Float(0.0)
            billTextField.endEditing(true)
        }
        else if sender.currentTitle == "10%" {
            tenPctButton.isSelected = true
            zeroPctButton.isSelected = false
            twentyPctButton.isSelected = false
            tipSelected = Float(0.1)
            billTextField.endEditing(true)
            
        }
        else if sender.currentTitle == "20%" {
            twentyPctButton.isSelected = true
            tenPctButton.isSelected = false
            zeroPctButton.isSelected = false
            tipSelected = Float(0.2)
            billTextField.endEditing(true)
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        sender.minimumValue = 0
        sender.stepValue = 1
        sender.maximumValue = 12
        splitNumberLabel.text = Int(sender.value).description
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
       
        splitNumber = (splitNumberLabel.text! as NSString).floatValue
        billText = (billTextField.text! as NSString).floatValue
        calculatorBrain.calculateTotalPerPeron(splitNumber: splitNumber, billText: billText, tipSelected: tipSelected ?? 0.0)
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.totalPerPerson1 = calculatorBrain.getTotalPerPerson()
            destinationVC.textDescription1 = calculatorBrain.getTextDescription()
        }
    }
}

