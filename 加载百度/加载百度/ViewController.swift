//
//  ViewController.swift
//  加载百度
//
//  Created by jyh on 2017/12/7.
//  Copyright © 2017年 jyh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let p = Person(name: "张三", age: 109)
        
        print("\(String(describing: p?.name)) \(String(describing: p?.age))")

    }
    
    
    private func loadNetWork() {
        
        guard let url = URL(string: "http://www.baidu.com") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            
            guard let data = data else {
                
                print("加载网页失败:\(error!)")
                return
            }
            
            let html = String(data: data, encoding: .utf8)
            
            print(html!)
            
            }.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

