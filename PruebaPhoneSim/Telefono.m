//
//  Telefono.m
//  PruebaPhoneSim
//
//  Created by victor Franco on 17/08/15.
//  Copyright (c) 2015 grisostomos. All rights reserved.
//

#import "Telefono.h"

@interface Telefono ()
@property (weak, nonatomic) IBOutlet UILabel *telefonoText;
@property (weak, nonatomic) IBOutlet UILabel *simText;
@property (weak, nonatomic) IBOutlet UILabel *countryText;
@property (weak, nonatomic) IBOutlet UILabel *networkText;
@property (weak, nonatomic) IBOutlet UILabel *lenguajeText;

@end

@implementation Telefono

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CTTelephonyNetworkInfo * networkInfo = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier * carrier = [networkInfo subscriberCellularProvider];
    
    // Get carrier name
    NSString * carrierName = [carrier carrierName];
    //Get networkCode
    NSString * carrierPhone = [ carrier mobileNetworkCode];
  
    
    if([carrierPhone length] != 0 || [carrierPhone isEqualToString:@"334020"]){
        _simText.text=carrierPhone;
    }else{
        _simText.text=@"Dont have";
        
    }
    
    if (carrierName != nil){
        NSLog(@"Carrier: %@", carrierName);
         _telefonoText.text=carrierName;
    }else{
         _telefonoText.text=@"Dont have";
    }
    // Get mobile country code
    NSString * mcc = [carrier mobileCountryCode];
    if (mcc != nil){
        _countryText.text= mcc;
        NSLog(@"Mobile Country Code (MCC): %@", mcc);
    }else{
        _countryText.text=@"Dont have";
        
    }
    
    
    // Get mobile network code
    NSString * mnc = [carrier mobileNetworkCode];
    if (mnc != nil){
        NSLog(@"Mobile Network Code (MNC): %@", mnc);
        _networkText.text=mnc;
    }else{
        _networkText.text=@"Dont have";
    }
    
    NSString *language = [[NSLocale preferredLanguages] objectAtIndex:0];
    
    if ( [language length]!=0 ){
        _lenguajeText.text=language;
    }else{
        _lenguajeText.text=@"Dont have";
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
    
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
