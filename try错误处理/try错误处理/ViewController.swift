//
//  ViewController.swift
//  try错误处理
//
//  Created by jyh on 2017/12/9.
//  Copyright © 2017年 jyh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 推荐使用方法1或方法3.方法2不建议使用
        
        let jsonStr = "{\"name\":\"张\"}"
        
        let data = jsonStr.data(using: .utf8)
        
        let json1 = try? JSONSerialization.jsonObject(with: data!, options: [])
        
        print(json1)
        
//        let json2 = try! JSONSerialization.jsonObject(with: data!, options: [])
//        
//        print(json2)
        
//        do {
//            
//            let json3 = try JSONSerialization.jsonObject(with: data!, options: [])
//            print(json3)
//
//        } catch {
//            print(error)
//        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

