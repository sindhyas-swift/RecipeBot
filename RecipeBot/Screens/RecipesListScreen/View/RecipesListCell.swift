//
//  RecipesListCell.swift
//  RecipeBot
//
//  Created by SINDHYA ANOOP on 11/19/24.
//



import SwiftUI

struct RecipesListCell: View {
    let recipe : Recipes
    var body: some View {
        HStack{
            RecipeRemoteImage(urlString: recipe.imageUrl)
                .clipShape(.rect(cornerRadius: 10))
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 95)
                .cornerRadius(8)
            VStack(alignment: .leading){
                Text(recipe.name)
                    .font(.title3)
                    .fontWeight(.medium)
                Text(recipe.cuisine)
                    .foregroundColor(.secondary)
                    .opacity(0.8)
                    .fontWeight(.semibold)
            }
            Spacer()
            VStack(alignment: .trailing){
                Text("Recipe")
                    .bold()
                    .frame(width: 70,height: 25)
                    .background(Color(.gray))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                Text("Video")
                    .bold()
                    .frame(width: 70,height: 25)
                    .background(Color(.red))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
}

#Preview {
    RecipesListCell(recipe: MockData.sampleRecipe)
}
