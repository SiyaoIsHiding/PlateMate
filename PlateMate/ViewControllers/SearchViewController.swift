//
//  SearchViewController.swift
//  PlateMate
//
//  Created by HE Siyao on 3/2/2023.
//

import UIKit
    

class SearchViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let comp : (Result<[Recipe], Error>) -> Void = { result in
            switch result{
            case let .success(recipes):
                print(recipes[0].name)
            case let .failure(error):
                print(error)
            default:
                print("wrong")
            }
        }
        let r = recipeStore.searchRecipeByKeywords(keywords: "beef", completion: comp)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = filteredData[indexPath.row]
        return cell
    }
    
    
    
    @IBAction func getRequest(_ sender: UIButton) async {}

        var recipeStore: RecipeStore!
    
        @IBOutlet weak var tableView: UITableView!
        @IBOutlet weak var searchBar: UISearchBar!

        let recipes = ["beef", "pork", "chicken"]

        var filteredData: [String]!

        override func viewDidLoad() {
            super.viewDidLoad()

            filteredData = recipes
        }




    @IBAction func textSearch(_ sender: UITextField) {

    }
        //var input =

    }


