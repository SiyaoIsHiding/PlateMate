//
//  SearchViewController.swift
//  PlateMate
//
//  Created by HE Siyao on 3/2/2023.
//

import UIKit

class SearchViewController: UIViewController {
    
    var recipeStore: RecipeStore!
    
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
//<<<<<<< HEAD
//=======
    
    
    
    @IBAction func getRequest(_ sender: UIButton) async {
        
    }
    
    // var recipes : [Recipes] = recipeStore.searchRecipeByKeywords(lamb)

//>>>>>>> 3519dbda4b483dea6d31b14bf860a8bfe535b3db
}
