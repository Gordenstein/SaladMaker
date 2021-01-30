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
  var nutritionFacts: NutritionFacts
    
  var body: some View {
    GeometryReader { geometry in
      HStack(alignment: .lastTextBaseline) {
        NutritionFactData(maxValue: 150, currentValue: Double(nutritionFacts.fat), title: "Fats")
        NutritionFactData(maxValue: 150, currentValue: Double(nutritionFacts.protein), title: "Proteins")
        NutritionFactData(maxValue: 150, currentValue: Double(nutritionFacts.carbohydrate), title: "Carbs")
        NutritionFactData(maxValue: 150, currentValue: Double(nutritionFacts.sugar), title: "Sugar")
        NutritionFactData(maxValue: 150, currentValue: Double(nutritionFacts.calories), title: "Calories")
      }
      .frame(height: geometry.size.height)
      .padding([.leading, .trailing], 10)
    }
  }
}

struct NutritionFactsGraph_Previews: PreviewProvider {
  static var previews: some View {
    NutritionFactsGraph(nutritionFacts: NutritionFacts(fat: 20, protein: 1, carbohydrate: 78, sugar: 20, calories: 120))
  }
}
