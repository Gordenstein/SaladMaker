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
  var nutritionFacts: NutritionFacts
  var added: Bool
  
  var category: Category
  enum Category: String, CaseIterable, Codable {
    case vegetablesOne = "Vegetables One"
    case vegetablesTwo = "Vegetables Two"
    case vegetablesThree = "Vegetables Three"
    case vegetablesFour = "Vegetables Four"
  }
  
  private var imageName: String
  var image: Image {
    Image(imageName)
  }
}
