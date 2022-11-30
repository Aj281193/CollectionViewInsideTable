//
//  CollectionViewCell.swift
//  CollectionViewInsideTable
//
//  Created by Ashish Jaiswal on 06/02/21.
//  Copyright © 2021 Ashish Jaiswal. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
