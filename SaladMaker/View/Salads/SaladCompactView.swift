//
//  SaladCompactView.swift
//  SaladMaker
//
//  Created by Eugene Gordenstein on 1/27/21.
//

import SwiftUI

struct SaladCompactView: View {
  var salad: Salad
  
  var body: some View {
    VStack {
      Text(salad.name)
      
      CompactListOfIngredients(ingredients: salad.ingredients)
        .frame(height: 80)
      
      HStack {
        VStack {
          Text("Fats")
          Text(String(salad.fats))
        }
        Divider()
        VStack {
          Text("Proteins")
          Text(String(salad.proteins))
        }
        Divider()
        VStack {
          Text("Carbs")
          Text(String(salad.carbohydrates))
        }
      }
      .frame(height: 80)
    }
  }
}

struct SaladCompactView_Previews: PreviewProvider {
  static let modelData = ModelData()
  static let salad = Salad(id: 0, name: "First Salad", ingredients: modelData.ingedients)
  
  static var previews: some View {
    SaladCompactView(salad: salad)
  }
}
