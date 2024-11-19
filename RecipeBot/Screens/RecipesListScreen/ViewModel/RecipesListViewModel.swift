//
//  RecipesListViewModel.swift
//  RecipeBot
//
//  Created by SINDHYA ANOOP on 11/19/24.
//

import Foundation

@MainActor final class RecipesListViewModel : ObservableObject {
    
    @Published var recipes:[Recipes] = []
    @Published var alertItem:AlertItem?
    @Published var isLoading = true
    
    func getRecipes(){
        isLoading = true
        Task{
            do{
                recipes = try await NetworkManager.shared.getRecipes()
                recipes = recipes.sorted(by: {$0.name<$1.name})
                isLoading = false
            }
            catch{
                isLoading = false
                RPError.invalidResponse
            }
        }
    }
}
