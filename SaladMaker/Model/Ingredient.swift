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
  var weight: Int
  
  var category: Category
  enum Category: String, CaseIterable, Codable {
    case vegetablesOne = "Vegetables"
    case fruits = "Fruits"
  }
  
  private var imageName: String
  var image: Image {
    Image(imageName)
  }
}
