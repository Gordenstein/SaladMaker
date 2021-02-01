//
//  NutritionFactCell.swift
//  SaladMaker
//
//  Created by Eugene Gordenstein on 1/31/21.
//

import SwiftUI

struct NutritionFactCell: View {
  var value: Double
  var title: String
  
    var body: some View {
      HStack(spacing: 15) {
        Image(systemName: "leaf.fill")
          .padding(10)
          .background(Color("ingredientAccent"))
          .foregroundColor(.white)
          .cornerRadius(.greatestFiniteMagnitude)
          .shadow(color: Color.gray, radius: 5, y: 0)
        
        VStack(alignment: .leading) {
          Text(String(value))
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
      NutritionFactCell(value: 25, title: "Proteins")
        .background(Color.green)
    }
}
