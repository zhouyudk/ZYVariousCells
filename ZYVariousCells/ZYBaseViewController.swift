//
//  ZYBaseViewController.swift
//  ZYVariousCells
//
//  Created by XQ on 2020/7/19.
//  Copyright © 2020年 ZY. All rights reserved.
//

import UIKit

class ZYBaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
//        registerTableCell(<#T##types: [String]##[String]#>)
    }
    
    func initView() {
        fatalError("重写initView，别调用super.initView")
    }
    
    func registerTableCell(_ types: [String]) {
        if let vc = self as? ZYViewControllerWithTable {
            vc.tableView.registerNibCellWithClassNames(types)
        }
    }
    
    
    
}
