//
//  ViewController.swift
//  键盘的输入视图
//
//  Created by jyh on 2017/12/17.
//  Copyright © 2017年 jyh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // 设置键盘
        let keyboardView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 258))
        keyboardView.backgroundColor = UIColor.blue
        
        // 设置输入视图
        textView.inputView = keyboardView
        
        // 设置输入助理视图-键盘消失,助理视图随之消失
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 200, height: 44))
        textView.inputAccessoryView = toolBar
        
        
        // 刷新键盘
        textView.reloadInputViews()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

