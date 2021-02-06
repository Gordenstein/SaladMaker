//
//  SaladHistory.swift
//  SaladMaker
//
//  Created by Eugene Gordenstein on 1/28/21.
//

import SwiftUI

struct SaladHistory: View {
  @EnvironmentObject var modelData: ModelData
  
  var body: some View {
    VStack {
      HStack {
        Text("About the author")
          .padding()
          .foregroundColor(.white)
          .font(.title)
        
        Spacer()
      }
            
      ScrollView {
        HStack {
          Text("History")
            .bold()
            .padding()
          Spacer()
        }
        VStack(alignment: .center, spacing: 16) {
          ForEach(modelData.saladHistory) { salad in
            HistoryItem(salad: salad)
              .shadow(color: Color(UIColor.secondarySystemFill), radius: 16, y: 3)
              .padding(.horizontal, 8)
          }
        }
      }
      .padding(.vertical)
      .background(Color.white)
      .cornerRadius(20)
      .ignoresSafeArea()
    }
    .background(Color("ingredientBackground"))
  }
}

struct ProfileSummary_Previews: PreviewProvider {
  static var previews: some View {
    let modelData = ModelData()
    modelData.saladHistory = [Salad(id: UUID(), name: "New name", ingredients: [Ingredient](), nutritionFacts: NutritionFacts()), Salad(id: UUID(), name: "New name", ingredients: [Ingredient](), nutritionFacts: NutritionFacts())]
    return SaladHistory()
      .environmentObject(modelData)
      .background(Color.blue)
  }
}
