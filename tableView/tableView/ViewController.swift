//
//  ViewController.swift
//  tableView
//
//  Created by jyh on 2017/12/6.
//  Copyright © 2017年 jyh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupUI()
    }
    
    
    private func setupUI() {
        let tv = UITableView(frame: view.bounds, style: .plain)
        
        view.addSubview(tv)
        
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        
        tv.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        
        cell.textLabel?.text = "hello ~~~~~ \(indexPath.row)"
        
        return cell
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

