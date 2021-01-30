//
//  NutritionFacts.swift
//  SaladMaker
//
//  Created by Eugene Gordenstein on 1/27/21.
//

import Foundation

struct NutritionFacts: Hashable, Codable {  
  var fat: Double
  var protein: Double
  var carbohydrate: Double
  var sugar: Double
  var calories: Double
  
  init(fat: Double, protein: Double, carbohydrate: Double, sugar: Double, calories: Double) {
    self.fat = fat
    self.protein = protein
    self.carbohydrate = carbohydrate
    self.sugar = sugar
    self.calories = calories
  }
  
  init() {
    self.fat = 0
    self.protein = 0
    self.carbohydrate = 0
    self.sugar = 0
    self.calories = 0
  }
}
