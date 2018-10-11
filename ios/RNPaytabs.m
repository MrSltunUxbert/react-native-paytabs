#import "RNPaytabs.h"
#import <React/RCTLog.h>
#import <UIKit/UIKit.h>
#import <paytabs-iOS/paytabs_iOS.h>

@implementation RNPaytabs

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}
RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(log:(NSString *)name )
{
    RCTLogInfo(@"Paytabs React Native: %@", name);
}

RCT_EXPORT_METHOD(start:(NSDictionary *)paymentDetails withCallBack:(RCTResponseSenderBlock) callback)
{

    NSBundle *bundle = [NSBundle bundleWithURL:[[NSBundle mainBundle] URLForResource:@"Resources" withExtension:@"bundle"]];
    UIViewController *rootViewController = [[[[UIApplication sharedApplication]delegate] window] rootViewController];

    PTFWInitialSetupViewController *view = [[PTFWInitialSetupViewController alloc] initWithNibName:@"PTFWInitialSetupView" bundle:bundle andWithViewFrame:rootViewController.view.frame andWithAmount:1.0 andWithCustomerTitle:[paymentDetails valueForKey:@"pt_transaction_title"] andWithCurrencyCode:[paymentDetails valueForKey:@"pt_currency_code"] andWithTaxAmount:0.0 andWithSDKLanguage:@"en" andWithShippingAddress:[paymentDetails valueForKey:@"pt_address_shipping"] andWithShippingCity:[paymentDetails valueForKey:@"pt_city_shipping"] andWithShippingCountry:[paymentDetails valueForKey:@"pt_country_shipping"] andWithShippingState:[paymentDetails valueForKey:@"pt_state_shipping"] andWithShippingZIPCode:[paymentDetails valueForKey:@"pt_postal_code_shipping"] andWithBillingAddress:[paymentDetails valueForKey:@"pt_address_billing"] andWithBillingCity:[paymentDetails valueForKey:@"pt_city_billing"] andWithBillingCountry:[paymentDetails valueForKey:@"pt_country_billing"]  andWithBillingState:[paymentDetails valueForKey:@"pt_state_billing"] andWithBillingZIPCode:[paymentDetails valueForKey:@"pt_postal_code_billing"] andWithOrderID:[paymentDetails valueForKey:@"pt_order_id"] andWithPhoneNumber:[paymentDetails valueForKey:@"pt_customer_phone_number"] andWithCustomerEmail:[paymentDetails valueForKey:@"pt_customer_email"] andIsTokenization:NO andWithMerchantEmail:[paymentDetails valueForKey:@"pt_merchant_email"] andWithMerchantSecretKey:[paymentDetails valueForKey:@"pt_secret_key"] andWithAssigneeCode:@"SDK" andWithThemeColor:[UIColor redColor] andIsThemeColorLight:NO];

     view.didReceiveBackButtonCallback = ^{
         UIViewController *rootViewController = [[[[UIApplication sharedApplication]delegate] window] rootViewController];
         [rootViewController dismissViewControllerAnimated:YES completion:nil];
     };

     view.didReceiveFinishTransactionCallback = ^(int responseCode, NSString * _Nonnull result, int transactionID, NSString * _Nonnull tokenizedCustomerEmail, NSString * _Nonnull tokenizedCustomerPassword, NSString * _Nonnull token, BOOL transactionState) {
         callback(@[@{
                        @"pt_response_code":[NSString stringWithFormat:@"%i", responseCode],
                        @"pt_transaction_id":[NSString stringWithFormat:@"%i", transactionID],
                        @"pt_token_customer_email":tokenizedCustomerEmail,
                        @"pt_token_customer_password":tokenizedCustomerPassword,
                        @"pt_token":token
                        }]);
     };

     [rootViewController presentViewController:view animated:true completion:nil];
}

@end
