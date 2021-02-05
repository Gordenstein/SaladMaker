//
//  SaladDetail.swift
//  SaladMaker
//
//  Created by Eugene Gordenstein on 1/28/21.
//

import SwiftUI

struct SaladDetail: View {
  @EnvironmentObject var modelData: ModelData
  @Environment(\.presentationMode) var presentationMode

  var salad: Salad
  
  var body: some View {
    VStack {
      HStack {
        Button(action: {
          presentationMode.wrappedValue.dismiss()
        }, label: {
          Image(systemName: "chevron.backward")
          Text("Back")
        })
        .padding(.leading, 8)
        
        Spacer()
        
        Button(action: {
          modelData.saladHistory.append(modelData.currentSalad)
          DataManager.default.saveData(objectForSaving: modelData.saladHistory)
          modelData.addedIngredients = []
          for i in 0..<modelData.ingredients.count {
            modelData.ingredients[i].added = false
          }
          presentationMode.wrappedValue.dismiss()
        }, label: {
          Text("Save")
        })
          .padding(.trailing)
      }
      .font(.headline)
      .foregroundColor(.white)
      
      Group {
        Text("🥗")
          .font(Font.system(size: 100))
        Text("Your salad is ready✨")
          .font(.title)
        Text("You can save it by pressing Save or Click back if you want to change it ")
          .font(.title3)
      }
      .padding(.vertical, 4)
      .foregroundColor(.white)
      
      VStack(alignment: .leading) {
        HStack {
          Text("Name")
            .bold()
          
          Divider()
            .frame(height: 20)
          
          TextField("New salad", text: $modelData.currentSalad.name)
        }
        
        .onAppear {
          self.setDefaultSaladName(salad: modelData.currentSalad)
        }
        .padding(.vertical)
        
        Text("Ingredients")
          .bold()
          .padding(.vertical)
        
        ScrollView {
          let rows = [GridItem(), GridItem(),]
          LazyVGrid(columns: rows, alignment: .center, spacing: 16) {
            ForEach(modelData.currentSalad.ingredients) { ingredient in
              SaladIngredient(ingredient: ingredient)
                .shadow(color: Color(UIColor.secondarySystemFill), radius: 6, y: 5)
            }
          }
        }
      }
      .padding()
      .background(Color.white)
      .cornerRadius(20)
      .ignoresSafeArea()
    }
    .background(Color("ingredientBackground")
                  .ignoresSafeArea())
    .navigationBarHidden(true)
  }
  
  private func setDefaultSaladName(salad: Salad) {
    modelData.currentSalad.name = getDefaultSaladName(salad: salad)
  }
  
  private func getDefaultSaladName(salad: Salad) -> String {
    let fatPercentage = salad.nutritionFacts.fat / 17
    let proteinPercentage = salad.nutritionFacts.protein / 64
    let carbohydratePercentage = salad.nutritionFacts.carbohydrate / 130
    let sugarPercentage = salad.nutritionFacts.sugar / 36
    let caloriesPercentage = salad.nutritionFacts.calories / 1200
    let nutritionFactsPercentage = [fatPercentage,
                                    proteinPercentage,
                                    carbohydratePercentage,
                                    sugarPercentage,
                                    caloriesPercentage]
    
    var maxPercentage = nutritionFactsPercentage[0]
    var maxIndex = 0
    
    for i in 1..<nutritionFactsPercentage.count {
      if nutritionFactsPercentage[i] > maxPercentage {
        maxPercentage = nutritionFactsPercentage[i]
        maxIndex = i
      }
    }
    
    switch maxIndex {
    case 0:
      return "Fat-rich salad"
    case 1:
      return "Protein-rich salad"
    case 2:
      return "Carbs-rich salad"
    case 3:
      return "Sweet salad"
    default:
      return "Nutritious salad"
    }
  }
}

struct SaladDetail_Previews: PreviewProvider {
  static var previews: some View {
    let salad = Salad()
    SaladDetail(salad: salad)
      .environmentObject(ModelData())
  }
}
