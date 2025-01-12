//
//  OptionSet.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 11/5/24.
//

#if !hasFeature(Embedded)
extension OptionSet {
  @inline(never)
  internal func buildDescription(
    _ descriptions: [(Element, StaticString)]
  ) -> String {
    var copy = self
    var result = "["

    for (option, name) in descriptions {
      if _slowPath(copy.contains(option)) {
        result += name.description
        copy.remove(option)
        if !copy.isEmpty { result += ", " }
      }
    }

    if _slowPath(!copy.isEmpty) {
      result += "\(Self.self)(rawValue: \(copy.rawValue))"
    }
    result += "]"
    return result
  }
}
#endif
