//
//  ViewController.swift
//  图像优化
//
//  Created by jyh on 2017/12/12.
//  Copyright © 2017年 jyh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rect = CGRect(x: 0, y: 0, width: 160, height: 160)
        
        let iv = UIImageView(frame: rect)
        
        iv.center = view.center
        
        view.addSubview(iv)
        
        let image = #imageLiteral(resourceName: "big")
        
        iv.image = avatarImage(image: image, size: rect.size, backColor: view.backgroundColor)
        
        
        // PNG 图像支持透明
        // JPG 图像是不透明
    }

    
    
    /// 将给定的图像进行拉升
    /// 为的是为了优化图像的,提升性能
    /// 核心绘图
    /// - Returns:
    func avatarImage(image: UIImage, size: CGSize, backColor: UIColor?) -> UIImage? {
        
        let rect = CGRect(origin: CGPoint(), size: size)
        // 1 绘图尺寸
        // 2 不透明 false()透明/ true(不透明)
        // 3 scale 屏膜分辨率,默认生产的图像默认使用1.0 的分辨率,图像质量不变.可以指定0,会选择当前设置被分辨率
        UIGraphicsBeginImageContextWithOptions(rect.size, true, 0)
        
        // 背景填充
        backColor?.setFill()
        UIRectFill(rect)
        
        // 实例化一个圆形的路径
        let path = UIBezierPath(ovalIn: rect)
        // 进行路径裁切,- 后续的绘图,都会出现在图形路径内部,外部的全部干掉
        path.addClip()
        
        // 绘图 drawInRect 就是在指定区域内拉伸
        image.draw(in: rect)
        
        // 绘制内切的圆形
        UIColor.darkGray.setStroke()
        // 设置边线宽度
        path.lineWidth = 2
        // 绘制线条
        path.stroke()
        
        // 取得结果
        let result = UIGraphicsGetImageFromCurrentImageContext()
        
        // 关闭上下文
        UIGraphicsEndImageContext()
        
        // 返回结果
        return result
        
    }

}

