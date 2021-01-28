//
//  SaladCompactView.swift
//  SaladMaker
//
//  Created by Eugene Gordenstein on 1/27/21.
//

import SwiftUI

struct SaladCompactView: View {
  @EnvironmentObject var modelData: ModelData
  var salad: Salad
  
  var body: some View {
    VStack {
      HStack {
        Text(salad.name)
        
        Spacer()
        
        NavigationLink(
          destination: SaladDetail(salad: modelData.currentSalad)) {
          Text("Make Salad!")
        }
      }.padding()
      
      CompactListOfIngredients(ingredients: modelData.addedIngredients)
        .frame(height: 80)
      
      HStack {
        VStack {
          Text("Fats")
          Text(String(modelData.currentNutritionFacts.fats))
        }
        Divider()
        VStack {
          Text("Proteins")
          Text(String(modelData.currentNutritionFacts.proteins))
        }
        Divider()
        VStack {
          Text("Carbs")
          Text(String(modelData.currentNutritionFacts.carbohydrates))
        }
      }
      .frame(height: 80)
    }
  }
}

struct SaladCompactView_Previews: PreviewProvider {
  static let modelData = ModelData()
  static let salad = Salad(id: 0, name: "First Salad", ingredients: modelData.ingredients, nutritionFacts: NutritionFacts())
  
  static var previews: some View {
    SaladCompactView(salad: salad)
      .environmentObject(ModelData())
  }
}
