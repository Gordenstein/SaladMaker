//
//  CategoryItem.swift
//  SaladMaker
//
//  Created by Eugene Gordenstein on 1/27/21.
//

import SwiftUI

struct CategoryItem: View {
  @EnvironmentObject var modelData: ModelData
  var ingredient: Ingredient
  
  var ingredientIndex: Int {
    modelData.ingedients.firstIndex(where: { $0.id == ingredient.id })!
  }
  
  var body: some View {
    VStack(alignment: .leading) {
      ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top), content: {
        itemBackgroundColor
        
        ingredient.image
          .renderingMode(.original)
          .resizable()
          .frame(width: 85, height: 85)
          .padding([.trailing, .top], 15)
        
        AddToSaladButton(added: $modelData.ingedients[ingredientIndex].added)
          .frame(width: 25, height: 25)
          .padding([.trailing, .top], 4)
          .animation(.easeInOut)
      })
      .frame(width: 100, height: 100)
      .cornerRadius(8)
      
      Text(ingredient.name)
        .foregroundColor(.primary)
        .font(.caption)
    }
    .padding(.leading, 15)
  }
  
  let itemBackgroundColor = Color.init(red: 237 / 255, green: 237 / 255, blue: 237 / 255, opacity: 0.8)
}

struct CategoryItem_Previews: PreviewProvider {
  static let modelData = ModelData()
  
  static var previews: some View {
    CategoryItem(ingredient: modelData.ingedients[0])
      .environmentObject(modelData)
  }
}
