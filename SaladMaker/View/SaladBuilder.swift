//
//  SaladBuilder.swift
//  SaladMaker
//
//  Created by Eugene Gordenstein on 1/27/21.
//

import SwiftUI

struct SaladBuilder: View {
  var salad = Salad(id: 0, name: "First Salad", ingredients: [])
  
  var body: some View {
    NavigationView {
      VStack {
        SaladCompactView(salad: salad)
        CategoryHome()
      }
    }
  }
}

struct SaladBuilder_Previews: PreviewProvider {
  static var previews: some View {
    SaladBuilder()
      .environmentObject(ModelData())
  }
}
