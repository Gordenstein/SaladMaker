//
//  SaladIngredient.swift
//  SaladMaker
//
//  Created by Eugene Gordenstein on 2/4/21.
//

import SwiftUI

struct SaladIngredient: View {
  @EnvironmentObject var modelData: ModelData
  var ingredient: Ingredient
  
  var ingredientIndex: Int {
    modelData.ingredients.firstIndex(where: { $0.id == ingredient.id })!
  }
  
  var body: some View {
    ZStack {
      Color.white
      VStack(spacing: 6) {
        ZStack(alignment: .bottomTrailing) {
          ingredient.image
            .renderingMode(.original)
            .resizable()
            .frame(width: 60, height: 60)
            .padding(18)
            .background(Color(UIColor.secondarySystemBackground))
            .cornerRadius(30)
        }
        
        
        Text(ingredient.name)
          .fontWeight(.bold)
          .foregroundColor(.primary)
          .font(.subheadline)
          .padding(.top, 3)
        
        Text(String(Int(ingredient.weight)) + "g")
          .fontWeight(.light)
          .foregroundColor(.primary)
          .font(.subheadline)
      }
    }
    .frame(width: 115, height: 165, alignment: .center)
    .cornerRadius(30)
  }
}

struct SaladIngredient_Previews: PreviewProvider {
  static let modelData = ModelData()
  
  static var previews: some View {
    SaladIngredient(ingredient: modelData.ingredients[0])
      .environmentObject(modelData)
      .background(Color.gray)
  }
}
