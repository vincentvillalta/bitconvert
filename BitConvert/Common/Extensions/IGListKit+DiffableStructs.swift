//
//  IGListKit+DiffableStructs.swift
//  BitConvert
//
//  Created by Vincent Villalta on 1/8/19.
//  Copyright © 2019 Vincent Villalta. All rights reserved.
//

import UIKit
import IGListKit

public protocol Diffable: Equatable {
    
    /// Returns a key that uniquely identifies the object.
    ///
    /// - returns: A key that can be used to uniquely identify the object.
    ///
    /// - note: Two objects may share the same identifier, but are not equal.
    ///
    /// - warning: This value should never be mutated.
    var diffIdentifier: String { get }
}
