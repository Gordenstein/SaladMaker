//
//  AddToSaladButton.swift
//  SaladMaker
//
//  Created by Eugene Gordenstein on 1/27/21.
//

import SwiftUI

struct AddToSaladButton: View {
  @EnvironmentObject var modelData: ModelData
  @Binding var added: Bool
  
  var ingredientIndex: Int
  
  var body: some View {
    Button(action: {
      if !added {
        added.toggle()
//        modelData.ingredients[ingredientIndex].added = true
        modelData.addedIngredients.insert( modelData.ingredients[ingredientIndex])
      } else {
//        print("Element for deletion: \(modelData.ingredients[ingredientIndex])")
        modelData.addedIngredients.remove( modelData.ingredients[ingredientIndex])
        added.toggle()
//        modelData.ingredients[ingredientIndex].added = false
      }
    }) {
      Image(systemName: added ? "checkmark.circle.fill" : "plus.circle")
        .foregroundColor(added ? Color.green : Color.blue)
    }
  }
}

struct AddToSaladButton_Previews: PreviewProvider {
  static var previews: some View {
    AddToSaladButton(added: .constant(true), ingredientIndex: 0)
      .environmentObject(ModelData())
  }
}
