//
//  Salad.swift
//  SaladMaker
//
//  Created by Eugene Gordenstein on 1/27/21.
//

import Foundation
import SwiftUI

struct Salad: Hashable, Codable, Identifiable {
  var id: UUID
  var name: String
  var ingredients: [Ingredient]
  var nutritionFacts: NutritionFacts
  
  init() {
    self.id = UUID()
    self.name = ""
    self.ingredients = []
    self.nutritionFacts = NutritionFacts()
  }
}
