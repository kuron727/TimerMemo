//
//  ViewController.swift
//  TimerMemo
//
//  Created by 神代黒薙 on 2024/08/23.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource{
    
    @IBOutlet var collectionView: UICollectionView!
    
    @IBOutlet var testlabel: UILabel!
    
    var saveData: UserDefaults = UserDefaults.standard
    
    var titles: [String] = []
    
    var contents: [String] = []
    
    var stadytimes: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       

//        saveData.register(defaults: ["title": [], "content":[] ])
        
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
        
        collectionView.dataSource = self
        
        let configuration = UICollectionLayoutListConfiguration(appearance: .plain)
        collectionView.collectionViewLayout = UICollectionViewCompositionalLayout.list(using: configuration)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Re-fetch data from UserDefaults
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
        
        // Debug: Print the fetched data
            print("Titles: \(titles)")
            print("Contents: \(contents)")
            
        
        // Reload the collectionView data
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        var countentConfiguration = UIListContentConfiguration.cell()
        
        countentConfiguration.text = titles[indexPath.item]
        
        countentConfiguration.secondaryText = stadytimes[indexPath.item]
        
        //countentConfiguration.text =
        
        cell.contentConfiguration = countentConfiguration
        
        return cell
    }
}

