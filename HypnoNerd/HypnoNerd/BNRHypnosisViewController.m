//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by Lukas Spieß on 16.03.14.
//  Copyright (c) 2014 Lukas Spieß. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@implementation BNRHypnosisViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        self.tabBarItem.title = @"Hypnotize";
        
        UIImage *i = [UIImage imageNamed:@"Hypno.png"];
        
        self.tabBarItem.image = i;
    }
    return  self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"BNRHypnosisViewController loaded its view.");
}

-(void)loadView {
    //Create a view
    BNRHypnosisView *backgroundView = [[BNRHypnosisView alloc] init];
    
    // Set it as *the* view of this view controller
    self.view = backgroundView;
    
    UISegmentedControl *segCtrl = [[UISegmentedControl alloc] initWithItems:@[@"Red",@"Green",@"Blue"]];
}

@end
