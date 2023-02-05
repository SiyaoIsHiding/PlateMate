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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        setUpContentView()
        
//        let scrollView = UIScrollView()
//        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
//        scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height * 2)
//        scrollView.backgroundColor = .red
//
//        let label = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 100))
//        label.text = "Hello World"
//
//        scrollView.addSubview(label)
//
//        view.addSubview(scrollView)
    }
    
    func setUpContentView() {
        contentView = UIView()
        contentView.backgroundColor = .yellow
        let fakeRecipes = recipeStore.getSavedRecipe()
        print(fakeRecipes)
        
        for recipe in fakeRecipes {
            let label = UILabel()
            label.text = recipe.name
            label.sizeToFit()
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
