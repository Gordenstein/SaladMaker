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
  
  var body: some View {
    NavigationView {
      ZStack {
        LinearGradient(
          gradient: Gradient(colors: [Color("backgroundGradientStart"), Color("backgroundGradientEnd")]),
          startPoint: UnitPoint(x: 0, y: 0.2),
          endPoint: UnitPoint(x: 0.6, y: 0)
        )
        .ignoresSafeArea()
        
        VStack(spacing: 0) {
          SaladCompactView(salad: modelData.currentSalad)
          
          CategoryHome()
            .cornerRadius(20)
            .offset(y: -200)
            .padding(.bottom, -200)
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
      }
      .navigationTitle("Salad")
      .navigationBarTitleDisplayMode(.large)
      .navigationBarHidden(true)
    }
  }
  
  static let gradientStart = Color(red: 50 / 255, green: 70 / 255, blue: 51 / 255)
  static let gradientEnd = Color(red: 79 / 255, green: 91 / 255, blue: 64 / 255)
}

struct SaladBuilder_Previews: PreviewProvider {
  static var previews: some View {
    SaladBuilder()
      .environmentObject(ModelData())
  }
}
