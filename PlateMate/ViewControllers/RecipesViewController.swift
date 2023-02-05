//
//  RecipesViewController.swift
//  PlateMate
//
//  Created by HE Siyao on 3/2/2023.
//

import UIKit

class RecipesViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    var contentView: UIView!
    var recipeStore: RecipeStore!
    @IBOutlet var UIImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        setUpContentView()
    }
    
    func setUpContentView() {
        contentView = UIView()
        // contentView.backgroundColor = .yellow
        let fakeRecipes = recipeStore.getSavedRecipe()
        print(fakeRecipes)
        
        for recipe in fakeRecipes {
            let label = UILabel()
            label.text = recipe.name
            label.sizeToFit()
            label.font = UIFont(name: "Menlo", size: 18)
            
            NetworkWorker.loadUrlToImage(imageView: UIImage, from: recipe.imageUrl)
            contentView.addSubview(label)
        }
        
        contentView.frame = CGRect(x: 0, y: 0, width: scrollView.frame.width, height: scrollView.frame.height * 2)
        scrollView.addSubview(contentView)
        scrollView.contentSize = contentView.frame.size
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // This method is called when the scroll view is scrolled
    }

}
