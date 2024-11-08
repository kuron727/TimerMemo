//
//  LimitTimerViewController.swift
//  TimerMemo
//
//  Created by 神代黒薙 on 2024/10/11.
//

import UIKit

class LimitTimerViewController: UIViewController {

    var timer: Timer!
    @IBOutlet var numberseconds: UILabel!
    
    var number1: Int = 0
    var number2: Int = 0
    var number3: Int = 0
    var countdown: Int = 0
    var ope: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func select1(){
        number1 = number1*10 + 1
        
        CZ()
    }
    @IBAction func select2(){
        number1 = number1*10 + 2
        
        CZ()
    }
    @IBAction func select3(){
        number1 = number1*10 + 3
        
        CZ()
    }
    @IBAction func select4(){
        number1 = number1*10 + 4
        
        CZ()
    }
    @IBAction func select5(){
        number1 = number1*10 + 5
        
        CZ()
    }
    @IBAction func select6(){
        number1 = number1*10 + 6
        
        CZ()
    }
    @IBAction func select7(){
        number1 = number1*10 + 7
        
        CZ()
    }
    @IBAction func select8(){
        number1 = number1*10 + 8
        
        CZ()
    }
    @IBAction func select9(){
        number1 = number1*10 + 9
        
        CZ()
    }
    @IBAction func select0(){
        number1 = number1*10 + 0
        
        CZ()
    }
    @objc func onTimerCalled(){
        
       
        countdown -= 1
    }
    @IBAction func select(){
        
        countdown = number1
            
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerCalled), userInfo: nil, repeats: true)
            timer.fire()
       
    }
    func CZ(){
        let remainingTimes: Int = countdown/3600
        let remainingMinutes: Int = countdown / 60
        let remainingSeconds: Int = countdown % 60
        
        numberseconds.text = String(format: "%02d:%02d:%02d",remainingTimes, remainingMinutes, remainingSeconds)
    }
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
