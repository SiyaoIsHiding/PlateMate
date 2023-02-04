//
//  ShoppingListViewController.swift
//  PlateMate
//
//  Created by HE Siyao on 3/2/2023.
//

import UIKit

class ShoppingListViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var platemateLogo: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    
    var items = ["item 1", "item 2", "item 3", "item 4", "item 6", "yo", "yee", "ok"]

    override func viewDidLoad() {
        super.viewDidLoad()
        platemateLogo.image = UIImage(named: "platemateLogo")
        
        self.view.addSubview(tableView)
        
        // Test table view
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "itemCell")
        view.addSubview(tableView)        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
}



