//
//  CompactListOfIngredients.swift
//  SaladMaker
//
//  Created by Eugene Gordenstein on 1/27/21.
//

import SwiftUI

struct CompactListOfSaladIngredients: View {
  @EnvironmentObject var modelData: ModelData
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
              CompactSaladIngredientPlaceholder(transparent: true)
            } else {
              CompactSaladIngredientPlaceholder(transparent: false)
            }
          }
        }
        
        LazyHGrid(rows: rows, alignment: .center) {
          ForEach(Array(ingredients).sorted(by: { $0.name < $1.name })) { ingredient in
            CompactSaladIngredient(ingredient: ingredient)
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
    CompactListOfSaladIngredients(ingredients: Set<Ingredient>(ModelData().ingredients))
      .environmentObject(ModelData())
      .background(Color.green)
      .frame(height: 220)
  }
}
