import UIKit
import AVFoundation

class quickPush: UIViewController {
    var saveDate:UserDefaults = UserDefaults.standard //ユーザーデフォルトにアクセス
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var shisan: UIButton!
    @IBOutlet var husai: UIButton!
    @IBOutlet var hiyou: UIButton!
    @IBOutlet var syueki: UIButton!
    @IBOutlet var sihon: UIButton!
    @IBOutlet var sonota: UIButton!
    @IBOutlet var score:UILabel!
    @IBOutlet var numberIndication:UILabel!
    var audioPlayer: AVAudioPlayer!
    var b:String = ""
    var usedQuestionArray:[String] = [] //出した問題
    var misQuestionArray:[String] = [] //間違えた問題
    
    
    var questionRandom:Int=0
    var answer:Int=0
    var push :Int=0
    var questionNumber:Int = 0
    
    var shisanUsesArray:[String] = ["現金","売掛金","当座預金","商品","建物","備品","機械","車両運搬具","土地","貸付金","繰越商品","立替金","銀行預金","小口現金","受取手形","有価証券","手形貸付金","未収入金","前払金","支払手付金","仮払金","前払費用","未収収益","消耗品","他店商品券"]
    var husaiUsesArray: [String] = ["買掛金","借入金","当座借越"]
    var hiyouUsesArray:[String] = ["旅費","消耗品費","雑費"]
    var syuekiUsesArray:[String] = ["商品売買益","受取利息","受取家賃"]
    var shihonUses:[String] = ["資本金"]
    var otherUsesArray:[String] = ["現金過不足","貸倒引当金","引出金"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Quiz()
        numberIndication.text = String(questionNumber + 1) + "問目"
        makeQuestion()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func shisanBottun(){
        push = 0
        scoreing()
        makeQuestion()
    }
    @IBAction func husaiBottun(){
        push = 1
        scoreing()
        makeQuestion()
    }
    @IBAction func hiyouBottun(){
        push = 2
        scoreing()
        makeQuestion()
    }
    @IBAction func syuekiBottun(){
        push = 3
        scoreing()
        makeQuestion()
    }
    @IBAction func shihonBottun(){
        push = 4
        scoreing()
        makeQuestion()
    }
    @IBAction func otherBottun(){
        push = 5
        scoreing()
        makeQuestion()
    }
    
    func makeQuestion(){
        var a:Int = 0
        answer = Int.random(in: 0 ... 5)
        
        if(answer == 0){
            a = shisanUsesArray.count - 1
            questionRandom = Int.random(in: 0 ... a)
            b = Quiz().shisanUsesArray[questionRandom]
            questionLabel.text = b
        }else if(answer == 1){
            a = husaiUsesArray.count - 1
            questionRandom = Int.random(in: 0 ... a)
            b = Quiz().husaiUsesArray[questionRandom]
            questionLabel.text = b
        }else if(answer == 2){
            a = hiyouUsesArray.count - 1
            questionRandom = Int.random(in: 0 ... a)
            b = Quiz().hiyouUsesArray[questionRandom]
            questionLabel.text = b
        }else if(answer == 3){
            a = syuekiUsesArray.count - 1
            questionRandom = Int.random(in: 0 ... a)
            b = Quiz().syuekiUsesArray[questionRandom]
            questionLabel.text = b
        }else if(answer == 4){
            a = syuekiUsesArray.count - 1
            questionRandom = Int.random(in: 0 ... a)
            b = Quiz().shihonUses[0]
            questionLabel.text = b
        }else{
            a = otherUsesArray.count - 1
            questionRandom = Int.random(in: 0 ... a)
            b = Quiz().otherUsesArray[questionRandom]
            questionLabel.text = b
        }
        
        usedQuestionArray.append(b)
    }
    func scoreing(){
        if (answer == push){
            let audioPath = URL(fileURLWithPath: Bundle.main.path(forResource:"正解",ofType:"mp3")!)
            audioPlayer = try? AVAudioPlayer(contentsOf:audioPath)
            audioPlayer.play()
            score.text = "正解"
        }else{
            let audioPath = URL(fileURLWithPath: Bundle.main.path(forResource:"不正解",ofType:"mp3")!)
            audioPlayer = try? AVAudioPlayer(contentsOf:audioPath)
            audioPlayer.play()
            score.text = "不正解"
            misQuestionArray.append(b)
        }
        questionNumber += 1
        numberIndication.text = String(questionNumber + 1) + "問目"
        if questionNumber >= 10{
            saveDate.set(usedQuestionArray,forKey: "isonami") //出題された問題
            saveDate.set(misQuestionArray, forKey: "murasame") //誤答した問題
            performSegue(withIdentifier: "goyousoAnswer", sender: nil)
        }
        return
    }
}

class Quiz {
    var shisanUsesArray:[String] = ["現金","売掛金","当座預金","商品","建物","備品","機械","車両運搬具","土地","貸付金","繰越商品","立替金","銀行預金","小口現金","受取手形","有価証券","手形貸付金","未収入金","前払金","支払手付金","仮払金","前払費用","未収収益","消耗品","他店商品券"]
    var husaiUsesArray: [String] = ["買掛金","借入金","当座借越"]
    var hiyouUsesArray:[String] = ["旅費","消耗品費","雑費"]
    var syuekiUsesArray:[String] = ["商品売買益","受取利息","受取家賃"]
    var shihonUses:[String] = ["資本金"]
    var otherUsesArray:[String] = ["現金過不足","貸倒引当金","引出金"]
}
