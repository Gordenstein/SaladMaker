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
        
        let widthOffet: CGFloat = 40
        let width = geometry.size.width - widthOffet
        let calculatedHeight = max(
          CGFloat((min(currentValue, maxValue) * Double(geometry.size.height - 70)) / maxValue),
          width)
        
        Capsule()
          .fill(color)
          .animation(.easeInOut)
          .frame(height: calculatedHeight)
          .animation(nil)
          .animation(Animation.spring(dampingFraction: 0.5)
                      .speed(2))
          .cornerRadius(geometry.size.width / 2)
          .padding([.leading, .trailing], widthOffet / 2)
        
        Text(title)
      }
      .frame(height: geometry.size.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
  }
}

struct NutritionFactData_Previews: PreviewProvider {
  static var previews: some View {
    NutritionFactData(maxValue: 100, currentValue: 100, title: "Fats")
  }
}
