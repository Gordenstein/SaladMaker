//
//  CategoryItem.swift
//  SaladMaker
//
//  Created by Eugene Gordenstein on 1/27/21.
//

import SwiftUI

struct CategoryItem: View {
  var ingredient: Ingredient
  
  var body: some View {
    VStack(alignment: .leading) {
      ZStack {
        Color.init(red: 237 / 255, green: 237 / 255, blue: 237 / 255, opacity: 0.8)
        ingredient.image
          .renderingMode(.original)
          .resizable()
      }
      .frame(width: 100, height: 100)
      .cornerRadius(8)
      Text(ingredient.name)
        .foregroundColor(.primary)
        .font(.caption)
    }
    .padding(.leading, 15)
  }
}

struct CategoryItem_Previews: PreviewProvider {
  static var previews: some View {
    CategoryItem(ingredient: ModelData().ingedients[0])
  }
}
