//
//  TimermemoViewController.swift
//  TimerMemo
//
//  Created by 神代黒薙 on 2024/08/23.
//

import UIKit

class TimerMemoViewController: UIViewController {
    
    @IBOutlet var timerLable: UILabel!
    @IBOutlet var titleTextFiels: UITextField!
    @IBOutlet var contentTextView: UITextView!
    
    var saveData: UserDefaults = UserDefaults.standard
    
    //メモのデータが入る配列
    var titles: [String] = []
    var contents:[String] = []
    //時間が入る変数
    var stadytime: String!
    var stadytimes: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextFiels.layer.borderColor = UIColor.black.cgColor
        titleTextFiels.layer.borderWidth = 1.0


        if let unwrapTitles = saveData.object(forKey: "title") as? [String] {
            titles = unwrapTitles
        } else {
            titles = []
        }
        
        if let unwrapContents = saveData.object(forKey: "content") as? [String] {
            contents = unwrapContents
        } else {
            contents = []
        }
        
        if let unwrapStadytimes = saveData.object(forKey: "stady") as? [String]{
            stadytimes = unwrapStadytimes
        } else {
            stadytimes = []
        }
        
        print(saveData.object(forKey: "title")as? String)
        
        timerLable.text = stadytime
        
       // titleTextFiels.text = saveData.object(forKey: "title")as? String
      //  contentTextView.text = saveData.object(forKey: "content")as? String
        
    }
    
    @IBAction func save() {
        titles.append(titleTextFiels.text ?? "")
        contents.append(contentTextView.text ?? "")
        stadytimes.append(timerLable.text ?? "")
        saveData.set(titles, forKey: "title")
        saveData.set(contents, forKey: "content")
        saveData.set(stadytimes, forKey: "stady")

        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
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
