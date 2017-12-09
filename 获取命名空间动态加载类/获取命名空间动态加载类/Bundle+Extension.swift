//
//  Bundle+Extension.swift
//  获取命名空间动态加载类
//
//  Created by jyh on 2017/12/8.
//  Copyright © 2017年 jyh. All rights reserved.
//

import Foundation

extension Bundle {
    
//    func namespace() -> String {
//        return infoDictionary?["CFBundleName"] as? String ?? ""
//    }
    
    var namespace: String {
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }
    
}
