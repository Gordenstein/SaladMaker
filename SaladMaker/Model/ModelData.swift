//
//  ModelData.swift
//  SaladMaker
//
//  Created by Eugene Gordenstein on 1/27/21.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
  @Published var ingredients: [Ingredient] = DataManager.default.load("ingredientData.json")
  @Published var addedIngredients = Set<Ingredient>()
  
  var saladHistory = DataManager.default.loadData()
  var currentSalad = Salad()
  
  var currentNutritionFacts: NutritionFacts {
    addedIngredients.reduce(into: NutritionFacts()) { (result, ingredient) in
      result.fat += ingredient.nutritionFacts.fat
      result.protein += ingredient.nutritionFacts.protein
      result.carbohydrate += ingredient.nutritionFacts.carbohydrate
      result.sugar += ingredient.nutritionFacts.sugar
      result.calories += ingredient.nutritionFacts.calories
    }
  }
  
  var categoriesOne: [String: [Ingredient]] {
    Dictionary(
      grouping: ingredients,
      by: { $0.categoryOne.rawValue }
    )
  }
  
  var categoriesTwo: [String: [Ingredient]] {
    Dictionary(
      grouping: ingredients,
      by: { $0.categoryTwo.rawValue }
    )
  }
}
