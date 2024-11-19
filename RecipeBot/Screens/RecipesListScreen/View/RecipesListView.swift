//
//  RecipesListView.swift
//  RecipeBot
//
//  Created by SINDHYA ANOOP on 11/19/24.
//

import SwiftUI

struct RecipesListView: View {
    
    @State var searchText: String = ""
    @State private var limit = 10
    @StateObject var viewModel = RecipesListViewModel()
    
    var filteredRecipes: [Recipes]{
        guard !searchText.isEmpty else {return viewModel.recipes}
        return viewModel.recipes.filter {
            $0.name.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    var body: some View {
        NavigationStack{
            ZStack{
                NavigationView {
                    if filteredRecipes.isEmpty{
                        EmptyRecipesScreen(imageName: "noRecipes", message: "No Recipes available at the moment!!!")
                    }
                    else
                    {
                        List{
                            ForEach(filteredRecipes,id: \.self) { recipe in
                                RecipesListCell(recipe: recipe)
                            }
                            
                        }
                        .navigationTitle("All Recipes")
                    }
                }.refreshable {
                    viewModel.getRecipes()
                }
                .task
                {
                    viewModel.getRecipes()
                }
                if viewModel.isLoading == true{
                    LoadingView()
                }
            }.alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
            }
        }.searchable(text: $searchText,prompt:"Search Recipes")
    }
}
#Preview {
    RecipesListView()
}

