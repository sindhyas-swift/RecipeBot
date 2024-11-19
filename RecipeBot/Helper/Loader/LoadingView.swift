//
//  LoadingView.swift
//  RecipeBot
//
//  Created by SINDHYA ANOOP on 11/19/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack{
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint:.gray))
                .scaleEffect(2)
        }
    }
}

#Preview {
    LoadingView()
}

