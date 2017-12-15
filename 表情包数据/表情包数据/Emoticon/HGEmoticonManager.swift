//
//  HGEmoticonManager.swift
//  表情包数据
//
//  Created by jyh on 2017/12/15.
//  Copyright © 2017年 jyh. All rights reserved.
//

import UIKit

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
    fileprivate func findEmoticon(string: String) -> HGEmoticon? {
        
        // 遍历表情包
        // OC 中过滤数组使用[谓词]
        // swift 中更简单
        for p in package {
            
            // 在表情数组中过滤 string
            /*
            // 方法1
            let result = p.emoticons.filter({ (em) -> Bool in
                return em.chs == string
            })
            
            // 方法2 尾随闭包
            let result = p.emoticons.filter() { (em) -> Bool in
                return em.chs == string
            }
            // 方法3 如果闭包中只有一句,并且是返回
            // 闭包格式定义可以省略,使用$0-$1...依次替代原有参数
            let result = p.emoticons.filter() {
                return $0.chs == string
            }
            */
            // 方法4 如果闭包中只有一句,并且是返回
            // 闭包格式定义可以省略,使用$0-$1...依次替代原有参数
            // return 也可以省略
            let result = p.emoticons.filter() { $0.chs == string }
            
            // 判断结果数组的数量
            if result.count == 1 {
                return result[0]
            }
        }
        
        return nil
    }
    
}

// MARK: - 表情包数据处理
extension HGEmoticonManager {
    
    //  将给定的字符串转换成属性文本
    func emoticonString(string: String, font: UIFont) -> NSAttributedString {
        
        let attrString = NSMutableAttributedString(string: string)
        
        // 建立正则表达式,过滤所有的表情文字
        // [] () 都是正则表达式的关键字,如果要参与匹配,都需要转义
        let pattern = "\\[.*?\\]"
        
        guard let regx = try? NSRegularExpression(pattern: pattern, options: []) else {
            return attrString
        }
        
        // 匹配所有项
        let matches = regx.matches(in: string, options: [], range: NSRange(location: 0, length: attrString.length))
        
        // 遍历所有匹配结果
        for m in matches.reversed() {
            
            let r = m.rangeAt(0)
            let subStr = (attrString.string as NSString).substring(with: r)
            
            // 使用subStr 查找对应的符号
            if let em = HGEmoticonManager.shared.findEmoticon(string: subStr) {
                
                attrString.replaceCharacters(in: r, with: em.imageText(font: font))
            }
        }
        
        // 统一设置一遍字符串的属性
        attrString.addAttributes([NSFontAttributeName: font], range: NSRange(location: 0, length: attrString.length))
        
        return attrString
    }
    
    fileprivate func loadPackages() {
        
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
