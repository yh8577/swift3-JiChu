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
 提示
    在 IOS7 之前要实现类似的效果需要 CodeText 使用起来异常的繁琐
    YYmodel 的作者开发一个框架 YYText, 增加建立了一套渲染系统
*/
class HGLabel: UILabel {
    
    // MARK: - 重写属性
    override var text: String? {
        didSet {
            prepareTextContent()
        }
    }
    
    // MARK: - 构造函数
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        prepareTextSystem()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        prepareTextSystem()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // 获取用户点击的位置
        guard let location = touches.first?.location(in: self) else {
            return
        }
        
        // 获取但父亲点击中字符的索引
        let idx = layoutManager.glyphIndex(for: location, in: textContainer)
        
        // 判断 idx 是否在 URL 范围中,如果在就高亮
        for r in urlRanges ?? [] {
            
            if NSLocationInRange(idx, r) {
                print("高亮")
                // 修改文本的字体属性
                textStorage.addAttributes([NSForegroundColorAttributeName: UIColor.blue], range: r)
                
                // 如果需要重绘,需要调用  setNeedsDisplay() 函数
                setNeedsDisplay()
            } else {
                print("没有电到")
            }
        }
        
        
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
        
        isUserInteractionEnabled = true
        
        // 1. 准备文本内容
        prepareTextContent()
        // 2. 准备设置对象的关系
        textStorage.addLayoutManager(layoutManager)
        layoutManager.addTextContainer(textContainer)
        
        
    }
    
    // 3. 准备文本内容
    fileprivate func prepareTextContent() {
        
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
                    NSForegroundColorAttributeName: UIColor.red,
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
