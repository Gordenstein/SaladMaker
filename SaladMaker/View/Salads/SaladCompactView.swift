//
//  SaladCompactView.swift
//  SaladMaker
//
//  Created by Eugene Gordenstein on 1/27/21.
//

import SwiftUI

struct SaladCompactView: View {
  @EnvironmentObject var modelData: ModelData
  
  var body: some View {
    VStack {
      NutritionFactsGraph(nutritionFacts: modelData.currentNutritionFacts)
        .frame(height: 200)
        .background(Color.init(UIColor.secondarySystemBackground))
        .cornerRadius(16)
        .padding(.horizontal)
        .padding(.top)
      
      CompactListOfIngredients(ingredients: modelData.addedIngredients)
        .frame(height: 120)
        .padding(.vertical)
    }
    
  }
}

struct SaladCompactView_Previews: PreviewProvider {
  static let modelData = ModelData()
  static let salad = Salad(id: 0, name: "First Salad", ingredients: modelData.ingredients, nutritionFacts: NutritionFacts())
  
  static var previews: some View {
    SaladCompactView()
      .environmentObject(modelData)
      .background(Color.green)
  }
}
