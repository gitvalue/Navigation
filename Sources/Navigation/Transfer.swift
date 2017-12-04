//
//  Transfer.swift
//  Navigation
//
//  Created by Dmitry Volosach on 30.11.2017
//  Copyright © 2017 Dmitry Volosach. All rights reserved.
//
//  Permission to use, copy, modify, and/or distribute this software for any
//  purpose with or without fee is hereby granted, provided that the above
//  copyright notice and this permission notice appear in all copies.
//
//  THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
//  WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
//  MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
//  SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
//  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
//  ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR
//  IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
//

import UIKit

/**
 'State' is a particualar app screen, e.g. login screen
 */
public typealias State = UIViewController.Type

/**
 'Stage' is a 'State' instance, i.e. controller object
 */
public typealias Stage = UIViewController

/**
 Represents a navigation state machine transfer from one state (screen) to another
 
 - author: gitvalue
 */
public class Transfer: Hashable {
    /**
     Configurator is a closure that creates a stage in a proper way.
     */
    public typealias Configurator = (Input) -> (Stage)
    
    /**
     Holds a coupled information about input, source state and a destination state
     in an integer value
     */
    private var hash: Int!
    
    /**
     Creates destination stage
     */
    var configurator: Configurator!
    
    public var hashValue: Int {
        return hash
    }
    
    /**
     Default initializer
     
     - parameters:
        - input: input that triggers transfer
        - source: source state
        - destination: destination state
     */
    public init(_ input: Input, _ source: State, _ destination: State) {
        hash = input.hashValue ^ source.hash()
        configurator = { _ in return destination.init() }
    }
    
    /**
     Designated initializer
     
     - parameters:
        - input: input that tringgers transfer
        - source: source state
        - destination: destination state
        - configurator: destination stage configurator
     */
    public convenience init(_ input: Input, _ source: State, _ destination: State, _ configurator: @escaping Configurator) {
        self.init(input, source, destination)
        
        self.configurator = configurator
    }
    
    /**
     Triggers navigation
     
     - parameters:
        - source: stage that triggers navigation
        - input: input that led to triggering this transfer
     */
    func trigger(from source: Stage, with input: Input) {
        fatalError("trigger(source:input:) should be implemented")
    }
    
    public static func ==(lhs: Transfer, rhs: Transfer) -> Bool {
        return lhs.hash == rhs.hash
    }
}

