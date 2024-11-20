//
//  NetworkManager.swift
//  RecipeBot
//
//  Created by SINDHYA ANOOP on 11/19/24.
//

import Foundation
import UIKit

final class NetworkManager {
    static let shared = NetworkManager()
    private let cache = NSCache<NSString,UIImage>()
    static let baseURL = "https://d3jbb8n5wk0qxi.cloudfront.net/"
    private let recipesURL = baseURL + "recipes.json"
    private let malformedURL = baseURL + "malformed.json"
    private let emptyURL = baseURL + "empty.json"
    
    private init(){}
    
    func getRecipes() async throws -> [Recipes] {
        
        guard let url = URL(string: recipesURL) else {
            throw RPError.invalidURL
        }
        let (data,response) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            let decodedResponse = try decoder.decode(RecipesResponse.self, from: data)
            return decodedResponse.recipes
        }
        catch{
            throw RPError.invalidData
        }
    }
    
    
    func loadImages(fromURLString urlString:String,completed:@escaping(UIImage?) -> Void) {
        let cacheKey = NSString(string:urlString)
        if let image = cache.object(forKey: cacheKey){
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data , let image = UIImage(data: data) else{
                completed(nil)
                return
            }
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        task.resume()
    }
}
