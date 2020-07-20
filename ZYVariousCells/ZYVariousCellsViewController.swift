//
//  ZYVariousCellsViewController.swift
//  ZYVariousCells
//
//  Created by XQ on 2020/7/18.
//  Copyright © 2020年 ZY. All rights reserved.
//

import UIKit

protocol ZYTableViewCellType {
    static func allRawValues() -> [String]
}

protocol ZYTableViewCell: NSObjectProtocol{
    func bindCellModel(_ model: ZYVariousCellDataModel)
}

protocol ZYTableViewCellRegisterDelegate {
    weak var tableView: UITableView! { get set}
    func tableViewCellNibClasses() -> [ZYTableViewCell.Type]
}

protocol ZYVariousCellDataModel {
    var cellType: ZYTableViewCell.Type{ get }
}

class ZYVariousCellsViewController: ZYBaseViewController, ZYTableViewCellRegisterDelegate {
    ///使用Cell的 classname作为枚举值的rawValue,实现ZYTableViewCellType
    enum VariousCellType: String, ZYTableViewCellType {
        case typeOne = "ZYTypeOneCell"
        case typeTwo = "ZYTypeTwoCell"
        case typeThree = "ZYTypeThreeCell"
        
        static func allRawValues() -> [String] {
            return [VariousCellType.typeOne.rawValue,
                    VariousCellType.typeTwo.rawValue,
                    VariousCellType.typeThree.rawValue]
        }
    }
    
    var cellDataSource: [ZYVariousCellDataModel] = [ZYCellOneModel(),ZYCellTwoModel(),ZYCellThreeModel()]

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerNibCellWithClassNames(VariousCellType.allRawValues())
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ZYVariousCellsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch cellDataSource[indexPath.row].cellType {
        case .typeOne:
            return onbindCellDataModel(tableView: tableView, model: cellDataSource[indexPath.row]) as ZYTypeOneCell
        case .typeTwo:
            return onbindCellDataModel(tableView: tableView, model: cellDataSource[indexPath.row]) as ZYTypeTwoCell
        case .typeThree:
            return onbindCellDataModel(tableView: tableView, model: cellDataSource[indexPath.row]) as ZYTypeThreeCell
        }
    }
    
    func onbindCellDataModel<T: ZYTableViewCell>(tableView: UITableView, model: ZYVariousCellDataModel) -> T {
        let cell = tableView.dequeueReusableCell(withIdentifier: model.cellType.rawValue) as! T
        cell.bindCellModel(model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellDataSource.count
    }
    
}

extension ZYVariousCellsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.popViewController(animated: true)
    }
}
