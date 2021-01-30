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
}
