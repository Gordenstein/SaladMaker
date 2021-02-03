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
    
  @State private var weightValue: Double
  
  init(modelData: EnvironmentObject<ModelData> = EnvironmentObject(), presentationMode: Environment<Binding<PresentationMode>> = Environment(\.presentationMode), ingredient: Ingredient) {
    self._modelData = modelData
    self._presentationMode = presentationMode
    self.ingredient = ingredient
    self._weightValue = .init(wrappedValue: Double(ingredient.weight))
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
                NutritionFactCell(weigth: $weightValue, amount: ingredient.nutritionFacts.fat, title: "Fats")
                Spacer()
                NutritionFactCell(weigth: $weightValue, amount: ingredient.nutritionFacts.protein, title: "Proteins")
                Spacer()
                NutritionFactCell(weigth: $weightValue, amount: ingredient.nutritionFacts.carbohydrate, title: "Carbohydrate")
                Spacer()
                NutritionFactCell(weigth: $weightValue, amount: ingredient.nutritionFacts.sugar, title: "Sugar")
                Spacer()
                NutritionFactCell(weigth: $weightValue, amount: ingredient.nutritionFacts.calories, title: "Calories")
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
              
              Stepper(onIncrement: increaseWeight,
              onDecrement: decreaseWeight) {
                HStack(spacing: 0) {
                  Text("Amount: ")
                  Text(String(Int(weightValue)))
                    .fontWeight(.bold)
                    .padding(.trailing, 2)
                  Text("g")
                }
              }.padding(.horizontal)
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
              if !self.ingredient.added {
                self.addToSalad()
              } else {
                removeFromSalad()
              }
              presentationMode.wrappedValue.dismiss()
            }, label: {
              Text(self.ingredient.added ? "Remove" : "Add to salad")
                .foregroundColor(.white)
                .frame(width: geometry.size.width - 45, height: 50, alignment: .center)
                .background(self.ingredient.added ? Color("removeButtonBackground") : Color("ingredientBackground"))
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
  
  private func increaseWeight() {
    self.weightValue += 10
    if self.weightValue >= 500 {
      self.weightValue = 500
    }
  }
  
  private func decreaseWeight() {
    self.weightValue -= 10
    if self.weightValue < 10 {
      self.weightValue = 10
    }
  }
  
  private func addToSalad() {
    modelData.ingredients[ingredientIndex].added.toggle()
    modelData.ingredients[ingredientIndex].nutritionFacts.fat = ingredient.nutritionFacts.fat * weightValue / 100
    modelData.ingredients[ingredientIndex].nutritionFacts.protein = ingredient.nutritionFacts.protein * weightValue / 100
    modelData.ingredients[ingredientIndex].nutritionFacts.carbohydrate = ingredient.nutritionFacts.carbohydrate * weightValue / 100
    modelData.ingredients[ingredientIndex].nutritionFacts.sugar = ingredient.nutritionFacts.sugar * weightValue / 100
    modelData.ingredients[ingredientIndex].nutritionFacts.calories = ingredient.nutritionFacts.calories * weightValue / 100
    modelData.ingredients[ingredientIndex].weight = Int(weightValue)
    modelData.addedIngredients.insert(modelData.ingredients[ingredientIndex])
  }
  
  private func removeFromSalad() {
    modelData.addedIngredients.remove( modelData.ingredients[ingredientIndex])
    modelData.ingredients[ingredientIndex].added.toggle()
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
