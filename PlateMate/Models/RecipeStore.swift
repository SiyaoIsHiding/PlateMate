//
//  RecipeStore.swift
//  PlateMate
//
//  Created by HE Siyao on 4/2/2023.
//

import Foundation

public class RecipeStore{
    private var fakeRecipe :[Recipe] = []
    public init(){
        let i1 : Ingredient  = Ingredient(name: "Lamb")
        let i2 : Ingredient = Ingredient(name: "Leek")
        let image_url  = URL(string: "https://thompsonandredwood.com.au/wp-content/uploads/2017/09/lamb-1.jpg")!
        let r1 : Recipe = Recipe(name: "Lamb Sausages", id: "2d668f6ca2089032ce80abcd814a8936", imageUrl: image_url, ingredients: [i1, i2])
        fakeRecipe = [r1]
    }
    
    func searchRecipeByKeywords(keywords: String, completion : @escaping (Result<[Recipe], Error>) -> Void){
        NetworkWorker.search(keyword: keywords, completion: completion)
    }
    
    func getSavedRecipe() -> [Recipe]{
        return fakeRecipe
    }
    
    func getIngredientByRecipe(recipe: Recipe) -> [Ingredient]{
        return fakeRecipe[0].ingredients!
    }
}
