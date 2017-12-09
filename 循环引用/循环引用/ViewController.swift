//
//  ViewController.swift
//  循环引用
//
//  Created by jyh on 2017/12/8.
//  Copyright © 2017年 jyh. All rights reserved.
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

    deinit {
        print("vc ")
    }

    @IBAction func click(_ sender: Any) {
        
        present(TableViewController(), animated: true, completion: nil)
    }

}

