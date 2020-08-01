//
//  TableView+Extension.swift
//   VariousCells
//
//  Created by XQ on 2020/7/19.
//  Copyright © 2020年  . All rights reserved.
//

import UIKit

extension UITableView {
    func registerNibCellWithClassNames(_ names: [String]) {
        names.forEach { (n) in
            self.register(UINib.init(nibName: n, bundle: nil), forCellReuseIdentifier: n)
        }
    }
    
    func registerNibHeaderFooterWithClassNames(_ names: [String]) {
        names.forEach { (n) in
            self.register(UINib.init(nibName: n, bundle: nil), forHeaderFooterViewReuseIdentifier: n)
        }
    }
}
