//
//  ViewController.swift
//  表情包数据
//
//  Created by jyh on 2017/12/15.
//  Copyright © 2017年 jyh. All rights reserved.
//

import UIKit
/**
  1. 黄色文件夹,打包的时候,不会建立目录,主要保存程序文件
     素材文件不允许重名
  2. 蓝色文件夹,打包的时候,会建立目录,可以区分目录的文件素材文件
     不同目录的素材可以重名
     游戏的场景.background.png[草地/雪地/高山/坟墓]
     手机应用皮肤: 白天/夜间模式
     切记: 不要把程序文件放在蓝色文件夹中!
  3. .bundle
     通常用在第三方框架素材
     可以按照黄色文件的方式拖拽,同时会保留住目录结构
     可以避免文件重名
 */

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    

        /*
         注意这里需要倒序遍历
         
         必须使用倒序替换
         **/
        //
        let str = "我[爱你]啊[笑哈哈]!"
        label.attributedText = emoticonString(string: str)

    }
    
    //  将给定的字符串转换成属性文本
    func emoticonString(string: String) -> NSAttributedString {
        
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
                
                attrString.replaceCharacters(in: r, with: em.imageText(font: label.font))
            }
        }
        return attrString
    }
    
    
    
    
    func demo() {
        
        let emoti = HGEmoticonManager.shared
        
        //        print(emoti.package.last?.emoticons.first?.image)
        //        print(emoti.package.last?.emoticons.first)
        
        
        //        print(emoti.findEmoticon(string: "[笑哈哈]"))
        
        let em = emoti.findEmoticon(string: "[笑哈哈]")
        
        label.attributedText = em?.imageText(font: label.font)
    }

}

