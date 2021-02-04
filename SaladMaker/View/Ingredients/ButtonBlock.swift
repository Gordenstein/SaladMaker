//
//  ButtonBlock.swift
//  SaladMaker
//
//  Created by Eugene Gordenstein on 2/4/21.
//

import SwiftUI

struct ButtonBlock: View {
  let added: Bool
  let addAction: () -> Void
  let addTitle: String
  let removeAtion: () -> Void
  let removeTitle: String
  let updateAction: () -> Void
  let updateTitle: String
  
  var body: some View {
    if !added {
      AddToSaladRectangleButton(title: addTitle, backgroundColor: Color("ingredientBackground"), buttonAction: addAction)
    } else {
      HStack {
        AddToSaladRectangleButton(title: removeTitle, backgroundColor: Color("removeButtonBackground"), buttonAction: removeAtion)
        AddToSaladRectangleButton(title: updateTitle, backgroundColor: Color("ingredientBackground"), buttonAction: updateAction)
      }
    }
  }
}

struct ButtonBlock_Previews: PreviewProvider {
  static var previews: some View {
    ButtonBlock(added: true,
                addAction: {},
                addTitle: "Add",
                removeAtion: {},
                removeTitle: "Remove",
                updateAction: {},
                updateTitle: "Update")
  }
}
