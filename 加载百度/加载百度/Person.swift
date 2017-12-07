//
//  Person.swift
//  加载百度
//
//  Created by jyh on 2017/12/7.
//  Copyright © 2017年 jyh. All rights reserved.
//

import UIKit

class Person: NSObject {

    var name : String?
    var age : Int = 0
    
    
    // 便利构造函数
    convenience init?(name: String, age: Int) {
        
        if age > 100 {
            return nil
        }
        
        self.init()
        
        self.name = name
        self.age = age
        
    }
    
    override init() {
        super.init()
    }
}
