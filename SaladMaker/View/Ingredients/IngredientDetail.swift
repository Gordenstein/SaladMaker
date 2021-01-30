//
//  IngredientDetail.swift
//  SaladMaker
//
//  Created by Eugene Gordenstein on 1/27/21.
//

import SwiftUI

struct IngredientDetail: View {
  @EnvironmentObject var modelData: ModelData
  @Environment(\.presentationMode) var presentationMode
  var ingredient: Ingredient
  
  var ingredientIndex: Int {
    modelData.ingredients.firstIndex(where: { $0.id == ingredient.id })!
  }
  
  var body: some View {
    ScrollView {
      ingredient.image
        .frame(width: 150, height: 150, alignment: .center)
      
      HStack {
        Text(ingredient.name)
          .font(.title)
          .padding()
        Spacer()
        Button("Add to the Salad") {
//          modelData.currentSalad.ingredients.append(ingredient)
          modelData.ingredients[ingredientIndex].added = true
          presentationMode.wrappedValue.dismiss()
        }
        .font(.title3)
        .padding()
      }
      
      HStack {
        VStack {
          Text("Fats")
          Text(String(ingredient.nutritionFacts.fat))
        }
        Divider()
        VStack {
          Text("Proteins")
          Text(String(ingredient.nutritionFacts.protein))
        }
        Divider()
        VStack {
          Text("Carbs")
          Text(String(ingredient.nutritionFacts.carbohydrate))
        }
      }
      
      Divider()
      
      Text(ingredient.description)
        .padding()
    }
  }
}

struct IngredientDetail_Previews: PreviewProvider {
  static let modelData = ModelData()
  
  static var previews: some View {
    IngredientDetail(ingredient: modelData.ingredients[0])
      .environmentObject(modelData)
  }
}
