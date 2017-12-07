//
//  ViewController.swift
//  kvc
//
//  Created by jyh on 2017/12/7.
//  Copyright © 2017年 jyh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
   
//        let p = Person()
//        p.name = "老子"
//        p.age = 190
//        p.title = "BOSS"
//        print("\(p.name) + \(p.age) + \(p.title)")
        
//        let s = Student()
//        s.name = "老子"
//        s.age = 190
//        s.title = "BOSS"
//        s.no = 200
//        print("\(s.name) + \(s.age) + \(s.title) + \(s.no) ")
        
        print(Person.propertyList())
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

