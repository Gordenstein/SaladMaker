//
//  MixSaladRectangleButton.swift
//  SaladMaker
//
//  Created by Eugene Gordenstein on 2/6/21.
//

import SwiftUI

struct MixSaladRectangleButton: View {
  let title: String
  let backgroundColor: Color
  let buttonAction: () -> Void
  let disabled: Bool
  
  var color: Color {
    disabled ? Color( red: 235/255, green: 235/255, blue: 245/255, opacity: 0.6) : Color(UIColor.white)
  }
  
  var body: some View {
    Button(action: buttonAction, label: {
      Text("Mix it")
        .foregroundColor(color)
        .frame(width: 360, height: 50, alignment: .center)
        .background(backgroundColor)
        .font(.title3)
        .overlay(
          RoundedRectangle(cornerRadius: 14)
            .stroke(color, lineWidth: 3)
        )
        .padding(.bottom, 16)
    })
    .disabled(disabled)
  }
}

struct MixSaladRectangleButton_Previews: PreviewProvider {
  static var previews: some View {
    MixSaladRectangleButton(title: "Add to Salad", backgroundColor: Color.clear, buttonAction: {}, disabled: false)
      .background(Color.blue)
  }
}
