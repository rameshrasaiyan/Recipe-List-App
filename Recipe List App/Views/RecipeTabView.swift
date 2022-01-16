//
//  RecipeTabView.swift
//  Recipe List App
//
//  Created by Ramesh Rasaiyan on 1/16/22.
//

import SwiftUI

struct RecipeTabView: View {

    
    @State var tabIndex = 0
    
    var body: some View {
        
        TabView(selection: $tabIndex) {
            
            Text("Featured View")
                .tabItem {
                    VStack {
                        Image(systemName: "star.fill")
                        Text("Featured")
                    }
                }
                .tag(0)
            
            RecipeListView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
                }
                .tag(1)
        }
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
            .previewInterfaceOrientation(.portrait)
    }
}
