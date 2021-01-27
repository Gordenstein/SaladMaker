//
//  IngredientDetail.swift
//  SaladMaker
//
//  Created by Eugene Gordenstein on 1/27/21.
//

import SwiftUI

struct IngredientDetail: View {
  @EnvironmentObject var modelData: ModelData
  var ingredient: Ingredient
  
  var body: some View {
    ScrollView {
      ingredient.image
        .frame(width: 150, height: 150, alignment: .center)
      
      HStack {
        Text(ingredient.name)
          .font(.title)
          .padding()
        Spacer()
      }
      
      HStack {
        VStack {
          Text("Fats")
          Text(String(ingredient.fats))
        }
        Divider()
        VStack {
          Text("Proteins")
          Text(String(ingredient.proteins))
        }
        Divider()
        VStack {
          Text("Carbs")
          Text(String(ingredient.carbohydrates))
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
    IngredientDetail(ingredient: modelData.ingedients[0])
      .environmentObject(modelData)
  }
}
