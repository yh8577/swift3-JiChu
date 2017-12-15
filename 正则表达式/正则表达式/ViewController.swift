//
//  ViewController.swift
//  正则表达式
//
//  Created by jyh on 2017/12/15.
//  Copyright © 2017年 jyh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let str = "xxx<a href=\"http://app.weibo.com/t/feed/6vtZb0\" fdsfsfdsfsdfsf rel=\"nofollow\">微博 weibo.com</a>zzz"
        

        
        let result = str.hg_href()
        
        print(result?.link)
        print(result?.text)
    
    }
    
    
    func demo() {
        let str = "xxx<a href=\"http://app.weibo.com/t/feed/6vtZb0\" fdsfsfdsfsdfsf rel=\"nofollow\">微博 weibo.com</a>zzz"
        
        let pattern = "<a href=\"(.*?)\".*?>(.*?)</a>"
        //创建正则表达式
        // 索引0: 和匹配方案完全一致的字符串
        // 索引1: 第一个 () 中的内容
        // 索引2: 第二个 () 中的内容
        // ...索引从左向右顺序递增
        // 对于模糊匹配,如果关心得内容,就是用(.*?),然后通过索引可以获取结果
        // 如果过不关心得内容 ,就是.*?,可以匹配任意内容
        // pattern - 匹配的方案
        guard let regx: NSRegularExpression = try? NSRegularExpression(pattern: pattern, options: []) else {
            return
        }
        
        // 进行查找.两种查找方法
        // 只找第一个匹配项 / 查找多个匹配项
        guard let result = regx.firstMatch(in: str, options: [], range: NSRange(location: 0, length: str.characters.count)) else {
            
            print("没有找到匹配项")
            return
        }
        
        
        // result 中只有两个重要的方法
        // result.numberOfRanges -> 查找到的范围
        // result.rangeAt(<#T##idx: Int##Int#>) -> 指定 '索引' 位置的范围
        
        print("找到了: \(result.numberOfRanges)")
        
        for idx in 0..<result.numberOfRanges {
            // print(result.rangeAt(idx))
            let r = result.rangeAt(idx)
            
            let subStr = (str as NSString).substring(with: r)
            
            print(subStr)
        }
        
        
        /**
         正则表达式: 匹配 字符串, 进行模糊查找
         . 匹配任意字符,回车除外
         * 匹配任意多次
         ? 尽量少的匹配
         
         正则表达式不是 oc 特有的,几乎所有的语言/IDE,都支持正则表达式
         
         let array = ["red,": UIColor.red,
         "red": UIColor.green,
         "red": UIColor.orange,
         "red": UIColor.blue,
         "red": UIColor.black,
         "red": UIColor.brown,
         "red": UIColor.gray,
         "red": UIColor.darkGray]
         
         "(.*?)": UIColor\.(.*)
         
         "$2": UIColor\.$2
         */
        
        //      let array = ["red,": UIColor.red,
        //                     "green,": UIColor.green,
        //                     "orange,": UIColor.orange,
        //                     "blue,": UIColor.blue,
        //                     "black,": UIColor.black,
        //                     "brown,": UIColor.brown,
        //                     "gray,": UIColor.gray,
        //                     "darkGray]": UIColor.darkGray]
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



