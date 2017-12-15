//
//  ViewController.swift
//  表情包数据
//
//  Created by jyh on 2017/12/15.
//  Copyright © 2017年 jyh. All rights reserved.
//

import UIKit
/**
  1. 黄色文件夹,打包的时候,不会建立目录,主要保存程序文件
     素材文件不允许重名
  2. 蓝色文件夹,打包的时候,会建立目录,可以区分目录的文件素材文件
     不同目录的素材可以重名
     游戏的场景.background.png[草地/雪地/高山/坟墓]
     手机应用皮肤: 白天/夜间模式
     切记: 不要把程序文件放在蓝色文件夹中!
  3. .bundle
     通常用在第三方框架素材
     可以按照黄色文件的方式拖拽,同时会保留住目录结构
     可以避免文件重名
 */

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        let emoji = HGEmoticonManager.shared
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

