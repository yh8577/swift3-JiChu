//
//  ViewController.swift
//  emoji十六进制编码转换
//
//  Created by jyh on 2017/12/17.
//  Copyright © 2017年 jyh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //unicode 的编码,展现使用 UTF8 1-4 个字节表示一个字符
        let code = "0x1f603"
        
        // 实例化字符扫描器
        let scanner = Scanner(string: code)
        
        // 从 code 中扫描出十六进制的数值,注意这里传的是地址
        var result: UInt32 = 0
        scanner.scanHexInt32(&result)
        
        
        // 使用 UInt32 的数值,生成一个 Utf8 的字符
        
        guard let uResults = UnicodeScalar(result) else {
            return
        }
        let c = Character(uResults)
        
        let emoji = String(c)
        
        print(emoji)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

