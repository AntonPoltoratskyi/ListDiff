//
//  ObjCExceptionCatcherHelper.h
//  ListDiffStressTests
//
//  Created by Anton Poltoratskyi on 04.10.2018.
//  Copyright © 2018 ListDiff. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ObjCExceptionCatcherHelper: NSObject

+ (void)try:(nonnull NS_NOESCAPE void(^)(void))tryBlock
        catch:(nonnull void(^)(NSException * _Nonnull))catchBlock
        finally:(nonnull void(^)(void))finallyBlock;

@end
