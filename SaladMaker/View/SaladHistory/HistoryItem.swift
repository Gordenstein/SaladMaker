//
//  HistoryItem.swift
//  SaladMaker
//
//  Created by Eugene Gordenstein on 2/5/21.
//

import SwiftUI

struct HistoryItem: View {
  var salad: Salad
  
  var body: some View {
      ZStack(alignment: .center) {
        Color.white
        
        HStack(spacing: 0) {
          Text("🥗")
            .font(Font.system(size: 60))
            .padding(16)
                  
          VStack(alignment: .leading, spacing: 0) {
            Text(salad.name)
              .fontWeight(.bold)
              .foregroundColor(.primary)
              .font(.title2)
            
            HStack {
              HistoryItemNutritionFact(imageName: "drop.fill", value: salad.nutritionFacts.fat)
              Divider()
              HistoryItemNutritionFact(imageName: "bolt.fill", value: salad.nutritionFacts.protein)
              Divider()
              HistoryItemNutritionFact(imageName: "hexagon.fill", value: salad.nutritionFacts.carbohydrate)
              Divider()
              HistoryItemNutritionFact(imageName: "cube.fill", value: salad.nutritionFacts.sugar)
              Divider()
              HistoryItemNutritionFact(imageName: "leaf.fill", value: salad.nutritionFacts.calories)
            }
            .frame(height: 80)
          }
          
          Spacer()
        }
      }
      .frame(height: 150)
      .cornerRadius(30)

  }
}

struct HistoryItem_Previews: PreviewProvider {
  static var previews: some View {
    var salad = Salad()
    salad.name = "Some name"
    return HistoryItem(salad: salad)
      .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
  }
}
