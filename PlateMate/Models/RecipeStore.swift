//
//  RecipeStore.swift
//  PlateMate
//
//  Created by HE Siyao on 4/2/2023.
//

import Foundation

public class RecipeStore{
    public var fakeRecipe :[Recipe] = []
    public init(){
        let i1 : Ingredient  = Ingredient(name: "Lamb", price: 10.0)
        let i2 : Ingredient = Ingredient(name: "Leek", price: 2)
        let i3 : Ingredient = Ingredient(name: "Chicken", price: 2)
        let i4 : Ingredient = Ingredient(name: "Cow", price: 2)
        let i5 : Ingredient = Ingredient(name: "Milk", price: 2)
        let image_url  = URL(string: "https://thompsonandredwood.com.au/wp-content/uploads/2017/09/lamb-1.jpg")!
        let r1 : Recipe = Recipe(name: "Lamb Sausages", id: "2d668f6ca2089032ce80abcd814a8936", imageUrl: image_url, ingredients: [i1, i2, i3, i4, i5])
        fakeRecipe = [r1]
    }
    
    func searchRecipeByKeywords(keywords: String) -> [Recipe]{
        return fakeRecipe
    }
    
    func getSavedRecipe() -> [Recipe]{
        return fakeRecipe
    }
    
    func getIngredientByRecipe(recipe: Recipe) -> [Ingredient]{
        return fakeRecipe[0].ingredients
    }
}
