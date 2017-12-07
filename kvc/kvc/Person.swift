//
//  Person.swift
//  kvc
//
//  Created by jyh on 2017/12/7.
//  Copyright © 2017年 jyh. All rights reserved.
//

import UIKit

class Person: NSObject {
    
    var name : String!
    var age : Int = 0
    var title : String!
    
    
    override init() {
        
    }
    
    init(dict : [String : Any]) {
        
        super.init()
        
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forKey key: String) {
        super.setValue(value, forKey: key)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
    
   
//    override var description: String {
//        
//        let property = ["name", "age", "title"]
//        let dict = dictionaryWithValues(forKeys: property)
//        return "\(dict)"
//    }


    // 目标: [使用运行时] 获取当前类的所有属性
    class func propertyList() -> [String] {
        
        var count: UInt32 = 0
        var array = [String]()
        
        // 1.获取 '类' 的属性列表, 返回属性列表的数组,可选项.
        let list = class_copyPropertyList(self, &count)
        
        // 2.遍历数组
        for i in 0..<Int(count) {
            
            // 3.根据下标获取属性
            guard let pty = list?[i],
                  // 4.获取 '属性' 的名称 C 语言字符串
                  let cName = property_getName(pty)
            else {
                // 继续遍历下一个
                continue
            }

            // 5. 转换成 string 字符串
            let name = String(utf8String: cName)
            
            array.append(name!)
        }
        
        // 6. 释放 C 语言的对象
        free(list)
        
        return array
    }
}

