//
//  IngredientCompact.swift
//  SaladMaker
//
//  Created by Eugene Gordenstein on 1/27/21.
//

import SwiftUI

struct IngredientCompact: View {
  var ingredient: Ingredient
  
  var body: some View {
    ZStack {
      itemBackgroundColor
      HStack {
        Text(ingredient.name)
          .padding(.leading, 12)
        Spacer()
        Text(String(ingredient.weight) + "g")
          .layoutPriority(1)
          .padding(.trailing, 12)
      }
    }
    .frame(width: 160, height: 30)
    .cornerRadius(8)
  }
  
  let itemBackgroundColor = Color.white.opacity(0.9)
}

struct IngredientCompact_Previews: PreviewProvider {
  static var previews: some View {
    IngredientCompact(ingredient: ModelData().ingredients[0])
      .background(Color.green)
  }
}
