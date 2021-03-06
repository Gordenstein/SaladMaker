//
//  SaladBuilder.swift
//  SaladMaker
//
//  Created by Eugene Gordenstein on 1/27/21.
//

import SwiftUI

struct SaladBuilder: View {
  @EnvironmentObject var modelData: ModelData
  @State private var showingProfile = false
  
  @State private var currentSliderPositionY: CGFloat = 485.0
  @GestureState private var slideOffset = CGSize.zero
  @State private var shouldScrooll = false
  
  @State private var buildSaladAction: Int?
  
  var body: some View {
    NavigationView {
      ZStack(alignment: .top) {
        LinearGradient(
          gradient: Gradient(colors: [Color("backgroundGradientStart"), Color("backgroundGradientEnd")]),
          startPoint: UnitPoint(x: 0, y: 0.2),
          endPoint: UnitPoint(x: 0.6, y: 0)
        )
        .ignoresSafeArea()
        
        VStack(spacing: 0) {
          HStack {
            Text("Build your salad")
              .foregroundColor(.white)
              .font(.largeTitle)
            
            Spacer()
            
            Button(action: { showingProfile.toggle() }) {
              Image(systemName: "person.crop.circle")
                .font(.largeTitle)
                .foregroundColor(.white)
            }
          }
          .padding(.horizontal)
          
          SaladCompactView()
          
          NavigationLink(destination: SaladDetail(salad: modelData.currentSalad), tag: 1, selection: $buildSaladAction) {
            EmptyView()
          }
          
          MixSaladRectangleButton(title: "Mix it", backgroundColor: .clear, buttonAction: {
            modelData.currentSalad.ingredients = Array(modelData.addedIngredients)
            modelData.currentSalad.nutritionFacts = modelData.currentNutritionFacts
            self.buildSaladAction = 1
          }, disabled: modelData.addedIngredients.isEmpty)
          
//          Button(action: {
//            modelData.currentSalad.ingredients = Array(modelData.addedIngredients)
//            modelData.currentSalad.nutritionFacts = modelData.currentNutritionFacts
//            self.buildSaladAction = 1
//          }, label: {
//            Text("Mix it")
//              .foregroundColor(modelData.addedIngredients.isEmpty ? Color( red: 235/255, green: 235/255, blue: 245/255, opacity: 0.6) : Color(UIColor.white))
//              .font(.title)
//              .foregroundColor(.white)
//              .padding(.horizontal, 90)
//              .padding(.vertical, 10)
//              .overlay(
//                RoundedRectangle(cornerRadius: 14)
//                  .stroke(Color.white, lineWidth: 3)
//              )
//          })
//          .disabled(modelData.addedIngredients.isEmpty)
        }
        .sheet(isPresented: $showingProfile) {
          SaladHistory()
            .environmentObject(modelData)
        }
        
        GeometryReader { geometry in
          CategoryHome(shouldScroll: $shouldScrooll)
            .cornerRadius(10)
            .frame(height: 550)
            .offset(y: self.currentSliderPositionY + self.slideOffset.height > 250 ? self.currentSliderPositionY + self.slideOffset.height : 250)
            .highPriorityGesture(DragGesture(coordinateSpace: .global)
                                  .updating(self.$slideOffset, body: { (value, slideOffset, transaction) in
                                    slideOffset = value.translation
                                  })
                                  .onEnded({ value in
                                    if value.translation.height > 150 {
                                      self.currentSliderPositionY = 485
                                      self.shouldScrooll = false
                                    } else if value.translation.height < -150 {
                                      self.currentSliderPositionY = 270
                                      self.shouldScrooll = true
                                    }
                                  }))
            .animation(.default)
        }
      }
      .navigationBarHidden(true)
    }
  }
}

struct SaladBuilder_Previews: PreviewProvider {
  static var previews: some View {
    SaladBuilder()
      .environmentObject(ModelData())
  }
}
