//import UIKit
//
//class ShoppingListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
//    @IBOutlet weak var platemateLogo: UIImageView!
//    @IBOutlet weak var tableView: UITableView!
//
//    var items = [String]()
//
//    var recipeStore: RecipeStore!
//    var recipe: Recipe!
//    var ingredients: [Ingredient]!
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        platemateLogo.image = UIImage(named: "platemateLogo")
//
//        recipe = recipeStore.getSavedRecipe()[0]
//        ingredients = recipeStore.getIngredientByRecipe(recipe: recipe)
//
//       for ingredient in ingredients {
//           items.append(ingredient.name)
//       }
//
//        self.view.addSubview(tableView)
//
//        // Test table view
//        tableView.dataSource = self
//        tableView.delegate = self
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "itemCell")
//        view.addSubview(tableView)
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return items.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
//        cell.textLabel?.text = items[indexPath.row]
//        cell.textLabel?.font = UIFont(name: "Menlo", size: 18)
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            items.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        }
//    }
//}

//
//  ShoppingListViewController.swift
//  PlateMate
//
//  Created by HE Siyao on 3/2/2023.
//

import UIKit

class ShoppingListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var platemateLogo: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var items = [String: Double]()

    var recipeStore: RecipeStore!
    var recipe: Recipe!
    var ingredients: [Ingredient]!
    override func viewDidLoad() {
        super.viewDidLoad()
        platemateLogo.image = UIImage(named: "platemateLogo")
        
        recipe = recipeStore.getSavedRecipe()[0]
        ingredients = recipeStore.getIngredientByRecipe(recipe: recipe)
       
       for ingredient in ingredients {
           items[ingredient.name] = ingredient.price
       }
        
        items = retrieveShoppingList() // Load saved shopping list data.
        
        self.view.addSubview(tableView)
        
        // Test table view
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "itemCell")
        view.addSubview(tableView)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
        cell.textLabel?.text = Array(items.keys)[indexPath.row] + ": " + String(Array(items.values)[indexPath.row])
        cell.textLabel?.font = UIFont(name: "Menlo", size: 18)
        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let item = Array(items.keys)[indexPath.row]
            items.removeValue(forKey: item)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            saveShoppingList(ingredient: items)
        }
    }

    func saveShoppingList(ingredient: [String: Double]) {
        let defaults = UserDefaults.standard
        defaults.set(ingredient, forKey: "shoppingList")
    }

    func retrieveShoppingList() -> [String: Double] {
        print(items)
        let defaults = UserDefaults.standard
        // defaults.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
        let shoppingList = defaults.object(forKey: "shoppingList") as? [String: Double] ?? items
        return shoppingList
    }
}
