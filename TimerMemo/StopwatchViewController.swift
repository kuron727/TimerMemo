//
//  StopwatchViewController.swift
//  TimerMemo
//
//  Created by 神代黒薙 on 2024/08/23.
//

import UIKit

class StopwotchiViewController: UIViewController {
    
    var timer: Timer!
    var stopwatch:Int = 0;
    var stopwatchRunning: Bool = false
   
    
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //TimerMemoViewControllerにストップウォッチの時間を送信
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "next" {
            let timerMemoViewController = segue.destination as! TimerMemoViewController
            timerMemoViewController.stadytime = label.text!
        }
    }
    
    @objc func onTimerCalled() {
        if stopwatchRunning == true {
            stopwatch += 1
            let elapsedMinutes: Int = stopwatch / 60
            let elapsedSeconds: Int = stopwatch % 60
            
            label.text = String(format: "%02d:%02d", elapsedMinutes, elapsedSeconds)
        }
        
    }
    
    @IBAction func start() {
        
        if stopwatchRunning == false{
            if timer != nil {
                timer.invalidate()
            }
            stopwatchRunning = true
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerCalled), userInfo: nil, repeats: true)
            
        }
        
    }
    
    @IBAction func stop() {
        stopwatchRunning = false
    }
    
    @IBAction func reset() {
        if timer != nil {
            timer.invalidate()
        }
        stopwatch = 0
        stopwatchRunning = false
        label.text = "00:00"
        
    }
    
    @IBAction func nextButton() {
        
    }
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


