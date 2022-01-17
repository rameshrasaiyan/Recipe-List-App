//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Ramesh Rasaiyan on 1/15/22.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        
        // Create an instance of data service and get the data
        self.recipes = DataService.getLocalData()
        
    }
    
    static func getPortion(ingredient: Ingredient, recipeServings: Int, targetServings: Int) -> String {
        
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholePortions = 0
        
        if ingredient.num != nil {
            
            // Get a single serveing size by multiplying denominator by the recipe servings
            denominator *= recipeServings
            
            // Get target portion by multiplying numerator by target serving
            numerator *= targetServings
            
            // Reduce fraction by greatest common devisor
            let devisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= devisor
            denominator /= devisor
            
            // Get the whole portion if numerator ? denominator
            if numerator > denominator {
                
                // Calculate whole potions
                wholePortions = numerator / denominator
                
                // Calculate the remainder
                numerator = numerator % denominator
                
                // Assign to portion string
                portion += String(wholePortions)
            }
            
            // Express the remainder as a fraction
            if numerator > 0 {
                portion += wholePortions > 0 ? " " : ""
                portion += "\(numerator)/\(denominator)"
            }
            
            
            
        }
        
        if let unit = ingredient.unit {
            
            portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
            return portion + unit
        }
        
        
        return portion
    }
    
}
