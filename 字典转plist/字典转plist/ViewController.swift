//
//  ViewController.swift
//  字典转plist
//
//  Created by jyh on 2017/12/9.
//  Copyright © 2017年 jyh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let array: [[String: Any]] = [
            ["clsName": "WBHomeViewController", "title": "首页", "imageName": "home", "visitorInfo": ["imageName": "","message": "关注一些人,回这里看看有什么惊喜"]],
            ["clsName": "WBMessageViewController", "title": "消息", "imageName": "message_center", "visitorInfo": ["imageName": "visitordiscover_image_message","message": "登录后，别人评论你的微博，发给你的消息，都会在这里收到通知"]],
            ["clsName": "UIViewController"],
            ["clsName": "WBDiscoverViewController", "title": "发现", "imageName": "discover", "visitorInfo": ["imageName": "visitordiscover_image_message","message": "登录后，最新，最热微博尽在掌握，不坏在于实事潮流擦肩而过"]],
            ["clsName": "WBProfileViewController", "title": "我", "imageName": "profile", "visitorInfo": ["imageName": "visitordiscover_image_profile","message": "登录后，你的微博,相册,个人资料会显示在这里，展示给别人"]]
        ]
        
        // 把字典生产plist
                (array as NSArray).write(toFile: "/Users/huig/Desktop/demo.plist", atomically: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

