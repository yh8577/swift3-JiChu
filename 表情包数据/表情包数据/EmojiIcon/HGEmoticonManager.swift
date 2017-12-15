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
    
    // 构造函数,锁住单例
    private init() {
        
    }
    
}
