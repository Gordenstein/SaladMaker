//
//  AddToSaladRoundButton.swift
//  SaladMaker
//
//  Created by Eugene Gordenstein on 1/27/21.
//

import SwiftUI

struct AddToSaladRoundButton: View {
  @EnvironmentObject var modelData: ModelData
  @Binding var added: Bool
  
  var ingredientIndex: Int
  
  var body: some View {
    Button(action: {
      if !added {
        added.toggle()
        addToSalad()
      } else {
        modelData.addedIngredients.remove( modelData.ingredients[ingredientIndex])
        added.toggle()
      }
    }) {
      Image(systemName: added ? "checkmark.circle.fill" : "plus.circle.fill")
        .foregroundColor(added ? Color.green : Color(UIColor.systemGray))
        .font(Font.system(size: 30))
    }
  }
  
  private func addToSalad() {
    let weigth = modelData.ingredients[ingredientIndex].weight
    let nutritionFactsPerGram = modelData.ingredients[ingredientIndex].nutritionFactsPerGram
    modelData.ingredients[ingredientIndex].nutritionFacts.fat = nutritionFactsPerGram.fat * weigth
    modelData.ingredients[ingredientIndex].nutritionFacts.protein = nutritionFactsPerGram.protein * weigth
    modelData.ingredients[ingredientIndex].nutritionFacts.carbohydrate = nutritionFactsPerGram.carbohydrate * weigth
    modelData.ingredients[ingredientIndex].nutritionFacts.sugar = nutritionFactsPerGram.sugar * weigth
    modelData.ingredients[ingredientIndex].nutritionFacts.calories = nutritionFactsPerGram.calories * weigth
    modelData.addedIngredients.insert(modelData.ingredients[ingredientIndex])
  }
}

struct AddToSaladButton_Previews: PreviewProvider {
  static var previews: some View {
    AddToSaladRoundButton(added: .constant(false), ingredientIndex: 0)
      .environmentObject(ModelData())
  }
}
