//
//  GTManager.m
//  analyticspros_ios_code_challenge
//
//  Created by Gabriel Morales on 5/22/17.
//  Copyright © 2017 VincentLee. All rights reserved.
//

#import "GTManager.h"
#import "AppDelegate.h"
#import "TAGManager.h"
#import "TAGLogger.h"
#import "TAGContainer.h"
#import "TAGContainerOpener.h"
#import "TAGDataLayer.h"
#import "AppDelegate.h"

@interface GTManager() <TAGContainerOpenerNotifier>

@end

@implementation GTManager

- (instancetype)init {
    if (self = [super init]) {
        _manager = [TAGManager instance];
        [_manager.logger setLogLevel:kTAGLoggerLogLevelVerbose];
        
        [TAGContainerOpener openContainerWithId:kContainerId
                                     tagManager:_manager
                                       openType:kTAGOpenTypePreferFresh
                                        timeout:nil
                                       notifier:self];
    }
    return self;
}

- (void)containerAvailable:(TAGContainer *)container {
    dispatch_async(dispatch_get_main_queue(), ^{
        self.container = container;
    });
}

+ (GTManager *)sharedInstance {
    static GTManager *instance = nil;
    if (!instance) {
        instance = [[GTManager alloc] init];
    }
    return instance;
}

- (void)refreshContainer {
    [self.container refresh];
}

- (void)pushOpenWithScreen:(NSString *)screen {
    [_manager.dataLayer push:@{@"event": @"openScreen",
                               @"screenName" : screen}];
}

- (void)trackColorEvent:(NSString *)color fromSender:(NSString *)sender {
    [_manager.dataLayer push:@{@"event" : @"favorite_color",
                               @"favorite_color" : color,
                               @"screenName": sender}];
}

- (void)trackPurchase:(Product *)product withQuantity:(NSUInteger)quantity {
    NSDictionary *purchaseDict = @{
                                   @"event" : @"transaction",
                                   @"transactionId" : [NSString stringWithFormat:@"T%@", product.sku],
                                   @"transactionTotal" : product.price,
                                   @"transactionCurrency" : @"USD",
                                   @"transactionProducts" : @[
                                          @{@"name" : product.name,
                                            @"id" : product.sku,
                                            @"price" : product.price,
                                            @"brand" : product.brand,
                                            @"category" : product.category,
                                            @"variant" : product.variant,
                                            @"quantity" : @(quantity)}
                                          ]};
    
    [_manager.dataLayer push:purchaseDict];
}

- (void)trackProductImpression:(Product *)product withList:(NSString *)list andPosition:(NSUInteger)position {
    NSDictionary *impressionDict = @{
                                     @"ecommerce" : @{
                                         @"currencyCode" : @"USD",
                                         @"impressions" : @[
                                                 @{@"name" : product.name,
                                                   @"id" : product.sku,
                                                   @"price" : product.price,
                                                   @"brand" : product.brand,
                                                   @"category" : product.category,
                                                   @"variant" : product.variant,
                                                   @"list" : list,
                                                   @"position" : @(position)}
                                                 ]}};
    [_manager.dataLayer push:impressionDict];
}

@end
