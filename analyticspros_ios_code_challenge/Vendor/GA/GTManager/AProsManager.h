//
//  GTManager.h
//  analyticspros_ios_code_challenge
//
//  Created by Gabriel Morales on 5/22/17.
//  Copyright © 2017 VincentLee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"
@import GoogleTagManager;
@import Firebase;

@interface AProsManager : NSObject

+ (AProsManager *)bootstrap;
+ (void)trackScreenWithName:(NSString *)name;
+ (void)trackCurrentScreenEvent:(NSString *)screen;
+ (void)logColorEvent:(NSString *)color fromSender:(Class)sender;

@end
