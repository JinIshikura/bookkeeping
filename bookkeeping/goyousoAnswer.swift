import UIKit

class goyousoAnswer: UIViewController {
    var saveDate:UserDefaults = UserDefaults.standard
    
    var shisanUsesArray:[String] = ["現金","売掛金","当座預金","商品","建物","備品","機械","車両運搬具","土地","貸付金","繰越商品","立替金","銀行預金","小口現金","受取手形","有価証券","手形貸付金","未収入金","前払金","支払手付金","仮払金","前払費用","未収収益","消耗品","他店商品券"]
    var husaiUsesArray: [String] = ["買掛金","借入金","当座借越"]
    var hiyouUsesArray:[String] = ["旅費","消耗品費","雑費"]
    var syuekiUsesArray:[String] = ["商品売買益","受取利息","受取家賃"]
    var shihonUses:[String] = ["資本金"]
    var otherUsesArray:[String] = ["現金過不足","貸倒引当金","引出金"]
    
    @IBOutlet weak internal var textView: UITextView!
    var usedQuestionArray:[String] = []
    var misQuestionArray:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        usedQuestionArray = saveDate.object(forKey:"isonami") as! [String]
        misQuestionArray = saveDate.object(forKey:"murasame") as! [String]
        
        textView.text = usedQuestionArray[0]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func SaveDate(){
        
        
    }
    
    
}
