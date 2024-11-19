//
//  RecipesListViewModelTests.swift
//  RecipeBotTests
//
//  Created by SINDHYA ANOOP on 11/19/24.
//

import XCTest

@testable import RecipeBot

final class RecipesListViewModelTests: XCTestCase {

    @MainActor func testRecipeCount(){
        
        let testData = [Recipes(cuisine: "Italian", name: "Pizza", imageUrl: "", uuid: ""),
                        Recipes(cuisine: "American", name: "Burgerr", imageUrl: "", uuid: ""),
                        Recipes(cuisine: "Indian", name: "Rasmalai", imageUrl: "", uuid: ""),
                        Recipes(cuisine: "Chinese", name: "Crab Rangoon", imageUrl: "", uuid: ""),
                        Recipes(cuisine: "British", name: "Plum Cake", imageUrl: "", uuid: ""),
                        Recipes(cuisine: "Indian", name: "Milk Cake", imageUrl: "", uuid: "")]
        
        
        let recipeslistViewModel = RecipesListViewModel()
        
        recipeslistViewModel.recipes = testData
        
        
        XCTAssertEqual(recipeslistViewModel.recipes.count, 6, "Both counts are equal")
        
        //Checking whether the test case fails in case of wrong result than expected.
        
        //    XCTAssertEqual(recipeslistViewModel.recipes.count, 4, "Both counts are not equal")
        
    }
    
    @MainActor func testSortingLogic() {
        // Arrange
        let mockData = [Recipes(cuisine: "Italian", name: "Pizza", imageUrl: "", uuid: ""),
                        Recipes(cuisine: "American", name: "Burger", imageUrl: "", uuid: ""),
                        Recipes(cuisine: "Indian", name: "Rasmalai", imageUrl: "", uuid: ""),
                        Recipes(cuisine: "Chinese", name: "Crab Rangoon", imageUrl: "", uuid: ""),
                        Recipes(cuisine: "British", name: "Plum Cake", imageUrl: "", uuid: ""),
                        Recipes(cuisine: "Indian", name: "Milk Cake", imageUrl: "", uuid: "")]
        
        
        // Act
        let viewModel = RecipesListViewModel()
        
        viewModel.recipes = mockData
        
        // Define the expected order based on the sorting logic
        let expectedOrder: [Recipes] = [
            Recipes(cuisine: "American", name: "Burger", imageUrl: "", uuid: ""),
            Recipes(cuisine: "Chinese", name: "Crab Rangoon", imageUrl: "", uuid: ""),
            Recipes(cuisine: "Indian", name: "Milk Cake", imageUrl: "", uuid: ""),
            Recipes(cuisine: "Italian", name: "Pizza", imageUrl: "", uuid: ""),
            Recipes(cuisine: "British", name: "Plum Cake", imageUrl: "", uuid: ""),
            Recipes(cuisine: "Indian", name: "Rasmalai", imageUrl: "", uuid: "")]
        
        let wrongOrder = [Recipes(cuisine: "Indian", name: "Milk Cake", imageUrl: "", uuid: ""),
                          Recipes(cuisine: "Italian", name: "Pizza", imageUrl: "", uuid: ""),
                          Recipes(cuisine: "British", name: "Plum Cake", imageUrl: "", uuid: ""),
                          Recipes(cuisine: "Indian", name: "Rasmalai", imageUrl: "", uuid: ""),
                          Recipes(cuisine: "American", name: "Burger", imageUrl: "", uuid: ""),
                          Recipes(cuisine: "Chinese", name: "Crab Rangoon", imageUrl: "", uuid: "")]
        
        let sortedArray =  viewModel.recipes.sorted(by: {$0.name<$1.name})
        
        // Assert that the recipes are sorted correctly
        XCTAssertEqual(sortedArray, expectedOrder, "Recipes are sorted in alphabetical order.")
        
        
        //Checking whether the test case fails in case of wrong result than expected.
        
        //   XCTAssertEqual(sortedArray, wrongOrder, "Recipes are not sorted in alphabetical order.")
        
    }
    
    @MainActor func testFilteringLogic() {
        // Arrange
        let mockRecipes = [Recipes(cuisine: "Italian", name: "Pizza", imageUrl: "", uuid: ""),
                           Recipes(cuisine: "American", name: "Burger", imageUrl: "", uuid: ""),
                           Recipes(cuisine: "Indian", name: "Rasmalai", imageUrl: "", uuid: ""),
                           Recipes(cuisine: "Chinese", name: "Crab Rangoon", imageUrl: "", uuid: ""),
                           Recipes(cuisine: "British", name: "Plum Cake", imageUrl: "", uuid: ""),
                           Recipes(cuisine: "Indian", name: "Milk Cake", imageUrl: "", uuid: "")]
        
        
        // Act
        let viewModel = RecipesListViewModel()
        
        viewModel.recipes = mockRecipes
        
        
        
        let variable = "Cake"
        let filteredRecipes = viewModel.recipes.filter( { $0.name.contains(variable)})
        
        // Define the expected order based on the filtering logic
        
        let expectedResult = [Recipes(cuisine: "British", name: "Plum Cake", imageUrl: "", uuid: ""),
                              Recipes(cuisine: "Indian", name: "Milk Cake", imageUrl: "", uuid: "")]
        
        
        // Assert that the recipes are sorted correctly
        XCTAssertEqual(filteredRecipes, expectedResult, "Recipes filtered correctly.")
    }
    
    
}

