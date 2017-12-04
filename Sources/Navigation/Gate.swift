//
//  Gate.swift
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

import Foundation

/**
 Defines a protocol that represents a gate (app screens group).
 You can think about gate as a router between local networks.
 
 - author: gitvalue
 */
public protocol Gate {
    /**
     Transfer table contained records that define navigation transfers
     depending on input and source state
     */
    var transferTable: [Transfer] { get set }
    
    /**
     Current stage (active view controller)
     */
    var currentStage: Stage { get set }
    
    /**
     Triggers navigation state machine
     
     - parameters:
        - input: state input
     */
    func trigger(with input: Input)
}

/**
 Default implementation for Gate
 */
public extension Gate {
    func trigger(with input: Input) {
        let transfer = transferTable.first { t -> Bool in
            return t == Transfer(input, type(of: currentStage), Stage.self)
        }
        
        transfer?.trigger(from: currentStage, with: input)
    }
}

