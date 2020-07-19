//
//  ViewController.swift
//  ZYVariousCells
//
//  Created by XQ on 2020/7/18.
//  Copyright © 2020年 ZY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onClickToTableButton(_ sender: UIButton) {
        self.navigationController?.pushViewController(ZYVariousCellsViewController(), animated: true)
    }


}

