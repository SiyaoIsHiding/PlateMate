//
//  DetailViewController.swift
//  PlateMate
//
//  Created by HE Siyao on 4/2/2023.
//

import UIKit

class TestViewController: UIViewController {

    var recipeStore: RecipeStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func getDetail(_ sender: UIButton) {
        print("button pressed")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier{
        case "detail":
            let detailVC = segue.destination as! DetailViewController
            detailVC.recipe = recipeStore.getSavedRecipe()[0]
            detailVC.recipeStore = recipeStore
            //TODO: fake
        default:
            print("Wrong segue identifier")
        }
    }
}
