//
//  String+Extension.swift
//  正则表达式
//
//  Created by jyh on 2017/12/15.
//  Copyright © 2017年 jyh. All rights reserved.
//

import Foundation

extension String {
    
    func hg_href() -> (link: String, text: String)? {
        
        let pattern = "<a href=\"(.*?)\".*?>(.*?)</a>"
        
        guard let regx = try? NSRegularExpression(pattern: pattern, options: []),
              let result = regx.firstMatch(in: self, options: [], range: NSRange(location: 0, length: characters.count))
            else {
            return nil
        }
        
        let link = (self as NSString).substring(with: result.rangeAt(1))
        
        let text = (self as NSString).substring(with: result.rangeAt(2))

        return (link, text)
    }
}
