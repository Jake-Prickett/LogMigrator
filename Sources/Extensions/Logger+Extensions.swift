//
//  Logger+Extensions.swift
//  LoggingMigrator
//
//  Created by Prickett, Jacob on 9/2/20.
//  Copyright © 2020 Jacob Prickett. All rights reserved.
//

import Foundation
import os.log

// Loggable conformance to the iOS 14 Logger

@available(iOS 14.0, *)
extension os.Logger: Loggable {
  func debugLog(
    _ message: @autoclosure () -> Message,
    metadata: @autoclosure () -> Metadata?
  ) {
    self.logInternal(.debug, message(), metadata())
  }
  
  func infoLog(
    _ message: @autoclosure () -> Message,
    metadata: @autoclosure () -> Metadata?
  ) {
    self.logInternal(.info, message(), metadata())
  }
  
  func defaultLog(
    _ message: @autoclosure () -> Message,
    metadata: @autoclosure () -> Metadata?
  ) {
    self.logInternal(.default, message(), metadata())
  }
  
  func errorLog(
    _ message: @autoclosure () -> Message,
    metadata: @autoclosure () -> Metadata?
  ) {
    self.logInternal(.error, message(), metadata())
  }
  
  func criticalLog(
    _ message: @autoclosure () -> Message,
    metadata: @autoclosure () -> Metadata?
  ) {
    self.logInternal(.fault, message(), metadata())
  }
  
  func logInternal(
    _ level: OSLogType,
    _ message: Message,
    _ metadata: Metadata?
  ) {
    let formattedMetadata = prettify(metadata ?? [:])
    self.log(level: level, "\(formattedMetadata ?? "") \(message)")
  }
  
  private func prettify(_ metadata: Metadata) -> String? {
    if !metadata.isEmpty {
      return metadata.lazy
        .sorted { $0.key < $1.key }
        .map { "\($0)=\($1)" }
        .joined(separator: " ")
    } else {
      return nil
    }
  }
}
