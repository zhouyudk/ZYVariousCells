//
//  ZYCellDataModel.swift
//  ZYVariousCells
//
//  Created by XQ on 2020/7/18.
//  Copyright © 2020年 ZY. All rights reserved.
//

import UIKit


class ZYCellOneModel: ZYVariousCellDataModel {
    var cellType: ZYTableViewCell.Type = ZYTypeOneCell.self
}

class ZYCellTwoModel: ZYVariousCellDataModel {
    var cellType: ZYTableViewCell.Type = ZYTypeTwoCell.self
    
}

class ZYCellThreeModel: ZYVariousCellDataModel {
    var cellType: ZYTableViewCell.Type = ZYTypeThreeCell.self
    
}
