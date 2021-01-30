//
//  CategoryHome.swift
//  SaladMaker
//
//  Created by Eugene Gordenstein on 1/27/21.
//

import SwiftUI

struct CategoryHome: View {
  @EnvironmentObject var modelData: ModelData
  
  var body: some View {
    ScrollView {
      Color.clear
        .frame(height: 220, alignment: .center)
      
      ZStack {
        Color.white
        
        VStack {
          ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
            CategoryRow(categoryName: key, items: modelData.categories[key]!)
          }
        }
        .padding(.top, 10)
      }
      .cornerRadius(20)
    }
  }
}

struct CategoryHome_Previews: PreviewProvider {
  static var previews: some View {
    CategoryHome()
      .environmentObject(ModelData())
  }
}
