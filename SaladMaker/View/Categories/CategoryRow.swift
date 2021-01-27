//
//  CategoryRow.swift
//  SaladMaker
//
//  Created by Eugene Gordenstein on 1/27/21.
//

import SwiftUI

struct CategoryRow: View {
  var categoryName: String
  var items: [Ingredient]
  
  var body: some View {
    VStack(alignment: .leading) {
      Text(self.categoryName)
        .font(.headline)
        .padding(.leading, 15)
        .padding(.top, 5)
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(alignment: .top, spacing: 0) {
          ForEach(self.items) { ingredient in
            NavigationLink(destination: IngredientDetail(ingredient: ingredient)) {
              CategoryItem(ingredient: ingredient)
            }
          }
        }.frame(height: CategoryRow.scrollViewHeight)
      }
      .frame(height: CategoryRow.scrollViewHeight)
    }
  }
  
  static let scrollViewHeight: CGFloat = 135
}

struct CategoryRow_Previews: PreviewProvider {
  static var previews: some View {
    CategoryRow(categoryName: ModelData().ingedients[0].category.rawValue, items: ModelData().ingedients)
  }
}
