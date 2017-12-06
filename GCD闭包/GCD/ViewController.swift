//
//  ViewController.swift
//  GCD
//
//  Created by jyh on 2017/12/6.
//  Copyright © 2017年 jyh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var completionCallBack : ((_ result : [String]) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // 解除循环引用
        // 这里不能强行解包
//        weak var weakSelf = self
    
//        loadData1 { (result) in
//            print("\(result)" , weakSelf?.view ?? "nil")
//        }
        
        // swift 推荐写法
        loadData2 {  [weak self] (result) in
            print(self?.view ?? "nil")
        }
        
        // 方法3,不会强引用,但是指针不会被释放. 会出现野指针. 尽量不要使用.
//        loadData2 {  [unowned self] (result) in
//            print(self.view)
//        }
        
    }

    func loadData(completion: @escaping (_ result : [String]) -> () ) -> () {
        
        // 子线程
        DispatchQueue.global().async {
            print("耗时操作:\(Thread.current)")
            
            // 暂停1秒
            Thread.sleep(forTimeInterval: 1.0)
            
            let json = ["头条","八卦","出大事了"]
            
            // 回到主线程
            DispatchQueue.main.async(execute: {
                print("主线程更新UI \(Thread.current)")
                
                //回调 -> 执行闭包
                
                completion(json)
            })
        }
        
    }
    
    // 循环引用
    func loadData1(completion: @escaping (_ result: [String]) -> ()) -> () {
        
        // 循环引用 ,self 对闭包的引用
        completionCallBack = completion
        
        DispatchQueue.global().async {
            print("耗时操作")
            let json = ["头条","八卦","出大事了"]
            // 回到主线程
            DispatchQueue.main.async {
                
                // 闭包回调
                completion(json)
            }
        }
    }
    
    // 解除循环引用
    func loadData2(completion: @escaping (_ result : [String]) -> ()) -> () {
        
        // 循环引用 ,self 对闭包的引用
        completionCallBack = completion
        
        DispatchQueue.global().async {
            print("耗时操作")
            
            Thread.sleep(forTimeInterval: 3.0)
            let json = ["头条","八卦","出大事了"]
            // 回到主线程
            DispatchQueue.main.async {
                
                // 闭包回调
                completion(json)
            }
        }
    }
    
    deinit {
        print("销毁")
    }

}

