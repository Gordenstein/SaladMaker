//
//  CompactSaladIngredient.swift
//  SaladMaker
//
//  Created by Eugene Gordenstein on 1/27/21.
//

import SwiftUI

struct CompactSaladIngredient: View {
  @EnvironmentObject var modelData: ModelData
  @State private var detailsAction: Int?
  var ingredient: Ingredient
  
  var ingredientIndex: Int {
    modelData.ingredients.firstIndex(where: { $0.id == ingredient.id })!
  }
  
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
      
      NavigationLink(destination: IngredientDetail(ingredient: ingredient), tag: 1, selection: $detailsAction) {
        EmptyView()
      }
    }
    .frame(width: 160, height: 30)
    .cornerRadius(8)
    .contextMenu {
      Button(action: {
        self.detailsAction = 1
      }, label: {
        Text("Change amount")
        Image(systemName: "pencil")
      })
      Divider()
      Button(action: {
        modelData.addedIngredients.remove( modelData.ingredients[ingredientIndex])
        modelData.ingredients[ingredientIndex].added = false
      }, label: {
        Text("Delete")
        Image(systemName: "xmark.circle.fill")
      })
    }
  }
  
  let itemBackgroundColor = Color.white.opacity(0.9)
}

struct IngredientCompact_Previews: PreviewProvider {
  static var previews: some View {
    CompactSaladIngredient(ingredient: ModelData().ingredients[0])
      .background(Color.green)
      .environmentObject(ModelData())
  }
}
