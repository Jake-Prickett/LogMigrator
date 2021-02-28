//
//  OSLog+Extensions.swift
//  LoggingMigrator
//
//  Created by Prickett, Jacob on 9/2/20.
//  Copyright © 2020 Jacob Prickett. All rights reserved.
//

import Foundation
import os.log

extension OSLog: Loggable {
  func debugLog(
    _ message:  @autoclosure () -> Message,
    metadata: @autoclosure () -> Metadata?
  ) {
    let formattedMetadata = prettify(metadata() ?? [:]) ?? ""
    os_log(.debug, log: self, "%{public}@", "\(formattedMetadata) \(message())")
  }
  
  func infoLog(
    _ message:  @autoclosure () -> Message,
    metadata: @autoclosure () -> Metadata?
  ) {
    let formattedMetadata = prettify(metadata() ?? [:]) ?? ""
    os_log(.info, log: self, "%{public}@", "\(formattedMetadata) \(message())")
  }
  
  func defaultLog(
    _ message:  @autoclosure () -> Message,
    metadata: @autoclosure () -> Metadata?
  ) {
    let formattedMetadata = prettify(metadata() ?? [:]) ?? ""
    os_log(.default, log: self, "%{public}@", "\(formattedMetadata) \(message())")
  }
  
  func errorLog(
    _ message:  @autoclosure () -> Message,
    metadata: @autoclosure () -> Metadata?
  ) {
    let formattedMetadata = prettify(metadata() ?? [:]) ?? ""
    os_log(.error, log: self, "%{public}@", "\(formattedMetadata) \(message())")
  }
  
  func criticalLog(
    _ message:  @autoclosure () -> Message,
    metadata: @autoclosure () -> Metadata?
  ) {
    let formattedMetadata = prettify(metadata() ?? [:]) ?? ""
    os_log(.fault, log: self, "%{public}@", "\(formattedMetadata) \(message())")
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
