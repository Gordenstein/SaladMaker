//
//  CompactListOfIngredients.swift
//  SaladMaker
//
//  Created by Eugene Gordenstein on 1/27/21.
//

import SwiftUI

struct CompactListOfIngredients: View {
  var ingredients: Set<Ingredient>
  
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      let rows = [GridItem(), GridItem(), GridItem()]
      
      LazyHGrid(rows: rows, alignment: .top) {
        ForEach(Array(ingredients).sorted(by: { $0.name < $1.name })) { ingredient in
          IngredientCompact(ingredient: ingredient)
        }
      }
      
    }
    .padding(.leading, 16)
  }
}

struct CompactListOfIngredients_Previews: PreviewProvider {
  static var previews: some View {
    CompactListOfIngredients(ingredients: Set<Ingredient>(ModelData().ingredients))
      .background(Color.green)
  }
}
