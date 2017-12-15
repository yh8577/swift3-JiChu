//
//  HGLabel.swift
//  textKit
//
//  Created by jyh on 2017/12/15.
//  Copyright © 2017年 jyh. All rights reserved.
//

import UIKit


/**
 1.使用 TextKit 接管 Label 的底层实现 -- 绘制文本 textStorage 的文本内容
 2.使用正则表达式过滤 URL
 3.交互
*/
class HGLabel: UILabel {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        prepareTextSystem()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        prepareTextSystem()
    }
    
    // 绘制文本
    override func drawText(in rect: CGRect) {
        
        let range = NSRange(location: 0, length: textStorage.length)
        
        layoutManager.drawBackground(forGlyphRange: range, at: CGPoint())
        
        //Glyphs  字形
        layoutManager.drawGlyphs(forGlyphRange: range, at: CGPoint())
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // 指定绘制文本的区域
        textContainer.size = bounds.size
    }

    // MARK: - TextKit 的核心对象
    // 属性文本存储
    fileprivate lazy var textStorage = NSTextStorage()
    // 负责文字'字形'布局
    fileprivate lazy var layoutManager = NSLayoutManager()
    // 设定文本绘制的范围
    fileprivate lazy var textContainer = NSTextContainer()
    

}

extension HGLabel {
    
    fileprivate func prepareTextSystem() {
        
        // 1. 准备文本内容
        prepareTextContent()
        // 2. 准备设置对象的关系
        textStorage.addLayoutManager(layoutManager)
        layoutManager.addTextContainer(textContainer)
        
        
    }
    
    // 3. 准备文本内容
    private func prepareTextContent() {
        
        if let attributedText = attributedText {
             textStorage.setAttributedString(attributedText)
        } else if let text = text {
            textStorage.setAttributedString(NSAttributedString(string: text))
        } else {
            textStorage.setAttributedString(NSAttributedString(string: ""))
        }
        
        for r in urlRanges ?? [] {
            
            textStorage.addAttributes(
                [
                    NSForegroundColorAttributeName: UIColor.blue,
                    NSBackgroundColorAttributeName: UIColor.lightGray
                ], range: r)
        }
    }
    
}


extension HGLabel {
    
    // 返回 textStorage 中的 URL range 数组
    fileprivate var urlRanges: [NSRange]? {
        
        // 正则表达式
        let pattern = "[a-zA-Z]*://[a-zA-Z0-9/\\.]*"
        
        guard let regx = try? NSRegularExpression(pattern: pattern, options: []) else {
            return nil
        }
        
        // 多个匹配
        let matches = regx.matches(in: textStorage.string, options: [], range: NSRange(location: 0, length: textStorage.length))
        
        // 遍历数组,生成 ranges 数组
        var ranges = [NSRange]()
        
        for m in matches {
            ranges.append(m.rangeAt(0))
            
        }
        
        return ranges
    }
}
