//
//  TableView+Extension.swift
//  ZYVariousCells
//
//  Created by XQ on 2020/7/19.
//  Copyright © 2020年 ZY. All rights reserved.
//

import UIKit

extension UITableView {
    func registerNibCellWithClasses(_ classes: [ZYTableViewCell.Type]) {
        classes.forEach { (c) in
            self.register(UINib.init(nibName: c.className, bundle: nil), forCellReuseIdentifier: c.className)
        }
    }
    
    func registerNibHeaderFooterWithClasses(_ classes: [UITableViewHeaderFooterView.Type]) {
        classes.forEach { (c) in
            self.register(UINib.init(nibName: c.className, bundle: nil), forHeaderFooterViewReuseIdentifier: c.className)
        }
    }
}
