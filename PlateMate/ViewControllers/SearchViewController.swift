//
//  SearchViewController.swift
//  PlateMate
//
//  Created by HE Siyao on 3/2/2023.
//

import UIKit
    

class SearchViewController: UIViewController, UITableViewDataSource , UISearchBarDelegate {
    
    var recipeStore: RecipeStore!
    
        @IBOutlet weak var tableView: UITableView!
        @IBOutlet weak var searchBar: UISearchBar!

        let recipes = ["beef", "pork", "chicken"]

        var filteredData: [String]!

        override func viewDidLoad() {
            super.viewDidLoad()
            filteredData = recipes
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as UITableViewCell
            cell.textLabel?.text = filteredData[indexPath.row]
            return cell
        }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return filteredData.count
        }

        // This method updates filteredData based on the text in the Search Box
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            if searchText == ""
            
            filteredData = searchText.isEmpty ? recipes : recipes.filter { (item: String) -> Bool in
                // If dataItem matches the searchText, return true to include it
                return item.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
            }
            
            tableView.reloadData()
        }

    
    @IBAction func getRequest(_ sender: UIButton) {
        let url = URL(string: "http://20.14.97.80")!

        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            print(String(data: data, encoding: .utf8)!)



        }

        task.resume()
    }

}
