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
  
  @State private var currentSliderPositionY: CGFloat = 500.0
  @GestureState private var slideOffset = CGSize.zero
  @State private var shouldScrooll = false
  
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
          SaladCompactView(salad: modelData.currentSalad)
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .toolbar {
          Button(action: { showingProfile.toggle() }) {
            Image(systemName: "person.crop.circle")
          }
        }
        .sheet(isPresented: $showingProfile) {
          ProfileSummary()
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
                                      self.currentSliderPositionY = 500
                                      self.shouldScrooll = false
                                    } else if value.translation.height < -150 {
                                      self.currentSliderPositionY = 300
                                      self.shouldScrooll = true
                                    }
                                  }))
            .animation(.default)
        }
      }
//      .navigationTitle("Salad")
//      .navigationBarTitleDisplayMode(.inline)
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
