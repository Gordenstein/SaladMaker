//
//  SaladBuilder.swift
//  SaladMaker
//
//  Created by Eugene Gordenstein on 1/27/21.
//

import SwiftUI

struct SaladBuilder: View {
  @EnvironmentObject var modelData: ModelData
  
  var body: some View {
    NavigationView {
      VStack {
        SaladCompactView(salad: modelData.currentSalad)
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
