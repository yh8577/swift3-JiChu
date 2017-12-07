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
        
        person?.name = nameText.text
        person?.phone = phoneText.text
        person?.title = titleText.text
        
        // 执行闭包回调
        completionCallBack?()
        
        navigationController?.popViewController(animated: true)
        
    }
     

}
