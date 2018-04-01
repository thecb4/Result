//
//  ResultProtocol.swift
//  Result
//
//  Created by Cavelle Benjamin on 18-Jan-14 (02).
//

import Foundation

//  Copyright (c) 2015 Rob Rix. All rights reserved.
/// A protocol that can be used to constrain associated types as `Result`.
public protocol ResultProtocol {
  associatedtype Value
  associatedtype Error: Swift.Error
  
  init(value: Value)
  init(error: Error)
  
  var result: Result<Value, Error> { get }
  
  /// Case analysis for ResultProtocol.
  ///
  /// Returns the value produced by appliying `ifFailure` to the error if self represents a failure, or `ifSuccess` to the result value if self represents a success.
  func analysis<U>(ifSuccess: (Value) -> U, ifFailure: (Error) -> U) -> U
  
  /// Returns the value if self represents a success, `nil` otherwise.
  ///
  /// A default implementation is provided by a protocol extension. Conforming types may specialize it.
  var value: Value? { get }
  
  /// Returns the error if self represents a failure, `nil` otherwise.
  ///
  /// A default implementation is provided by a protocol extension. Conforming types may specialize it.
  var error: Error? { get }
  
}
