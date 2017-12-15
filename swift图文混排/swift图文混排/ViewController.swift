//
//  ViewController.swift
//  swift图文混排
//
//  Created by jyh on 2017/12/15.
//  Copyright © 2017年 jyh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
 
        // 图片附件
        let attachment = NSTextAttachment()
        
        // 图片
        attachment.image = #imageLiteral(resourceName: "lxh_haobang")
        
        let height = label.font.lineHeight
        attachment.bounds = CGRect(x: 0, y: -4, width: height, height: height)
        
        // 属性文本
        let imageStr = NSAttributedString(attachment: attachment)
        
        // 图文字符串
        let attrStrM = NSMutableAttributedString(string: "我")
        
        attrStrM.append(imageStr)
        attrStrM.append(NSMutableAttributedString(string: "88!"))
        
        
        label.attributedText = attrStrM
        
    }

}

