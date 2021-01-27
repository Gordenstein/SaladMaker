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
  var description: String
  var fats: Int
  var proteins: Int
  var carbohydrates: Int
  
  private var imageName: String
  var image: Image {
    Image(imageName)
  }
}
