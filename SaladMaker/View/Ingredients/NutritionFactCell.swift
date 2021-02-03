//
//  NutritionFactCell.swift
//  SaladMaker
//
//  Created by Eugene Gordenstein on 1/31/21.
//

import SwiftUI

struct NutritionFactCell: View {
  @Binding var weigth: Double
  var amount: Double
  var title: String
  
  var result: Double {
    (amount * weigth / 100)
  }
  
  var iconName: String {
    switch title {
    case "Fats":
      return "drop.fill"
    case "Proteins":
      return "bolt.fill"
    case "Carbohydrate":
      return "hexagon.fill"
    case "Sugar":
      return "cube.fill"
    case "Calories":
      return "flame.fill"
    default:
      return "leaf.fill"
    }
  }
  
    var body: some View {
      HStack(spacing: 15) {
        Image(systemName: iconName)
          .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
          .background(Color("ingredientAccent"))
          .foregroundColor(.white)
          .cornerRadius(.greatestFiniteMagnitude)
          .shadow(color: Color.gray, radius: 5, y: 0)
        
        VStack(alignment: .leading) {
          Text(String(result))
            .foregroundColor(.white)
          Text(title)
            .foregroundColor(Color("ingredientAccent"))
        }
        .font(.footnote)
      }
    }
}

struct NutritionFactCell_Previews: PreviewProvider {
    static var previews: some View {
      NutritionFactCell(weigth: .constant(100), amount: 17.0, title: "Proteins")
        .background(Color.green)
    }
}
