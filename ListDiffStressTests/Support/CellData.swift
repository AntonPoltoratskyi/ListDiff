//
//  CellData.swift
//  ListDiffStressTests
//
//  Created by Anton Poltoratskyi on 04.10.2018.
//  Copyright © 2018 ListDiffStressTests. All rights reserved.
//

import ListDiff
import XCTest

final class CellData: Equatable, Diffable {
    // MARK: - Properties
    let title: String
    let subtitle: String
    
    // MARK: - Diffable
    let diffIdentifier: AnyHashable
    
    // MARK: - Init
    init(
        diffIdentifier: AnyHashable,
        title: String,
        subtitle: String)
    {
        self.title = title
        self.subtitle = subtitle
        self.diffIdentifier = diffIdentifier
    }
    
    // MARK: - Equatable
    static func == (lhs: CellData, rhs: CellData) -> Bool {
        XCTAssert(
            lhs.diffIdentifier == rhs.diffIdentifier,
            "We expect the algorythm to compare items only with same `diffIdentifier`"
        )
        
        return lhs.title == rhs.title
            && lhs.subtitle == rhs.subtitle
    }
}
