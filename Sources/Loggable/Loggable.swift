//
//  Loggable.swift
//  LoggingMigrator
//
//  Created by Prickett, Jacob on 9/2/20.
//  Copyright © 2020 Jacob Prickett. All rights reserved.
//

import Foundation
import os.log

protocol Loggable {
  func debugLog(_ message:  @autoclosure () -> Message, metadata: @autoclosure () -> Metadata?)
  func infoLog(_ message:  @autoclosure () -> Message, metadata: @autoclosure () -> Metadata?)
  func defaultLog(_ message:  @autoclosure () -> Message, metadata: @autoclosure () -> Metadata?)
  func errorLog(_ message:  @autoclosure () -> Message, metadata: @autoclosure () -> Metadata?)
  func criticalLog(_ message: @autoclosure () -> Message, metadata: @autoclosure () -> Metadata?)
}
