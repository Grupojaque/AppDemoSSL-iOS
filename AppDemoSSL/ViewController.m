//
//  ViewController.m
//  AppDemoSSL
//
//  Created by Orlando Rey Sánchez on 07/06/16.
//  Copyright © 2016 Grupo Jaque. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

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

- (IBAction)clickOnSendButton:(id)sender {
    NSLog(@"Botón clickeado");
    
    API *api = [API sharedInstance];
    
//    NSLog(@"API: %@", api);
    [api sendSecret:_inputText.text withCompletionBlock:^(NSError * _Nullable error, NSDictionary * _Nullable response) {
        NSLog(@"HAciendo petición");
        
//        NSLog(@"Error: %@. Response: %@", error, response);
//        _responseText.text = [NSString stringWithFormat:@"Error: %@ \nRespuesta: %@", error, response];
        [_responseText setText:[NSString stringWithFormat:@"Error: %@ \nRespuesta: %@", error, response]];
    }];
}

@end
