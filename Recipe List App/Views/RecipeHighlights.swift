//
//  RecipeHighlights.swift
//  Recipe List App
//
//  Created by Ramesh Rasaiyan on 1/17/22.
//

import SwiftUI

struct RecipeHighlights: View {
    
    var allHightlights = ""
    
    init(hightlights:[String]) {
        for index in 0..<hightlights.count {
            
            if index == hightlights.count - 1 {
                allHightlights += hightlights[index]
            }
            else {
                allHightlights += hightlights[index] + ", "
            }
        }
    }
    
    var body: some View {
        Text(allHightlights)
    }
}

struct RecipeHighlights_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlights(hightlights: ["test", "test2"])
    }
}
