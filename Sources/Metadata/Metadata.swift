//
//  Metadata.swift
//  LoggingMigrator
//
//  Created by Prickett, Jacob on 9/3/20.
//  Copyright © 2020 Jacob Prickett. All rights reserved.
//

import Foundation

/// Typealias for Metadata that will be passed with Log Messages
public typealias Metadata = [String: MetadataValue]

/// Enumeration representing the various types that can be passed as Metadata
public enum MetadataValue {
  /// Any String
  case string(String)
  /// Any object conforming to CustomStringConvertable
  case stringConvertible(CustomStringConvertible)
}

// MARK: ExpressibleByStringLiteral

extension MetadataValue: ExpressibleByStringLiteral {
  public typealias StringLiteralType = String
  
  public init(stringLiteral value: String) {
    self = .string(value)
  }
}

// MARK: CustomStringConvertible

extension MetadataValue: CustomStringConvertible {
  public var description: String {
    switch self {
    case .string(let str):
      return str
    case .stringConvertible(let repr):
      return repr.description
    }
  }
}

// MARK: ExpressibleByStringInterpolation

extension MetadataValue: ExpressibleByStringInterpolation {}

// MARK: Metadata Manipulation

extension Metadata {
  static func + (lhs: Metadata?, rhs: Metadata) -> Metadata {
    guard let lhs = lhs else { return rhs }
    return lhs.merging(rhs) { (oldValue, _) -> MetadataValue in oldValue }
  }
}
