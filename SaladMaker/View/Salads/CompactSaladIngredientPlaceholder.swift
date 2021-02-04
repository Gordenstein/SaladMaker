//
//  CompactSaladIngredientPlaceholder.swift
//  SaladMaker
//
//  Created by Eugene Gordenstein on 2/3/21.
//

import SwiftUI

struct CompactSaladIngredientPlaceholder: View {
  var transparent: Bool
  
  var body: some View {
    itemBackgroundColor
      .frame(width: 160, height: 30)
      .cornerRadius(8)
  }
  
  var itemBackgroundColor: Color {
    self.transparent ? Color.clear : Color.white.opacity(0.3)
  }
}

struct IngredientCompactPlaceholder_Previews: PreviewProvider {
    static var previews: some View {
      CompactSaladIngredientPlaceholder(transparent: false)
          .background(Color.green)
    }
}
