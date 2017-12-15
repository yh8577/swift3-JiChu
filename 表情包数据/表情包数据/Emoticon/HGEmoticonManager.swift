//
//  HGEmoticonManager.swift
//  表情包数据
//
//  Created by jyh on 2017/12/15.
//  Copyright © 2017年 jyh. All rights reserved.
//

import Foundation

// 表情管理器
class HGEmoticonManager {
    
    // 为了便于表情的复用,建立一个单例,只加载一次数据
    static let shared = HGEmoticonManager()
    
    lazy var package = [HGEmoticonPackage]()
    
    // 构造函数,锁住单例
    private init() {
        
        loadPackages()
    }
}

// MARK: -  表情符号处理
extension HGEmoticonManager {
    
    
    /// 根据 string 在所有的表情符号中查找对于的表情模型对象
    ///
    /// - Parameter string: 查找的条件字符串
    /// - Returns: 如果查找到返回表情模型,如果没有找到返回 nil
    func findEmoticon(string: String) -> HGEmoticon? {
        
        // 遍历表情包
        // OC 中过滤数组使用[谓词]
        // swift 中更简单
        for p in package {
                // 在表情数组中过滤 string
            let result = p.emoticons.filter({ (em) -> Bool in
                return em.chs == string
            })
            
            // 判断结果数组的数量
            if result.count == 1 {
                return result[0]
            }
        }
        
        return nil
    }
    
}

// MARK: - 表情包数据处理
fileprivate extension HGEmoticonManager {
    
    func loadPackages() {
        
        guard let path = Bundle.main.path(forResource: "HMEmoticon.bundle", ofType: nil),
              let bunole = Bundle(path: path),
              let plistPath = bunole.path(forResource: "emoticons.plist", ofType: nil),
              let array = NSArray(contentsOfFile: plistPath) as? [[String: String]],
              let models = NSArray.yy_modelArray(with: HGEmoticonPackage.self, json: array) as? [HGEmoticonPackage]
            else {
                
            return
        }
        
        package += models
    }
}
