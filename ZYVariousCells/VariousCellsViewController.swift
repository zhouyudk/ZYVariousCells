//
//   VariousCellsViewController.swift
//   VariousCells
//
//  Created by XQ on 2020/7/18.
//  Copyright © 2020年  . All rights reserved.
//

import UIKit

protocol TableViewCellType {
    static func allRawValues() -> [String]
}

class VariousCellsViewController: UIViewController {
    ///使用Cell的 classname作为枚举值的rawValue,实现 TableViewCellType
    
    
    var cellModels = [ VariousCellModel]()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerNibCellWithClassNames(VariousCellModel.CellType.allRawValues())
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension VariousCellsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = cellModels[indexPath.row].cellType
        switch cellType {
        case .firstCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellType.rawValue) as! FirstCell
            //进行数据绑定 和 cell中子空间操作事件的action绑定
            //bindDataModel
            //bindActions
            return cell
        case .secondCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellType.rawValue) as! SecondCell
            return cell
        case .thirdCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellType.rawValue) as! ThirdCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellModels.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellModels[indexPath.row].cellType.height()
    }
    
}

extension  VariousCellsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.popViewController(animated: true)
    }
}

class VariousCellModel {

    //将cell UI相关的属性定义在此，实际开发中可使用构造器
    var dataModel: BaseModel = BaseModel()
    var cellType: CellType = CellType.firstCell
    
    //cell类型枚举
    enum CellType: String, TableViewCellType {
        case firstCell = "FirstCell"
        case secondCell = "SecondCell"
        case thirdCell = "ThirdCell"
        
        static func allRawValues() -> [String] {
            return [CellType.firstCell.rawValue,
                    CellType.secondCell.rawValue,
                    CellType.thirdCell.rawValue]
        }
        
        func height() -> CGFloat {
            switch self {
            case .firstCell: return 20
            case .secondCell: return 30
            case .thirdCell: return 40
            }
        }
    }
}
