//
//  Ingredient.swift
//  SaladMaker
//
//  Created by Eugene Gordenstein on 1/27/21.
//

import Foundation
import SwiftUI

struct Ingredient: Hashable, Codable, Identifiable {
  var id: Int
  var name: String
  var description: String
  var fats: Int
  var proteins: Int
  var carbohydrates: Int
  
  var category: Category
  enum Category: String, CaseIterable, Codable {
    case vegetablesOne = "Vegetables One"
    case vegetablesTwo = "Vegetables Two"
  }
  
  private var imageName: String
  var image: Image {
    Image(imageName)
  }
}


