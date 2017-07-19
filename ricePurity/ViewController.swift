//
//  ViewController.swift
//  ricePurity
//
//  Created by Levi Walsh on 7/12/17.
//  Copyright © 2017 Levi Walsh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tableView: UITableView!
    var numChecked: Int = 0
    var questions: [UILabel] = []
    
    
    
    // TODO make this an array of labels that have the text of each question
    var questions = ["Question 1","Question 2","Question 3","Question 4","Question 1","Question 1","Question 1","Question 1","Question 1","Question 1","Question 1","Question 1","Question 1","Question 1","Question 1","Question 1","Question 1"]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // var question1: UILabel
        var question2: UILabel
        
        question1.text = "Held HAnds"
        
        createLabels()
        questions.append(question1)
        
        
        setupCollectionView()
        addTextToLabels()
        // addMoreImages()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Initializing a collectionView and adding it to the View Controllers current view
    func setupCollectionView() {
        tableView = UITableView(frame: view.frame)
        tableView.register(RiceTableViewCell.self, forCellReuseIdentifier: "riceCell")
        tableView.backgroundColor = UIColor.white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false;
        view.addSubview(tableView)
    }
    
    func addTextToLabels() {
        //setLabelText()
//        setLabelText(question2, "Held hands")
    }
 
    func createLabels() {
        //question1.text = "Held Hands"
        
    }
/*
    // Shouldn't need this function but it's helpful just in case
     func addMoreImages() {
        let moreImages = [UIImage(named: "mission6"), UIImage(named: "mission7")]
        images.append(contentsOf: moreImages)
        collectionView.reloadData()
     }
*/
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "riceCell") as! RiceTableViewCell
        
        for subview in cell.contentView.subviews{
            subview.removeFromSuperview()
        }
        
        cell.awakeFromNib()
        cell.delegate = self
        cell.riceLabel.text = questions[indexPath.row]
        return cell
        
    }
    
    //specifying the number of sections in the collectionView
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
}

extension ViewController: RiceCollectionViewCellDelegate {
    func changeColorOfButton(forCell: RiceTableViewCell, state: Bool) {
        if state {
            numChecked -= 1
            forCell.button.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
        } else {
            numChecked += 1
            forCell.button.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
        }
        forCell.state = !forCell.state
        print(numChecked)
    }
}


