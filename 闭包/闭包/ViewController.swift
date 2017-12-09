//
//  ViewController.swift
//  闭包
//
//  Created by jyh on 2017/12/8.
//  Copyright © 2017年 jyh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var person: Person? = Person()
    
    var completionCallback: (()->())?
    
    @IBOutlet weak var phoneText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if person != nil {
            
            phoneText.text = person?.phone
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func btnClick(_ sender: Any) {
        
        person?.phone = phoneText.text
        
        completionCallback?()
        
        navigationController?.popViewController(animated: true)
      
    }
    
    
    deinit {
        print("消费")
    }
}

