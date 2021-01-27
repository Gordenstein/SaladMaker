//
//  CompactListOfIngredients.swift
//  SaladMaker
//
//  Created by Eugene Gordenstein on 1/27/21.
//

import SwiftUI

struct CompactListOfIngredients: View {
  var ingredients: [Ingredient]
  
  var body: some View {
    GeometryReader { geometry in
      HStack {
        ForEach(ingredients) { ingredient in
          IngredientCompact(ingredient: ingredient)
        }
      }
      .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
    }
  }
}

struct CompactListOfIngredients_Previews: PreviewProvider {
  static var previews: some View {
    CompactListOfIngredients(ingredients: ModelData().ingedients)
  }
}
