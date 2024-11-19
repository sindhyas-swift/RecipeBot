//
//  EmptyRecipesScreen.swift
//  RecipeBot
//
//  Created by SINDHYA ANOOP on 11/19/24.
//

import SwiftUI

struct EmptyRecipesScreen: View {
    let imageName:String
    let message:String
    var body: some View {
        ZStack{
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            VStack(alignment:.center){
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height:150)
                    .padding()
                Text(message)
                    .font(.headline)
                    .fontWeight(.medium)
            }
        }
    }
}

#Preview {
    EmptyRecipesScreen(imageName: "noRecipes", message: "No Recipes are available !!!")
}
