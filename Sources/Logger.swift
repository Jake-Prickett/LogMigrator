//
//  Logger.swift
//  LoggingMigrator
//
//  Created by Prickett, Jacob on 8/25/20.
//  Copyright © 2020 Jacob Prickett. All rights reserved.
//

import Foundation
@_exported import os.log

/// *Logger*
/// Entrypoint into Logging Migration library. During initialization, this object will construct
/// the proper logger for the current OS version.
///
/// ```
/// let logger = Logger(subsystem: "ExampleLogger", category: "Test")
/// logger["metadata1"] = "informatave metadata"
///
/// // Output: **Redacted** [Test] metadata1=informative metadata level=debug Debug Log Message
/// logger.debug("Debug Log Message")
/// ```
public struct Logger {
  private var metadata: Metadata = [:]
  private var logger: Loggable
  
  /// Logger Initializer
  /// Specify the subsystem and category in order to initailize a logger
  /// that logs to all of the supported backend logging systems.
  /// - Parameters:
  ///   - subsystem: Subsystem Description
  ///   - category: Category Description
  public init(subsystem: String, category: String) {
    let subsystemStr = "com.meijer.mobile.\(subsystem)"
    if #available(iOS 14.0, *) {
      logger = os.Logger(subsystem: subsystemStr, category: category)
    } else {
      logger = OSLog(subsystem: subsystemStr, category: category)
    }
  }
  
  /// Logger owned metadata that will be attached to each log message
  public subscript(_ metadataKey: String) -> Metadata.Value? {
    get {
      return metadata[metadataKey]
    }
    set {
      metadata[metadataKey] = newValue
    }
  }
  
  // MARK: Logging Methods
  
  // TODO: Describe logging methods and how they are stored, which levels are persisted, which levels to use when (examples), etc.
  
  /// Logs a message to help debug problems during the development of your code.
  /// - Parameters:
  ///   - message: Message to log
  ///   - metadata: Data to provide some insight to the context at the time of the log
  ///
  /// ```
  /// logger.debug("debug log message", metadata: ["example": "metadata"])
  /// ```
  public func debug(
    _ message: @autoclosure () -> Message,
    metadata: @autoclosure () -> Metadata? = nil
  ) {
    logger.debugLog(message(), metadata: metadata() + self.metadata)
  }
  
  /// Logs a message that is helpful, but not essential, to diagnose issues with your code.
  /// - Parameters:
  ///   - message: Message to log
  ///   - metadata: Data to provide some insight to the context at the time of the log
  ///
  /// ```
  /// logger.info("info log message", metadata: ["example": "metadata"])
  /// ```
  public func info(
    _ message: @autoclosure () -> Message,
    metadata: @autoclosure () -> Metadata? = nil
  ) {
      logger.infoLog(message(), metadata: metadata() + self.metadata)
  }
  
  /// Logs a message that is essential to troubleshoot problems later.
  /// - Parameters:
  ///   - message: Message to log
  ///   - metadata: Data to provide some insight to the context at the time of the log
  ///
  /// ```
  /// logger.log("default log message", metadata: ["example": "metadata"])
  /// ```
  public func log(
    _ message: @autoclosure () -> Message,
    metadata: @autoclosure () -> Metadata? = nil
  ) {
      logger.defaultLog(message(), metadata: metadata() + self.metadata)
  }
  
  /// Logs an error that occurred during the execution of your code.
  /// - Parameters:
  ///   - message: Message to log
  ///   - metadata: Data to provide some insight to the context at the time of the log
  ///
  /// ```
  /// logger.error("error log message", metadata: ["example": "metadata"])
  /// ```
  public func error(
    _ message: @autoclosure () -> Message,
    metadata: @autoclosure () -> Metadata? = nil
  ) {
      logger.errorLog(message(), metadata: metadata() + self.metadata)
  }
  
  /// Logs a critical error that occurred during the execution of your code.
  /// - Parameters:
  ///   - message: Message to log
  ///   - metadata: Data to provide some insight to the context at the time of the log
  ///
  /// ```
  /// logger.critical("critical log message", metadata: ["example": "metadata"])
  /// ```
  public func critical(
    _ message: @autoclosure () -> Message,
    metadata: @autoclosure () -> Metadata? = nil
  ) {
      logger.criticalLog(message(), metadata: metadata() + self.metadata)
  }
}
