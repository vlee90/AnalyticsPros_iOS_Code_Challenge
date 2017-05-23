//
//  GTManager.h
//  analyticspros_ios_code_challenge
//
//  Created by Gabriel Morales on 5/22/17.
//  Copyright © 2017 VincentLee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"
@class TAGManager;
@class TAGContainer;

static NSString *const kAllowTracking = @"allowTracking";
static NSString *const kContainerId = @"GTM-5W8QQ63";

@interface GTManager : NSObject

+ (GTManager *)sharedInstance;

@property (nonatomic, retain) TAGManager *manager;
@property (nonatomic, retain) TAGContainer *container;

- (void)refreshContainer;
- (void)pushOpenWithScreen:(NSString *)screen;
- (void)trackColorEvent:(NSString *)color fromSender:(NSString *)sender;
- (void)trackPurchase:(Product *)product withQuantity:(NSUInteger)quantity;
- (void)trackProductImpression:(Product *)product withList:(NSString *)list andPosition:(NSUInteger)position;

@end
