//
//  ViewController.swift
//  CollecitonViewDemo
//
//  Created by Pimpaporn Chaichompoo on 7/9/2564 BE.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
    }
    
    func prepareView() {
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        registerCollectionCells()
    }
    
    func registerCollectionCells() {
        
        collectionView.register(CollectionCell.self,
                                forCellWithReuseIdentifier: CollectionCell.identifier)
        collectionView.register(UINib(nibName: CollectionCell.identifier, bundle: nil),
                                forCellWithReuseIdentifier: CollectionCell.identifier)
    }
}

extension ViewController: UICollectionViewDelegate {
    
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let identifier: String = CollectionCell.identifier
        let cell: CollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier,
                                                                           for: indexPath) as! CollectionCell
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

//        let itemPerRow: CGFloat = 4 // **
//
//        let paddingSpace = UIEdgeInsets(top: 50, left: 20, bottom: 50, right: 20).left * (itemPerRow + 1)
//        let availableWidth = view.frame.width - paddingSpace
//        let widthPerItem = availableWidth / itemPerRow
//
//        return CGSize(width: widthPerItem, height: widthPerItem)
        
        let itemPerRow: CGFloat = 2 // **
        
        let paddingSpace = UIEdgeInsets(top: 50, left: 20, bottom: 50, right: 20).left * (itemPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemPerRow
        let newHeight = (widthPerItem * 134)/156
        return CGSize(width: widthPerItem, height: newHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 50, left: 20, bottom: 50, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int ) -> CGFloat {
        return UIEdgeInsets(top: 50, left: 20, bottom: 50, right: 20).left
    }
}
