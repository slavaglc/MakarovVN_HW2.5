

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultDescription: UILabel!
    
    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        checkAnswers()
    }
    
    private func checkAnswers() {
        let types = answers.map { $0.type }
        var frequentTypes = [AnimalType: Int]()
        types.forEach { frequentTypes[$0] = (frequentTypes[$0] ?? 0) + 1
        }
        if let (animal, _) = frequentTypes.max(by: {$0.1 < $1.1}) {
            resultLabel.text = "Вы - \(animal.rawValue)"
            resultDescription.text = animal.definition
        }
    }
    
}
