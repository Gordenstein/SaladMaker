//
//  SaladDetail.swift
//  SaladMaker
//
//  Created by Eugene Gordenstein on 1/28/21.
//

import SwiftUI

struct SaladDetail: View {
  var salad: Salad
  
  var body: some View {
    VStack {
      Text(salad.name)
      
      ForEach(salad.ingredients) { ingredient in
        Text(ingredient.name)
      }
    }
  }
}

struct SaladDetail_Previews: PreviewProvider {
  static var previews: some View {
    SaladDetail(salad: ModelData().currentSalad)
  }
}
