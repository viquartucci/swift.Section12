
import UIKit

class ResultsViewController: UIViewController {
    
    var totalPerPerson1: String?
    var textDescription1: String?
    
    @IBOutlet weak var totalPerPerson: UILabel!
    @IBOutlet weak var textDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalPerPerson.text = totalPerPerson1
        textDescription.text = textDescription1
        
    }

    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
