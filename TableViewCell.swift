//
//  TableViewCell.swift
//  CollectionViewInsideTable
//
//  Created by Ashish Jaiswal on 06/02/21.
//  Copyright © 2021 Ashish Jaiswal. All rights reserved.
//

import UIKit

protocol CollectionViewDidTapped {
    func didTapped(collectionViewCell:CollectionViewCell,index:Int,didTappedtableViewCell:TableViewCell)
}
class TableViewCell: UITableViewCell {

    var delegate:CollectionViewDidTapped?
    @IBOutlet weak var subCategoryLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var rowWithColor:[CollectionViewCellModel]?
    override func awakeFromNib() {
        super.awakeFromNib()
       
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 150, height: 180)
        flowLayout.minimumLineSpacing = 2.0
        flowLayout.minimumInteritemSpacing = 5.0
        self.collectionView.collectionViewLayout = flowLayout
        self.collectionView.showsHorizontalScrollIndicator = false
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        let cellNib = UINib(nibName: "CollectionViewCell", bundle: nil)
        self.collectionView.register(cellNib, forCellWithReuseIdentifier: "collectionViewCellid")
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension TableViewCell:UICollectionViewDelegate,UICollectionViewDataSource{
    
    func updateCellWith(row: [CollectionViewCellModel]){
        self.rowWithColor = row
        self.collectionView.reloadData()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.rowWithColor?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCellid", for: indexPath) as? CollectionViewCell{
            cell.colorView.backgroundColor = self.rowWithColor![indexPath.item].color
            cell.nameLabel.text = self.rowWithColor![indexPath.item].name
            return cell
        }
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
        self.delegate?.didTapped(collectionViewCell: cell, index: indexPath.item, didTappedtableViewCell: self)
    }
    
}
extension TableViewCell:UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
         return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
}
