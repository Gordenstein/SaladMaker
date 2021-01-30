//
//  NutritionFactsGraph.swift
//  SaladMaker
//
//  Created by Eugene Gordenstein on 1/29/21.
//

import SwiftUI

extension Animation {
  static func ripple(index: Int) -> Animation {
    Animation.spring(dampingFraction: 0.5)
      .speed(2)
      .delay(0.03 * Double(index))
  }
}

struct NutritionFactsGraph: View {
  @EnvironmentObject var modelData: ModelData
  var nutritionFacts: NutritionFacts
    
  var body: some View {
    GeometryReader { geometry in
      HStack(alignment: .lastTextBaseline) {
        NutritionFactData(maxValue: 17, currentValue: modelData.currentNutritionFacts.fat, title: "Fats")
        NutritionFactData(maxValue: 64, currentValue: modelData.currentNutritionFacts.protein, title: "Proteins")
        NutritionFactData(maxValue: 130, currentValue: modelData.currentNutritionFacts.carbohydrate, title: "Carbs")
        NutritionFactData(maxValue: 36, currentValue: modelData.currentNutritionFacts.sugar, title: "Sugar")
        NutritionFactData(maxValue: 1200, currentValue: modelData.currentNutritionFacts.calories, title: "Calories")
      }
      .frame(height: geometry.size.height)
      .padding([.leading, .trailing], 10)
    }
  }
}

struct NutritionFactsGraph_Previews: PreviewProvider {
  static var previews: some View {
    NutritionFactsGraph(nutritionFacts: NutritionFacts(fat: 20, protein: 1, carbohydrate: 78, sugar: 20, calories: 120))
      .environmentObject(ModelData())
  }
}
