//
//  NutritionFacts.swift
//  SaladMaker
//
//  Created by Eugene Gordenstein on 1/27/21.
//

import Foundation

struct NutritionFacts: Hashable, Codable {  
  var fats: Int
  var proteins: Int
  var carbohydrates: Int
  
  init() {
    self.fats = 0
    self.proteins = 0
    self.carbohydrates = 0
  }
}
