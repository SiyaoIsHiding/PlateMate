//
//  DetailViewController.swift
//  PlateMate
//
//  Created by HE Siyao on 4/2/2023.
//

import UIKit

class DetailViewController: UIViewController {

    var recipeStore: RecipeStore!
    var recipe: Recipe!
   
    @IBOutlet var descrLabel: UILabel!
    
    @IBOutlet var UIImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        recipe = recipeStore.getSavedRecipe()[0]
        NetworkWorker.loadUrlToImage(imageView: UIImage, from: recipe.imageUrl)
        // Do any additional setup after loading the view.
    }

    
}
