//
//  HGEmoticonPackage.swift
//  表情包数据
//
//  Created by jyh on 2017/12/15.
//  Copyright © 2017年 jyh. All rights reserved.
//

import UIKit
import YYModel

// 表情包模型
class HGEmoticonPackage: NSObject {

    // 表情包的分组名称
    var groupName: String?
    
    // 懒加载的表情模型空数组
    // 使用懒加载可以避免后续的解包
    lazy var emoticons = [HGEmoticon]()
    
    // 表情包目录, 从目录下加载 info.plist 可以创建表情模型数组
    var directory: String? {
        didSet{
            // 当设置模型时,从目录下加载 info.plist
            guard let directory = directory,
                  let path = Bundle.main.path(forResource: "HMEmoticon.bundle", ofType: nil),
                  let bundle = Bundle(path: path),
                  let infoPath = bundle.path(forResource: "info.plist", ofType: nil, inDirectory: directory),
                  let array = NSArray(contentsOfFile: infoPath) as? [[String: String]],
                  let models = NSArray.yy_modelArray(with: HGEmoticon.self, json: array) as? [HGEmoticon]
                else {
                return
            }
            
            // 遍历 models 数组,设置每一个表情符号的目录
            
            for m in models {
                m.directory = directory
            }
            
            emoticons += models
            
        }
    }
    
    
    override var description: String {
        return yy_modelDescription()
    }
    
}
