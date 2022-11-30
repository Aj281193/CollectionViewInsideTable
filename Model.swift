//
//  Model.swift
//  CollectionViewInsideTable
//
//  Created by Ashish Jaiswal on 06/02/21.
//  Copyright © 2021 Ashish Jaiswal. All rights reserved.
//

import UIKit

struct TableViewCellModel {
    var category:String
    var subCategory:[String]
    var color:[[CollectionViewCellModel]]
}

struct CollectionViewCellModel {
    var color:UIColor
    var name:String
}
