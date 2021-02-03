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
  var nutritionFactsPerGram: NutritionFacts
  var nutritionFacts = NutritionFacts()
  var added: Bool
  var weight: Double
  
  var category: Category
  enum Category: String, CaseIterable, Codable {
    case vegetablesOne = "Vegetables"
    case fruits = "Fruits"
    case test = "Test"
  }
  
  private var imageName: String
  var image: Image {
    Image(imageName)
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.id = try container.decode(Int.self, forKey: CodingKeys.id)
    self.name = try container.decode(String.self, forKey: CodingKeys.name)
    self.description = try container.decode(String.self, forKey: CodingKeys.description)
    self.nutritionFactsPerGram = try container.decode(NutritionFacts.self, forKey: CodingKeys.nutritionFactsPerGram)
    self.added = try container.decode(Bool.self, forKey: CodingKeys.added)
    self.weight = try container.decode(Double.self, forKey: CodingKeys.weight)
    self.category = try container.decode(Ingredient.Category.self, forKey: CodingKeys.category)
    self.imageName = try container.decode(String.self, forKey: CodingKeys.imageName)
    self.nutritionFacts = NutritionFacts()
  }
}
