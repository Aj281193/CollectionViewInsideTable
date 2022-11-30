//
//  ViewController.swift
//  CollectionViewInsideTable
//
//  Created by Ashish Jaiswal on 06/02/21.
//  Copyright © 2021 Ashish Jaiswal. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var tableView: UITableView!
    var colorArray = Colors()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        let cellNib = UINib(nibName: "TableViewCell", bundle: nil)
        self.tableView.register(cellNib, forCellReuseIdentifier: "tableVieCellid")
    }
}

extension ViewController:UITableViewDataSource,UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return colorArray.objectsArray.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colorArray.objectsArray[section].subCategory.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .green
        let titleLabel = UILabel(frame: CGRect(x: 8, y: 0, width: 200, height: 44))
        headerView.addSubview(titleLabel)
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 20,weight: .bold)
        titleLabel.text = colorArray.objectsArray[section].category
        return headerView
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "tableVieCellid") as? TableViewCell{
            let subCategoryTitle = colorArray.objectsArray[indexPath.section].subCategory
            cell.subCategoryLabel.text = subCategoryTitle[indexPath.row]
            //pass data to collectionview inside tableViewcell
            let rowArray = colorArray.objectsArray[indexPath.section].color[indexPath.row]
            cell.updateCellWith(row: rowArray)
            cell.delegate = self
            return cell
        }
        return UITableViewCell()
    }
}
extension ViewController:CollectionViewDidTapped {
    func didTapped(collectionViewCell: CollectionViewCell, index: Int, didTappedtableViewCell: TableViewCell) {
        print(index)
        //print(didTappedtableViewCell.rowWithColor!)
        print(collectionViewCell.nameLabel!)
    }
}
