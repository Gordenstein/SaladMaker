//
//  AddToSaladRectangleButton.swift
//  SaladMaker
//
//  Created by Eugene Gordenstein on 2/4/21.
//

import SwiftUI

struct AddToSaladRectangleButton: View {
  let title: String
  let backgroundColor: Color
  let buttonAction: () -> Void
  
  var body: some View {
    GeometryReader { geometry in
      Button(action: buttonAction, label: {
        Text(title)
          .foregroundColor(.white)
          .frame(width: geometry.size.width, height: 50, alignment: .center)
          .background(backgroundColor)
          .cornerRadius(14)
          .font(.callout)
          .shadow(color: Color.gray, radius: 5, y: 0)
          .padding(.bottom, 16)
      })
    }
  }
}

struct AddToSaladRectangleButton_Previews: PreviewProvider {
  static var previews: some View {
    AddToSaladRectangleButton(title: "Add to Salad", backgroundColor: Color.green, buttonAction: {})
  }
}
