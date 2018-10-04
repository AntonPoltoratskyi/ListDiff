//
//  ObjCExceptionCatcherHelper.m
//  ListDiffStressTests
//
//  Created by Anton Poltoratskyi on 04.10.2018.
//  Copyright © 2018 ListDiff. All rights reserved.
//

#import "ObjCExceptionCatcherHelper.h"

@implementation ObjCExceptionCatcherHelper

+ (void)try:(nonnull NS_NOESCAPE void(^)(void))tryBlock
      catch:(nonnull void(^)(NSException * _Nonnull))catchBlock
    finally:(nonnull void(^)(void))finallyBlock
{
    @try {
        tryBlock();
    }
    @catch (NSException *exception) {
        catchBlock(exception);
    }
    @finally {
        finallyBlock();
    }
}

@end
