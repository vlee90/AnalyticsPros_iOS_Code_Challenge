//
//  Product.h
//  analyticspros_ios_code_challenge
//
//  Created by Vincent Lee on 3/14/17.
//  Copyright © 2017 VincentLee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *sku;
@property (strong, nonatomic) NSString *price;
@property (strong, nonatomic) NSString *brand;
@property (strong, nonatomic) NSString *category;
@property (strong, nonatomic) NSString *variant;

-(instancetype)initWithName:(NSString *)name
                    withSku:(NSString *)sku
                  withPrice:(NSString *)price
                  withBrand:(NSString *)brand
               withCategory:(NSString *)category
                withVariant:(NSString *)variant;

@end
