//
//  Product.m
//  analyticspros_ios_code_challenge
//
//  Created by Vincent Lee on 3/14/17.
//  Copyright © 2017 VincentLee. All rights reserved.
//

#import "Product.h"

@implementation Product

-(instancetype)initWithName:(NSString *)name
                    withSku:(NSString *)sku
                  withPrice:(NSString *)price
                  withBrand:(NSString *)brand
               withCategory:(NSString *)category
                withVariant:(NSString *)variant {
    if (self = [super init]) {
        self.name = name;
        self.sku = sku;
        self.price = price;
        self.brand = brand;
        self.category = category;
        self.variant = variant;
    }
    return self;
}

@end
