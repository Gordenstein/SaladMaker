//
//  NutritionFactData.swift
//  SaladMaker
//
//  Created by Eugene Gordenstein on 1/29/21.
//

import SwiftUI

struct NutritionFactData: View {
  var maxValue: Double
  var currentValue: Double
  var title: String
  
  var color: Color {
    switch currentValue {
    case 0:
      return .clear
    case 0.01..<maxValue:
      return .blue
    case maxValue...:
      return .green
    default:
      return .clear
    }
  }
  
  var body: some View {
    GeometryReader { geometry in
      VStack(alignment: .center) {
        Spacer()
        
        Text(String(Int(currentValue.rounded())))
        
        Capsule()
          .fill(color)
          .animation(.easeInOut)
          .frame(width: geometry.size.width - 10,
                 height: min(CGFloat(currentValue) + geometry.size.width - 10, CGFloat(maxValue)))
          .cornerRadius(geometry.size.width / 2)
          .padding(.leading, 5)
          .padding(.trailing, 5)
        
        Text(title)
      }
      .frame(height: geometry.size.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
  }
}

struct NutritionFactData_Previews: PreviewProvider {
  static var previews: some View {
    NutritionFactData(maxValue: 100, currentValue: 70, title: "Fats")
  }
}
