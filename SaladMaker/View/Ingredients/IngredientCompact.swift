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
      Text(ingredient.name)
    }
    .frame(width: 100, height: 30)
    .cornerRadius(8)
  }
  
  let itemBackgroundColor = Color.init(red: 237 / 255, green: 237 / 255, blue: 237 / 255, opacity: 0.8)
}

struct IngredientCompact_Previews: PreviewProvider {
  static var previews: some View {
    IngredientCompact(ingredient: ModelData().ingedients[0])
  }
}
