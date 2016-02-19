//
//  ViewController.m
//  ApplePayDemo
//
//  Created by Teddy Lin on 2/19/16.
//  Copyright © 2016 Zhimei Inc. All rights reserved.
//

#import "ViewController.h"
#import <PassKit/PassKit.h>

@interface ViewController () <PKPaymentAuthorizationViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)pay:(id)sender {
    
    if([PKPaymentAuthorizationViewController canMakePayments]) {
        NSLog(@"PKPayment can make payments");
    }
    
    PKPaymentRequest *payment = [[PKPaymentRequest alloc] init];
    
    PKPaymentSummaryItem *total = [PKPaymentSummaryItem summaryItemWithLabel:@"Total" amount:[NSDecimalNumber decimalNumberWithString:@"1.99"]];
    
    payment.paymentSummaryItems = @[total];
    payment.merchantIdentifier = @"";
    payment.currencyCode = @"CNY";
    payment.countryCode = @"CN";
    payment.merchantIdentifier = @"merchant.com.zhimei360.applepaydemo";
    payment.merchantCapabilities = PKMerchantCapabilityCredit;
    payment.supportedNetworks = @[PKPaymentNetworkChinaUnionPay];
    
    NSLog(@"payment: %@", payment);
    
    PKPaymentAuthorizationViewController *vc = [[PKPaymentAuthorizationViewController alloc] initWithPaymentRequest:payment];
    vc.delegate = self;

    [self presentViewController:vc animated:YES completion:NULL];
    
}

#pragma mark - Payment delegate

- (void)paymentAuthorizationViewController:(PKPaymentAuthorizationViewController *)controller didAuthorizePayment:(PKPayment *)payment completion:(void (^)(PKPaymentAuthorizationStatus))completion {
    NSLog(@"did authorize payment");
}

- (void)paymentAuthorizationViewControllerDidFinish:(PKPaymentAuthorizationViewController *)controller {
    NSLog(@"finish");
    [self dismissViewControllerAnimated:controller completion:NULL];
}

@end
