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
        NutritionFactData(maxValue: 150, currentValue: Double(nutritionFacts.fats), title: "Fats")
        NutritionFactData(maxValue: 150, currentValue: Double(nutritionFacts.proteins), title: "Proteins")
        NutritionFactData(maxValue: 150, currentValue: Double(nutritionFacts.carbohydrates), title: "Carbs")
        NutritionFactData(maxValue: 150, currentValue: Double(nutritionFacts.fats), title: "Smth")
        NutritionFactData(maxValue: 150, currentValue: Double(1), title: "Smth")
      }
      .frame(height: geometry.size.height)
      .padding([.leading, .trailing], 10)
    }
  }
}

struct NutritionFactsGraph_Previews: PreviewProvider {
  static var previews: some View {
    NutritionFactsGraph(nutritionFacts: NutritionFacts(fats: 20, proteins: 1, carbohydrates: 78))
  }
}
