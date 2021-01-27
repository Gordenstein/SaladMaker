//
//  Salad.swift
//  SaladMaker
//
//  Created by Eugene Gordenstein on 1/27/21.
//

import Foundation
import SwiftUI

struct Salad: Hashable, Codable, Identifiable {
  var id: Int
  var name: String
  var ingredients: [Ingredient]
  
  var nutritionFacts: NutritionFacts
  
//  var fats: Int {
//    ingredients.reduce(into: 0) { (sum, ingredient) in
//      sum += ingredient.fats
//    }
//  }
//
//  var proteins: Int {
//    ingredients.reduce(into: 0) { (sum, ingredient) in
//      sum += ingredient.proteins
//    }
//  }
//
//  var carbohydrates: Int {
//    ingredients.reduce(into: 0) { (sum, ingredient) in
//      sum += ingredient.carbohydrates
//    }
//  }
}
