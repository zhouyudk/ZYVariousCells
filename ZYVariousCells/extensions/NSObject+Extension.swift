//
//  NSObject+Extension.swift
//   VariousCells
//
//  Created by XQ on 2020/7/19.
//  Copyright © 2020年  . All rights reserved.
//

import Foundation

public extension NSObject {
    static var className: String {
        return NSStringFromClass(self).components(separatedBy: ".").last ?? ""
    }
    
    var className: String {
        return NSStringFromClass(type(of: self)).components(separatedBy: ".").last ?? ""
    }
}
