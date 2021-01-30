//
//  NutritionFacts.swift
//  SaladMaker
//
//  Created by Eugene Gordenstein on 1/27/21.
//

import Foundation

struct NutritionFacts: Hashable, Codable {  
  var fat: Int
  var protein: Int
  var carbohydrate: Int
  var sugar: Int
  var calories: Int
  
  init(fat: Int, protein: Int, carbohydrate: Int, sugar: Int, calories: Int) {
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
