import UIKit

class ViewController: UIViewController {
    private var count: Int = 0
   
    @IBOutlet weak var textViewHistory: UITextView!
    @IBOutlet weak var labelCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func updateCounter(){
        if count >= 0{
            labelCount.text = "\(count)"
        } else{
            labelCount.text = "Mistake!"
        }
    }
    
    private func getCurrentTime() -> String {
            let date = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "MM-dd HH:mm:ss"
            return formatter.string(from: date)
        }
    
    private func updateHistory(change: String){
        let currentTime = getCurrentTime()
        let entry = "\n \(change) (\(currentTime))"
        if count >= 0{
            textViewHistory.text = entry + textViewHistory.text
        } else {
            textViewHistory.text = "\n Mistake!" + entry + textViewHistory.text
        }
    }

    @IBAction private func buttonPlus(_ sender: Any) {
        count += 1
        updateCounter()
        updateHistory(change: "+1 -> ")
        
    }
    
    @IBAction private func buttonMinus(_ sender: Any) {
        count = max(count - 1, -1)
        updateCounter()
        updateHistory(change: "-1 -> ")
    }
    
    @IBAction private func clearButton(_ sender: Any) {
        count = 0
        updateCounter()
        updateHistory(change: "0 -> ")
    }
}

