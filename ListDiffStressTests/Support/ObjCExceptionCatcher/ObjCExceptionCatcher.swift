//
//  ObjCExceptionCatcher.swift
//  ListDiffStressTests
//
//  Created by Anton Poltoratskyi on 04.10.2018.
//  Copyright © 2018 ListDiff. All rights reserved.
//

import Foundation

public final class ObjCExceptionCatcher {
    
    public static func tryClosure(
        tryClosure: () -> (),
        catchClosure: @escaping (NSException) -> (),
        finallyClosure: @escaping () -> () = {})
    {
        ObjCExceptionCatcherHelper.`try`(tryClosure, catch: catchClosure, finally: finallyClosure)
    }
}
