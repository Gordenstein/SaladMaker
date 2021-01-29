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
  }
}

struct SaladBuilder_Previews: PreviewProvider {
  static var previews: some View {
    SaladBuilder()
      .environmentObject(ModelData())
  }
}
