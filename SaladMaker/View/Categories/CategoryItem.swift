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
    modelData.ingredients.firstIndex(where: { $0.id == ingredient.id })!
  }
  
  var body: some View {
    
    ZStack {
      Color.white
      VStack {
        ZStack(alignment: .bottomTrailing) {
          ingredient.image
            .renderingMode(.original)
            .resizable()
            .frame(width: 60, height: 60)
            .padding(18)
            .background(Color(UIColor.secondarySystemBackground))
            .cornerRadius(30)
            .padding([.trailing, .bottom], 5)
          
          AddToSaladRoundButton(added: $modelData.ingredients[ingredientIndex].added, ingredientIndex: ingredientIndex)
            .frame(width: 36, height: 36)
            .background(Color.white)
            .cornerRadius(30)
        }
        .padding([.top, .leading], 5)
        
        Text(ingredient.name)
          .fontWeight(.bold)
          .foregroundColor(.primary)
          .font(.subheadline)
      }
    }
    .frame(width: 115, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    .cornerRadius(30)
  }
  
  let itemBackgroundColor = Color.init(red: 237 / 255, green: 237 / 255, blue: 237 / 255, opacity: 0.8)
}

struct CategoryItem_Previews: PreviewProvider {
  static let modelData = ModelData()
  
  static var previews: some View {
    CategoryItem(ingredient: modelData.ingredients[0])
      .environmentObject(modelData)
      .background(Color.gray)
  }
}
