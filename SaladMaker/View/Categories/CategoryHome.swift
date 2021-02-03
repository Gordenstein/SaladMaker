//
//  CategoryHome.swift
//  SaladMaker
//
//  Created by Eugene Gordenstein on 1/27/21.
//

import SwiftUI

struct CategoryHome: View {
  @EnvironmentObject var modelData: ModelData
  @State private var caregoryType = "first"
  @Binding var shouldScroll: Bool
  
  init(modelData: EnvironmentObject<ModelData> = EnvironmentObject(), shouldScroll: Binding<Bool>) {
    self._modelData = modelData
    self._shouldScroll = shouldScroll
    UIScrollView.appearance().bounces = false
  }
  
  var body: some View {
    VStack(spacing: 0) {
      VStack(spacing: 0) {
        Color.init(red: 190 / 255, green: 190 / 255, blue: 192 / 255)
          .frame(width: 36, height: 5)
          .cornerRadius(2.5)
          .padding(.top, 5.5)
        
        Picker("", selection: $caregoryType) {
          Text("First").tag("first")
          Text("Second").tag("second")
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding(.horizontal, 90)
        .padding(.top, 10)
        .padding(.bottom)
      }
      .background(Color.white, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
      
      Color.init(UIColor.opaqueSeparator)
        .frame(height: 1)
      
      ScrollView(axes, showsIndicators: false) {
        VStack {
          ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
            CategoryRow(categoryName: key, items: modelData.categories[key]!)
          }
        }
        .padding(.top)
        .padding(.bottom, 86)
        .background(Color.white, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
      }
    }
  }
  
  private var axes: Axis.Set {
    return shouldScroll ? .vertical : []
  }
}

struct CategoryHome_Previews: PreviewProvider {
  static var previews: some View {
    CategoryHome(shouldScroll: .constant(true))
      .environmentObject(ModelData())
      .background(Color.green)
  }
}
