//
//  AddToSaladButton.swift
//  SaladMaker
//
//  Created by Eugene Gordenstein on 1/27/21.
//

import SwiftUI

struct AddToSaladButton: View {
  @Binding var added: Bool
  
  var body: some View {
    Button(action: {
      added.toggle()
    }) {
      Image(systemName: added ? "checkmark.circle.fill" : "plus.circle")
        .foregroundColor(added ? Color.green : Color.blue)
    }
  }
}

struct AddToSaladButton_Previews: PreviewProvider {
  static var previews: some View {
    AddToSaladButton(added: .constant(true))
  }
}
