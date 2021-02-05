//
//  DataManager.swift
//  SaladMaker
//
//  Created by Eugene Gordenstein on 2/5/21.
//

import Foundation

public class DataManager {
  
  private let fileName = "history"
  private let filePathExtension = "json"
  private let encoder = JSONEncoder()
  private let decoder = JSONDecoder()
  private let directoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
  
  static let `default` = DataManager()
  
  public init() {
    
  }
  
  func saveData(objectForSaving: [Salad]) {
    let fileURL = URL(fileURLWithPath: fileName, relativeTo: directoryURL)
      .appendingPathExtension(filePathExtension)
    
    do {
      let data = try encoder.encode(objectForSaving)
      try data.write(to: fileURL)
    } catch {
      print("Couldn't save \(objectForSaving) \n\(error)")
    }
  }
  
  func loadData() -> [Salad] {
    let fileURL = URL(fileURLWithPath: fileName, relativeTo: directoryURL)
      .appendingPathExtension(filePathExtension)
    
    guard let data = try? Data(contentsOf: fileURL)  else {
      return [Salad]()
    }
    
    do {
      return try decoder.decode([Salad].self, from: data)
    } catch {
      print("Couldn't load data \n\(error)")
      return [Salad]()
    }
  }
  
  func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
      fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
      data = try Data(contentsOf: file)
    } catch {
      fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
      return try decoder.decode(T.self, from: data)
    } catch {
      fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
  }
}

