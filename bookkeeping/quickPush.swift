import UIKit
import AVFoundation

class quickPush: UIViewController {
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
        numberIndication.text = String(questionNumber + 1) + "問目"
        makeQuestion()
        
        /****************************************
        *選択した勘定科目だけが出題されるようにしたい。
        ****************************************/
//        shisanUsesArray = shisanFArray
//        husaiUsesArray = husaiFArray
//        hiyouUsesArray = hiyouFArray
//        syuekiUsesArray = syuekiFArray
//        shihonUses = shihonF
//        otherUsesArray = otherFArray
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
            questionLabel.text = shisanUsesArray[questionRandom]
        }else if(answer == 1){
            a = husaiUsesArray.count - 1
            questionRandom = Int.random(in: 0 ... a)
            questionLabel.text = husaiUsesArray[questionRandom]
        }else if(answer == 2){
            a = hiyouUsesArray.count - 1
            questionRandom = Int.random(in: 0 ... a)
            questionLabel.text = hiyouUsesArray[questionRandom]
        }else if(answer == 3){
            a = syuekiUsesArray.count - 1
            questionRandom = Int.random(in: 0 ... a)
            questionLabel.text = syuekiUsesArray[questionRandom]
        }else if(answer == 4){
            a = syuekiUsesArray.count - 1
            questionRandom = Int.random(in: 0 ... a)
            questionLabel.text = shihonUses[0]
        }else{
            a = otherUsesArray.count - 1
            questionRandom = Int.random(in: 0 ... a)
            questionLabel.text = otherUsesArray[questionRandom]
        }
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
        }
        questionNumber += 1
        numberIndication.text = String(questionNumber + 1) + "問目"
        if questionNumber >= 3{
            performSegue(withIdentifier: "goyousoAnswer", sender: nil)
        }
        return
    }
}
