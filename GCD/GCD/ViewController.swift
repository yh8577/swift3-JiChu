//
//  ViewController.swift
//  GCD
//
//  Created by jyh on 2017/12/6.
//  Copyright © 2017年 jyh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        loadData { (result) in
            print("获取新闻数据:\(result)")
        }
    }


    
    func loadData(completion: @escaping (_ result : [String]) -> () ) -> () {
        
        // 子线程
        DispatchQueue.global().async {
            print("耗时操作:\(Thread.current)")
            
            // 暂停1秒
            Thread.sleep(forTimeInterval: 1.0)
            
            let json = ["头条","八卦","出大事了"]
            
            // 回到主线程
            DispatchQueue.main.async(execute: {
                print("主线程更新UI \(Thread.current)")
                
                //回调 -> 执行闭包
                
                completion(json)
            })
        }
        
    }


}

