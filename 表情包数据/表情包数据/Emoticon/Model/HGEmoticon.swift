//
//  HGEmoticon.swift
//  表情包数据
//
//  Created by jyh on 2017/12/15.
//  Copyright © 2017年 jyh. All rights reserved.
//

import UIKit
import YYModel


// 表情模型
class HGEmoticon: NSObject {
    
    // 表情类型 falses 是图像表情 / True 是 emoji
    var type = false
    
    // 表情字符串,发送给新浪微博的服务器(节约流量)
    var chs: String?
    
    // 表情图片名称
    var png: String?
    // emoji 的十六进制编码
    var code: String?
    
    
    override var description: String {
        return yy_modelDescription()
    }
}
