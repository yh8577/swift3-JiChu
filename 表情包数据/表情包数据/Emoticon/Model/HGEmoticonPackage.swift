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
    
    // 表情包目录, 从目录下加载 info.plist 可以创建表情模型数组
    var directory: String?
    
    // 懒加载的表情模型空数组
    // 使用懒加载可以避免后续的解包
    lazy var emoticons = [HGEmoticon]()
    
    override var description: String {
        return yy_modelDescription()
    }
    
}
