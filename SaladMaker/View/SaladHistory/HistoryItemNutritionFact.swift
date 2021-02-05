//
//  HistoryItemNutritionFact.swift
//  SaladMaker
//
//  Created by Eugene Gordenstein on 2/5/21.
//

import SwiftUI

struct HistoryItemNutritionFact: View {
  var imageName: String
  var value: Double
  
  var body: some View {
    VStack(spacing: 6) {
      Image(systemName: imageName)
        .foregroundColor(Color("ingredientAccent"))
      
      Text(String(value))
        .fontWeight(.bold)
        .lineLimit(1)
        .minimumScaleFactor(0.5)
        
    }
    .frame(width: 40)
  }
}

struct HistoryItemNutritionFact_Previews: PreviewProvider {
  static var previews: some View {
    HistoryItemNutritionFact(imageName: "drop.fill", value: 88.8)
      .background(Color.gray)
  }
}
