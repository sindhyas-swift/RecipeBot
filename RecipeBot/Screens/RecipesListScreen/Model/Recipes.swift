//
//  Recipes.swift
//  RecipeBot
//
//  Created by SINDHYA ANOOP on 11/19/24.
//

import Foundation

struct Recipes:Decodable,Hashable {
    
    var cuisine: String
    var name: String
    var imageUrl : String
    var uuid : String
    
    
    enum CodingKeys: String, CodingKey {
        case imageUrl = "photo_url_small"
        case cuisine,name,uuid
    }
}

struct RecipesResponse: Decodable{
    let recipes : [Recipes]
}

struct MockData {
    static let sampleRecipe = Recipes(cuisine: "American", name: "Pecan Pie",imageUrl: "",uuid: "")
    static let recipes = [sampleRecipe,sampleRecipe,sampleRecipe,sampleRecipe,sampleRecipe,sampleRecipe ]
}

