import UIKit

class quickPush: UIViewController {
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var shisan: UIButton!
    @IBOutlet var husai: UIButton!
    @IBOutlet var hiyou: UIButton!
    @IBOutlet var syueki: UIButton!
    @IBOutlet var sihon: UIButton!
    @IBOutlet var sonota: UIButton!
    @IBOutlet var score:UILabel!
    var questionRandom:Int=0
    var answer:Int=0
    var push :Int=0
    var shisanArray:[String] = ["現金","売掛金","当座預金"]
    var husaiArray: [String] = ["買掛金","借入金","当座借越"]
    var hiyouArray:[String] = ["旅費","消耗品費","雑費"]
    var syuekiArray:[String] = ["商品売買益","受取利息","受取家賃"]
    var shihonArray:[String] = ["資本金"]
    var otherArray:[String] = ["現金過不足","貸倒引当金","引出金"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
        //questionRandom = Int.random(in: 0 ... shisanArray.count-1)
        answer = Int.random(in: 0 ... 5)
        if(answer == 0){
            questionRandom = Int.random(in: 0 ... shisanArray.count - 1)
            questionLabel.text = shisanArray[questionRandom]
        }else if(answer == 1){
            questionRandom = Int.random(in: 0 ... husaiArray.count - 1)
            questionLabel.text = husaiArray[questionRandom]
        }else if(answer == 2){
            questionRandom = Int.random(in: 0 ... hiyouArray.count - 1)
            questionLabel.text = hiyouArray[questionRandom]
        }else if(answer == 3){
            questionRandom = Int.random(in: 0 ... syuekiArray.count - 1)
            questionLabel.text = syuekiArray[questionRandom]
        }else if(answer == 4){
            questionLabel.text = shihonArray[0]
        }else{
            questionRandom = Int.random(in: 0 ... otherArray.count - 1)
            questionLabel.text = otherArray[questionRandom]
        }
    }
    func scoreing(){
        if (answer == push){
            score.text = "正解"
        }else{
            score.text = "不正解"
        }
        return
    }
}
