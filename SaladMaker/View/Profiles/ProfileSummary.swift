//
//  ProfileSummary.swift
//  SaladMaker
//
//  Created by Eugene Gordenstein on 1/28/21.
//

import SwiftUI

struct ProfileSummary: View {
  @EnvironmentObject var modelData: ModelData
  
  var body: some View {
    VStack {
      Text("Profile summary")
        .padding()
      
      Text("History")
        .padding()
      
      HStack {
        Text(modelData.currentSalad.name)
        
        Text(modelData.currentSalad.name)
      }
    }
  }
}

struct ProfileSummary_Previews: PreviewProvider {
  static var previews: some View {
    ProfileSummary()
      .environmentObject(ModelData())
  }
}
