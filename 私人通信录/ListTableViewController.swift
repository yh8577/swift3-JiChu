//
//  ListTableViewController.swift
//  私人通信录
//
//  Created by jyh on 2017/12/7.
//  Copyright © 2017年 jyh. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {

    
    var personList = [Person]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        weak var weakSelf = self
        
        loadData { (list) in
//            print(list)
            // 拼接数组
            weakSelf?.personList += list
            
            
            // 刷新表格
            weakSelf?.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return personList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let model = personList[indexPath.row]
        cell.textLabel?.text = model.name
        cell.detailTextLabel?.text = model.phone

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        // 执行 segue
        performSegue(withIdentifier: "list2Detail", sender: indexPath)
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as! DetailTableViewController
        
        if let indexPath = sender as? IndexPath {
            vc.person = personList[indexPath.row]
            
            // 设置修改后的闭包回调,更新数据.
            vc.completionCallBack = {
                
                self.tableView.reloadRows(at: [indexPath], with: .automatic)
            }
        }
        
    }

 
    // 模拟异步,利用闭包回调
    private func loadData(completion: @escaping (_ list: [Person])->()) ->() {
        
        // 异步加载数据
        DispatchQueue.global().async {
            print("加载数据...")
            Thread.sleep(forTimeInterval: 1)
            var arrayM = [Person]()
            for i in 0..<20 {
                let p = Person()
                p.name = "张三 - \(i)"
                p.phone = "1860" + String(format: "%07d", arc4random_uniform(10000000))
                p.title = "BOSS - \(i)"
                arrayM.append(p)
            }
            // 主线程回调
            DispatchQueue.main.async(execute: { 
                
                completion(arrayM)
            })
        }
    }

}
