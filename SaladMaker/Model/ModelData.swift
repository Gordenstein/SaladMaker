//
//  ModelData.swift
//  SaladMaker
//
//  Created by Eugene Gordenstein on 1/27/21.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
  @Published var ingredients: [Ingredient] = load("ingredientData.json")
  var currentSalad: Salad = Salad(id: 0, name: "New Salad", ingredients: [], nutritionFacts: NutritionFacts())
  
  var addedIngredients: [Ingredient] {
    ingredients.filter { (ingredient) -> Bool in
      ingredient.added
    }
  }
  
  var currentNutritionFacts: NutritionFacts {
    addedIngredients.reduce(into: NutritionFacts()) { (result, ingredient) in
      result.fats += ingredient.fats
      result.proteins += ingredient.proteins
      result.carbohydrates += ingredient.carbohydrates
    }
  }
  
  var categories: [String: [Ingredient]] {
    Dictionary(
      grouping: ingredients,
      by: { $0.category.rawValue }
    )
  }
}

func load<T: Decodable>(_ filename: String) -> T {
  let data: Data
  
  guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
  else {
    fatalError("Couldn't find \(filename) in main bundle.")
  }
  
  do {
    data = try Data(contentsOf: file)
  } catch {
    fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
  }
  
  do {
    let decoder = JSONDecoder()
    return try decoder.decode(T.self, from: data)
  } catch {
    fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
  }
}
