//
//  Message.swift
//  LoggingMigrator
//
//  Created by Prickett, Jacob on 9/3/20.
//  Copyright © 2020 Jacob Prickett. All rights reserved.
//

import Foundation

public struct Message: ExpressibleByStringLiteral, Equatable, CustomStringConvertible, ExpressibleByStringInterpolation {
  public typealias StringLiteralType = String
  
  private var value: String
  
  public init(stringLiteral value: String) {
    self.value = value
  }
  
  public var description: String {
    return value
  }
}
