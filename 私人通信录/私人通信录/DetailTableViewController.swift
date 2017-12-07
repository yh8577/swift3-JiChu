//
//  DetailTableViewController.swift
//  私人通信录
//
//  Created by jyh on 2017/12/7.
//  Copyright © 2017年 jyh. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {

    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var phoneText: UITextField!
    @IBOutlet weak var titleText: UITextField!
    
    var person: Person?
    
    // 定义返回闭包
    var completionCallBack: (()->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if person != nil {
            
            nameText.text = person?.name
            phoneText.text = person?.phone
            titleText.text = person?.title
        }
        
    }

    @IBAction func btnClick(_ sender: Any) {
        
        guard let name = nameText.text,
            let phone = phoneText.text,
            let title = titleText.text else {
            return
        }
        
        person = Person()
        
        person?.name = name
        person?.phone = phone
        person?.title = title
    
        // 执行闭包回调
        completionCallBack?()
        
        navigationController?.popViewController(animated: true)
        
    }
    
    deinit {
        print("销毁")
    }

}
