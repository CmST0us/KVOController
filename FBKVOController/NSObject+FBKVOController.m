/**
 Copyright (c) 2014-present, Facebook, Inc.
 All rights reserved.
 
 This source code is licensed under the BSD-style license found in the
 LICENSE file in the root directory of this source tree. An additional grant
 of patent rights can be found in the PATENTS file in the same directory.
 */

#import "NSObject+FBKVOController.h"

#import <objc/message.h>

#if !__has_feature(objc_arc)
#error This file must be compiled with ARC. Convert your project to ARC or specify the -fobjc-arc flag.
#endif

#pragma mark NSObject Category -

NS_ASSUME_NONNULL_BEGIN

static void *NSObjectKVOControllerKey = &NSObjectKVOControllerKey;

@implementation NSObject (FBKVOController)

- (FBKVOController *)KVOController
{
  id controller = objc_getAssociatedObject(self, NSObjectKVOControllerKey);
  // lazily create the KVOController
  if (nil == controller) {
    controller = [FBKVOController controllerWithObserver:self];
  }
  return controller;
}

- (void)addKVOObserver:(NSObject *)observer
            forKeyPath:(NSString *)aKeyPath
                 block:(FBKVOControllerChangeBlock)block {
    FBKVOController *controller = [self KVOController];
}

- (void)addKVOObserver:(NSObject *)observer
            forKeyPath:(NSString *)aKeyPath
                action:(SEL)aSelector {
  
}

- (void)addKVOObserver:(NSObject *)observer
           forKeyPaths:(NSArray<NSString *> *)keyPaths
                 block:(FBKVOControllerChangeBlock)block {
  
}

- (void)addKVOObserver:(NSObject *)observer
           forKeyPaths:(NSArray<NSString *> *)keyPaths
                action:(SEL)aSelector {
  
}

@end


NS_ASSUME_NONNULL_END
