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
        let i1 : Ingredient  = Ingredient(name: "Lamb", price: 10.0)
        let i2 : Ingredient = Ingredient(name: "Leek", price: 2)
        let image_url  = URL(string: "https://edamam-product-images.s3.amazonaws.com" + "/web-img/691/69110270a357de1738dd00ceec241492.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJHMEUCIQCpC%2BnCJH%2FE93K8FKYV577m14PDnWjqvsGAzwYxWK8VOQIgMKpmVgAp2xlba0YwPHqSLt7LwjP31qvFp6JkWM0F8tYqzAQIGhAAGgwxODcwMTcxNTA5ODYiDBJtwkZ1AttPqkhN3yqpBEmV3ZgIxd7lrt4aVPucoEui9muTiyME97rHKNvLrcGOA6BGcsubitdWOTvU10Q6bKtZcxjd8PoR01bFMIIJ%2BOwFvGxP5Ek4zN4RkExE3BekvQI42MENXHcon6qx%2BbVa7UK%2B23pKu6lfhelmPpb7YkwMvSYq3U518eHdq6j5J4JMbDTiPui7C8X96NePqauvjtb4ZMcGy5paer8KfbDm4egsxWoTMb1YsBPVNT7DAiF%2BfFE0Emq2yypJ3F6UI41ASk00UKU9vlTxiPrH3yl1KePaeAW4iWkDJgmeHFCNp08b0vwW1YaC7QdHLCKaJVdPrK3bQe3C8yLatH8rZMLiTSMqFbZbMh51lkme4kPUGWWNNPU81mG%2F373q0tFz6cqLBJsxCGbYbB%2B4g0tag%2FziGW2gIn5SN%2Fd%2FyMrBrOVeen%2BUbYn1OMO%2F%2FSeh0qImzQFSXGvdhHjGlRiie3ethWGL7dncgfxXWqfsiFWzW93qoLHxWkgL1yEYRF4SilnyMlRiGXzbLt9zOmFowT8HNWAffFLsYc0iSxFExMdaodmHTS836BwmxhdTxXzKGYB%2BGR6NrPqt7G%2FryIG75FmbDRB4LIqutVYJC0VBCtJFRLittjOjqjQtaLE00nJM5lq3%2FOV%2BuASARwknbuaDcLcTzHvgNE%2B2JkB8zjqalHvWM5dZH7oZKL2D7qGCHesyZIrIi4vYuFz5xaaBNLPeuw%2FvHIVSUMRsIdojB4hdCLMw2KP6ngY6qQE2oOtemxDY0OhPcag%2Bx9Zfkz7P%2B11t%2BhYAe8Mee5YT7hQMpnoUnwUaKuZlEYSxMUOUF%2BQdLVwHfEvmcWj6dejrrFQxJd6rNwfRVOhfq19Gho6cj6PrK8xHOhZhKo9aRF9mqNTMiIbyInECVigCuJAgjvgz5F%2Bi2Yt6o3K74leZcTg5gd12SMgpLZIk6lp7KUJf85piBJFvOjXFChOYcjJbbVc7obWxcKsX&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230204T182716Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3599&X-Amz-Credential=ASIASXCYXIIFMOROSBP6%2F20230204%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=33d8e2a6ba5f69da61ab03b3f1fe3b6fc3859d961ec6dc05433689fdeb5840c7")!
        let r1 : Recipe = Recipe(name: "Lamb Sausages", id: "2d668f6ca2089032ce80abcd814a8936", imageUrl: image_url, ingredients: [i1, i2])
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
