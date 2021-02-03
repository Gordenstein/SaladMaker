//
//  IngredientDetail.swift
//  SaladMaker
//
//  Created by Eugene Gordenstein on 1/27/21.
//

import SwiftUI

struct IngredientDetail: View {
  @EnvironmentObject var modelData: ModelData
  @Environment(\.presentationMode) var presentationMode
  var ingredient: Ingredient
  
  var ingredientIndex: Int {
    modelData.ingredients.firstIndex(where: { $0.id == ingredient.id })!
  }
  
  var body: some View {
    GeometryReader { geometry in
      ZStack {
        VStack(spacing: 0) {
          Color("ingredientBackground")
            .frame(height: (geometry.size.height + geometry.safeAreaInsets.top + geometry.safeAreaInsets.bottom) * 0.6)
          Color.init(UIColor.secondarySystemBackground)
        }
        .ignoresSafeArea()
        
        VStack(alignment: .center, spacing: 0) {
          VStack {
            HStack {
              Button(action: {
                presentationMode.wrappedValue.dismiss()
              }, label: {
                Image(systemName: "chevron.backward")
                Text("Salad")
              })
              .padding(.horizontal)
              .foregroundColor(.white)
              .font(.headline)
              
              Spacer()
            }
            
            HStack {
              Text(ingredient.name)
                .foregroundColor(Color.white)
                .padding(20)
                .font(Font.system(size: 50))
              
              Spacer()
            }
            
            HStack(alignment: .center) {
              VStack(alignment: .leading, spacing: 0, content: {
                NutritionFactCell(value: ingredient.nutritionFacts.fat, title: "Fats")
                Spacer()
                NutritionFactCell(value: ingredient.nutritionFacts.protein, title: "Proteins")
                Spacer()
                NutritionFactCell(value: ingredient.nutritionFacts.carbohydrate, title: "Carbohydrate")
                Spacer()
                NutritionFactCell(value: ingredient.nutritionFacts.sugar, title: "Sugar")
                Spacer()
                NutritionFactCell(value: ingredient.nutritionFacts.calories, title: "Calories")
                Spacer()
              })
              
              Spacer()
              
              ingredient.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 180, height: 180)
            }
            .padding(.horizontal, 20)
          }
          .frame(height: (geometry.size.height + geometry.safeAreaInsets.top + geometry.safeAreaInsets.bottom) * 0.6 - geometry.safeAreaInsets.top)
                    
          VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 6) {
              Text("Details").bold()
              
              HStack {
                Text("Amount").bold()
                  .padding(.horizontal)
                Spacer()
                Text("100g")
                  .padding(.horizontal)
              }
              .frame(width: geometry.size.width - 45, height: 50, alignment: .center)
              .background(Color.white)
              .cornerRadius(14)
            }
            .padding(.top, 16)
            
            Spacer()

            
            VStack(alignment: .leading, spacing: 6) {
              Text("Desctiption").bold()
              Text(ingredient.description)
                .font(Font.system(size: 15))
                .multilineTextAlignment(.leading)
            }
            .frame(width: geometry.size.width - 45, alignment: .center)
            
            Spacer()
            
            Button(action: {
              modelData.ingredients[ingredientIndex].added = true
              modelData.addedIngredients.insert(modelData.ingredients[ingredientIndex])
              presentationMode.wrappedValue.dismiss()
            }, label: {
              Text("Add to salad")
                .foregroundColor(.white)
                .frame(width: geometry.size.width - 45, height: 50, alignment: .center)
                .background(Color("ingredientBackground"))
                .cornerRadius(14)
                .font(.callout)
                .shadow(color: Color.gray, radius: 5, y: 0)
                .padding(.bottom, 16)
            })
          }
          .padding(.horizontal, 20.0)
          .frame(height: (geometry.size.height + geometry.safeAreaInsets.top + geometry.safeAreaInsets.bottom) * 0.4 - geometry.safeAreaInsets.bottom)
        }
      }
    }
    .navigationBarHidden(true)
  }
}

struct IngredientDetail_Previews: PreviewProvider {
  static let modelData = ModelData()
  
  static var previews: some View {
//    ForEach(["iPhone 8", "iPhone 12 Pro", "iPhone XS Max"], id: \.self) { deviceName in
      IngredientDetail(ingredient: modelData.ingredients[0])
        .environmentObject(modelData)
//        .previewDevice(PreviewDevice(rawValue: deviceName))
//    }
  }
}
