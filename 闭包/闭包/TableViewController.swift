//
//  TableViewController.swift
//  闭包
//
//  Created by jyh on 2017/12/8.
//  Copyright © 2017年 jyh. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var data: [Person]?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        data = []
        for _ in 0...20 {
            
            let p = Person()
            p.phone = "1860" + String(format: "%07d", arc4random_uniform(10000000))
            data?.append(p)
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
        return data?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        cell.textLabel?.text = "ID: \(indexPath.row) - \(data![indexPath.row].phone!)"
        
        return cell
    }
 

    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        //右侧第一个按钮
        let actionOne = UITableViewRowAction(style: .normal, title: "删除") {_,_ in
            self.data?.remove(at: indexPath.item)
 
            // 刷新数据
            tableView.reloadData()
        }
        //背景颜色
        actionOne.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        
        //右侧第二个按钮
        let actionTwo = UITableViewRowAction(style: .normal, title: "编辑") {_,_ in
            self.performSegue(withIdentifier: "edit", sender: indexPath)
        }
        //背景颜色
        actionTwo.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        return [actionOne, actionTwo]
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as! ViewController
        
        if let indexPath = sender as? IndexPath {
            
            vc.person = data?[indexPath.row]
            
            vc.completionCallback = {
                
                self.tableView.reloadRows(at: [indexPath], with: .automatic)
            }
        
        }
        
        if segue.identifier == "add" {
            
            vc.completionCallback = { [weak vc] in
                
                guard let p = vc?.person else {
                    return
                }
                
                self.data?.insert(p, at: 0)
                
                self.tableView.reloadData()
            }
            
        }
        
    }
    

    
    deinit {
        print("消费")
    }

}
