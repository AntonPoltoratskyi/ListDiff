//
//  CellDataGeneratorResult.swift
//  ListDiffStressTests
//
//  Created by Anton Poltoratskyi on 04.10.2018.
//  Copyright © 2018 ListDiffStressTests. All rights reserved.
//

struct CellDataGeneratorResult {
    let deletes: Int
    let inserts: Int
    let moves: Int
    let updates: Int
    let from: [CellData]
    let to: [CellData]
}
