//
//  ViewController.swift
//  动态加载json
//
//  Created by jyh on 2017/12/9.
//  Copyright © 2017年 jyh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        DispatchQueue.global().async {
            
            let url = Bundle.main.url(forResource: "main.json", withExtension: nil)
            
            let data = NSData(contentsOf: url!)
            
            let jsonPath = "main.json".docDir()
            
            data?.write(toFile: jsonPath, atomically: true)
            
            print(jsonPath)
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

