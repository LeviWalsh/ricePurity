//
//  ViewController.swift
//  ricePurity
//
//  Created by Levi Walsh on 7/12/17.
//  Copyright © 2017 Levi Walsh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var collectionView: UICollectionView!
    var numChecked: Int = 0
    
    // TODO make this an array of labels that have the text of each question
    var images = [UIImage(named: "rice1"), UIImage(named: "rice2"), UIImage(named: "rice3"), UIImage(named: "rice4"), UIImage(named: "rice5")]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupCollectionView()
        // addMoreImages()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Initializing a collectionView and adding it to the View Controllers current view
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collectionView.register(RiceCollectionViewCell.self, forCellWithReuseIdentifier: "riceCell")
        collectionView.backgroundColor = UIColor.white
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
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

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //specifying the number of sections in the collectionView
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //specifying the number of cells in the given section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    //Make the cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "riceCell", for: indexPath) as! RiceCollectionViewCell
        cell.awakeFromNib()
        cell.delegate = self
        return cell
    }
    
    //Fill in the cell with information
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let riceCell = cell as! RiceCollectionViewCell
        riceCell.riceImageView.image = images[indexPath.row]
    }
    
    //Sizes the cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.width / 10)
    }
    
     //To make something happen when a user taps a cell
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // TODO check if the button is checked or unchecked, if checked then decrement
        numChecked += 1
    }
    
}

extension ViewController: RiceCollectionViewCellDelegate {
    func changeColorOfButton(forCell: RiceCollectionViewCell) {
        // TODO make button background image into a checked box
        forCell.button.backgroundColor = UIColor.blue
    }
}
