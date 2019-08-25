/**
  Copyright (c) 2014-present, Facebook, Inc.
  All rights reserved.

  This source code is licensed under the BSD-style license found in the
  LICENSE file in the root directory of this source tree. An additional grant
  of patent rights can be found in the PATENTS file in the same directory.
 */

#import <Foundation/Foundation.h>

#import "FBKVOController.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^FBKVOControllerChangeBlock)(id _Nullable oldValue, id _Nullable newValue);

/**
 Category that adds built-in `KVOController` and `KVOControllerNonRetaining` on any instance of `NSObject`.

 This makes it convenient to simply create and forget a `FBKVOController`, 
 and when this object gets dealloc'd, so will the associated controller and the observation info.
 */
@interface NSObject (FBKVOController)

- (void)addKVOObserver:(NSObject *)observer
            forKeyPath:(NSString *)aKeyPath
                 block:(FBKVOControllerChangeBlock)block;

- (void)addKVOObserver:(NSObject *)observer
            forKeyPath:(NSString *)aKeyPath
                action:(SEL)aSelector;

- (void)addKVOObserver:(NSObject *)observer
           forKeyPaths:(NSArray<NSString *> *)keyPaths
                 block:(FBKVOControllerChangeBlock)block;

- (void)addKVOObserver:(NSObject *)observer
           forKeyPaths:(NSArray<NSString *> *)keyPaths
                action:(SEL)aSelector;

- (void)removeKVOObserver:(NSObject *)observer;

- (void)removeKVOObserver:(NSObject *)observer
               forKeyPath:(NSString *)aKeyPath;

@end

NS_ASSUME_NONNULL_END
