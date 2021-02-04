//
//  CompactListOfIngredients.swift
//  SaladMaker
//
//  Created by Eugene Gordenstein on 1/27/21.
//

import SwiftUI

struct CompactListOfIngredients: View {
  var ingredients: Set<Ingredient>
  
  var placeholderAmount: Int {
    if ingredients.count < 9 {
      return 9
    } else {
      return 0
    }
  }
  
  var body: some View {
    ScrollView(axes, showsIndicators: false) {
      let rows = [GridItem(), GridItem(), GridItem()]
      
      ZStack(alignment: .leading) {
        LazyHGrid(rows: rows, alignment: .center) {
          ForEach(0..<placeholderAmount) {index in
            if index < ingredients.count {
              IngredientCompactPlaceholder(transparent: true)
            } else {
              IngredientCompactPlaceholder(transparent: false)
            }
          }
        }
        
        LazyHGrid(rows: rows, alignment: .center) {
          ForEach(Array(ingredients).sorted(by: { $0.name < $1.name })) { ingredient in
            IngredientCompact(ingredient: ingredient)
          }
        }
        .padding(.trailing, 16)
      }
    }
    .padding(.leading, 16)
  }
  
  private var axes: Axis.Set {
    return ingredients.count > 6 ? .horizontal : []
  }
}

struct CompactListOfIngredients_Previews: PreviewProvider {
  static var previews: some View {
    CompactListOfIngredients(ingredients: Set<Ingredient>(ModelData().ingredients))
      .background(Color.green)
      .frame(height: 220)
  }
}
