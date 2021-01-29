//
//  GraphCapsule.swift
//  SaladMaker
//
//  Created by Eugene Gordenstein on 1/29/21.
//

import SwiftUI

struct GraphCapsule: View {
  var height: CGFloat
  var range: Range<Double>
  var overallRange: Range<Double>
  
  var heightRatio: CGFloat {
    max(CGFloat(magnitude(of: range) / magnitude(of: overallRange)), 0.15)
  }
  
  var offsetRatio: CGFloat {
      CGFloat((range.lowerBound - overallRange.lowerBound) / magnitude(of: overallRange))
  }
  
  var body: some View {
    Capsule()
      .fill(Color.white)
      .frame(height: height * heightRatio)
      .offset(x: 0, y: height * offsetRatio)
  }
}

func magnitude(of range: Range<Double>) -> Double {
  return range.upperBound - range.lowerBound
}

struct GraphCapsule_Previews: PreviewProvider {
  static var previews: some View {
    // The graph that uses the capsule tints it by multiplying against its
    // base color of white. Emulate that behavior here in the preview.
    GraphCapsule(height: 800, range: 0..<50, overallRange: 0..<100)
      .colorMultiply(.blue)
  }
}
