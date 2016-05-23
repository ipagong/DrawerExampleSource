//
//  ViewController.m
//  DrawerExample
//
//  Created by suwan on 2016. 5. 23..
//  Copyright © 2016년 suwan. All rights reserved.
//

#import "ViewController.h"

#import "PGDrawerTransition.h"
#import "DrawerViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *openDrawerButton;

@property (nonatomic, strong) PGDrawerTransition *transtion;
@property (nonatomic, strong) DrawerViewController *drawerVc;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
    [self.view addSubview:[self openDrawerButton]];
    
    self.drawerVc  = [[DrawerViewController alloc] init];
    self.transtion = [[PGDrawerTransition alloc] initWithTargetViewController:self drawerViewController:self.drawerVc];
}

- (UIButton *)openDrawerButton
{
    if (_openDrawerButton == nil) {
        _openDrawerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_openDrawerButton setTitle:@"open drawer" forState:UIControlStateNormal];
        [_openDrawerButton addTarget:self action:@selector(onClickOpenButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _openDrawerButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    [_openDrawerButton setFrame:CGRectMake(CGRectGetWidth(self.view.bounds)/3,
                                           CGRectGetHeight(self.view.bounds)/2 - 50,
                                           CGRectGetWidth(self.view.bounds)/3, 100)];
}

- (void)onClickOpenButton:(id)sender
{
    [self.transtion presentDrawerViewController];
}

@end
