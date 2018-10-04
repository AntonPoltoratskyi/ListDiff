//
//  Diffable.swift
//  ListDiff
//
//  Created by Anton Poltoratskyi on 04.10.2018.
//  Copyright © 2018 ListDiff. All rights reserved.
//

public protocol Diffable {
    var diffIdentifier: AnyHashable { get }
}
