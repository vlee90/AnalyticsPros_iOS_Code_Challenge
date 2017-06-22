//
//  GTManager.m
//  analyticspros_ios_code_challenge
//
//  Created by Gabriel Morales on 5/22/17.
//  Copyright © 2017 VincentLee. All rights reserved.
//

#import "AProsManager.h"

typedef NS_ENUM(NSInteger, APTrackable) {
    APTrackableCampaignName,
    APTrackableCampaignSource,
    APTrackableCampaignMedium,
    APTrackableCampaignTerm,
    APTrackableDetailScreen,
    APTrackableScreenName,
    APTrackableSenderName,
    APTrackableFavoriteColor,
    APTrackableUserID
};

@interface AProsManager() 

@end

@implementation AProsManager

- (instancetype)init {
    if (self = [super init]) {
        [FIRApp configure];
    }
    return self;
}

+ (AProsManager *)bootstrap {
    static AProsManager *instance = nil;
    if (!instance) {
        instance = [[AProsManager alloc] init];
    }
    return instance;
}

+ (void)trackScreenWithName:(NSString *)name {
    [FIRAnalytics setScreenName:[AProsManager trackable:APTrackableDetailScreen] screenClass:name];
}

+ (void)trackCurrentScreenEvent:(NSString *)screen {
    [FIRAnalytics logEventWithName:@"openScreen"
                        parameters:@{[AProsManager trackable:APTrackableScreenName] : screen}];
}

+ (void)logColorEvent:(NSString *)color fromSender:(Class)sender {
    
    [FIRAnalytics logEventWithName:[AProsManager trackable:APTrackableFavoriteColor]
                        parameters:@{[AProsManager trackable:APTrackableFavoriteColor] : color,
                                     [AProsManager trackable:APTrackableSenderName] : NSStringFromClass([sender class])}];
}

#pragma mark - Private
+ (NSString *)trackable:(APTrackable)trackable {
    NSString *result = nil;
    
    switch (trackable) {
            case APTrackableCampaignName:       result = @"campaign_name";      break;
            case APTrackableCampaignSource:     result = @"campaign_source";    break;
            case APTrackableCampaignMedium:     result = @"campaign_medium";    break;
            case APTrackableCampaignTerm:       result = @"campaign_term";      break;
            case APTrackableDetailScreen:       result = @"detail_screen";      break;
            case APTrackableFavoriteColor:      result = @"favorite_color";     break;
            case APTrackableScreenName:         result = @"screenName";         break;
            case APTrackableSenderName:         result = @"sender";             break;
            case APTrackableUserID:             result = @"user_id";            break;
    }
    return result;
}

@end
