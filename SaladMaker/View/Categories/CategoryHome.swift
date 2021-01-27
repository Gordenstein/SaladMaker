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
    List {
      ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
        CategoryRow(categoryName: key, items: modelData.categories[key]!)
      }
      .listRowInsets(EdgeInsets())
    }
    .listStyle(InsetListStyle())
  }
}

struct CategoryHome_Previews: PreviewProvider {
  static var previews: some View {
    CategoryHome()
      .environmentObject(ModelData())
  }
}
