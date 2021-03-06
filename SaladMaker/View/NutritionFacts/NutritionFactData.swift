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
  var graphIndex: Int
  
  var color: Color {
    switch graphIndex {
    case 0, 1, 2:
      return moreBetterColor
    default:
      return moreWorseColor
    }
  }
  
  var moreBetterColor: Color {
    switch currentValue {
    case 0:
      return .gray
    case 0.01..<maxValue:
      return Color("ingredientAccent")
    case maxValue...:
      return .green
    default:
      return .clear
    }
  }
  
  var moreWorseColor: Color {
    switch currentValue {
    case 0:
      return .gray
    case 0.01..<maxValue:
      return Color("ingredientAccent")
    case maxValue...:
      return Color("tomatoRed")
    default:
      return .clear
    }
  }
  
  var body: some View {
    GeometryReader { geometry in
      VStack(alignment: .center, spacing: 0) {
        Spacer()
        
        Text(String(Int(currentValue.rounded())))
          .padding(.bottom, 5)
        
        let widthOffet: CGFloat = 33
        let width = geometry.size.width - widthOffet
        let calculatedHeight = max(
          CGFloat((min(currentValue, maxValue) * Double(geometry.size.height - 60)) / maxValue),
          width / 2)
        
        RoundedRectangle(cornerRadius: (width - 7) / 2)
          .fill(color)
          .frame(height: calculatedHeight)
          .animation(Animation.spring(dampingFraction: 0.5)
                      .speed(1))
          .padding([.leading, .trailing], widthOffet / 2)
        
        Text(title)
          .lineLimit(1)
          .padding(.top, 5)
      }
      .frame(height: geometry.size.height, alignment: .center)
    }
  }
}

struct NutritionFactData_Previews: PreviewProvider {
  static var previews: some View {
    NutritionFactData(maxValue: 100, currentValue: 60, title: "Fats", graphIndex: 1)
  }
}
