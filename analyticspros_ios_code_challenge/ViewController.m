//
//  ViewController.m
//  analyticspros_ios_code_challenge
//
//  Created by Vincent Lee on 3/14/17.
//  Copyright © 2017 VincentLee. All rights reserved.
//

#import "ViewController.h"
#import "Product.h"
#import "GTManager.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *favoriteColorTextField;
@property (weak, nonatomic) IBOutlet UIButton *submitColorButton;
@property (weak, nonatomic) IBOutlet UIImageView *appleImageView;
@property (weak, nonatomic) IBOutlet UIButton *buyAppleButton;
@property (strong, nonatomic) Product *product;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.product = [[Product alloc] initWithName:@"apple"
                                           withSku:@"apple123"
                                         withPrice:@"5.99"
                                         withBrand:@"analytics_pros"
                                      withCategory:@"fruit"
                                       withVariant:@"honeycrisp"];
    [[GTManager sharedInstance] trackProductImpression:self.product withList:@"Front Page" andPosition:1];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [[GTManager sharedInstance] pushOpenWithScreen:@"detail_screen"];
}

- (IBAction)submitColorButtonPressed:(id)sender {
    NSString *favoriteColor = [NSString stringWithFormat:@"%@", _favoriteColorTextField.text];
    if (favoriteColor && ![favoriteColor isEqual:[NSNull null]]) {
        [[GTManager sharedInstance] trackColorEvent:favoriteColor];
    }
}

- (IBAction)buyAppleButtonPressed:(id)sender {
    [[GTManager sharedInstance] trackPurchase:self.product withQuantity:1];
}

@end
