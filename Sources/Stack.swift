//
//  Stack.swift
//  ListDiff
//
//  Created by Anton Poltoratskyi on 04.10.2018.
//  Copyright © 2018 ListDiff. All rights reserved.
//

struct Stack<Element> {
    private(set) var items = [Element]()
    
    var isEmpty: Bool {
        return items.isEmpty
    }
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}
