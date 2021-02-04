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
  
  var categoryOne: CategoryOne
  enum CategoryOne: String, CaseIterable, Codable {
    case lowCalories = "Low Calories"
    case proteinRich = "Protein Rich"
    case sweet = "Sweet"
    case fatRich = "Fat Rich"
  }
  
  var categoryTwo: CategoryTwo
  enum CategoryTwo: String, CaseIterable, Codable {
    case vegetables = "Vegetables"
    case greenVegetables = "Green Vegetables"
    case fruits = "Fruits"
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
    self.categoryOne = try container.decode(Ingredient.CategoryOne.self, forKey: CodingKeys.categoryOne)
    self.categoryTwo = try container.decode(Ingredient.CategoryTwo.self, forKey: CodingKeys.categoryTwo)
    self.imageName = try container.decode(String.self, forKey: CodingKeys.imageName)
    self.nutritionFacts = NutritionFacts()
  }
}
