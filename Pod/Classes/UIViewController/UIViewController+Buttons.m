//
//  UINavigationController+Buttons.m
//  Pods
//
//  Created by Jamie Evans on 2015-03-17.
//  Copyright (c) 2015 Jamie Riley Evans. All rights reserved.
//

#import "UIViewController+Buttons.h"

@implementation UIViewController (Buttons)

- (void)setNavigationButtons:(NavigationButtonType)types
{
    // Left
    if(types & NavigationButtonTypeClose)
    {
        [self.navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"X"] style:UIBarButtonItemStylePlain target:self action:@selector(dismissViewController)]];
    }
    else if(types & NavigationButtonTypeClose)
    {
        [self.navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(dismissViewController)]];
    }
    else
    {
        [self.navigationItem setLeftBarButtonItem:nil];
    }
    // Right
    if(types & NavigationButtonTypeMenu)
    {
        [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Menu-Button.png"] style:UIBarButtonItemStylePlain target:self action:@selector(openNavigationMenu)]];
    }
    else if(types & NavigationButtonTypeSave)
    {
        [self.navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(save)]];
    }
    else if(types & NavigationButtonTypeReset)
    {
        [self.navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"Reset" style:UIBarButtonItemStylePlain target:self action:@selector(reset)]];
    }
    else
    {
        [self.navigationItem setRightBarButtonItem:nil];
    }
    
    // Special
    if(types & NavigationButtonTypeNoBack)
    {
        [self.navigationItem setHidesBackButton:YES];
    }
    else if(self.navigationItem.hidesBackButton)
    {
        [self.navigationItem setHidesBackButton:NO];
    }
}

- (void)dismissViewController
{
    if(self.presentingViewController)
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else if(self.navigationController)
    {
        if(self.navigationController.presentingViewController)
        {
            [self.navigationController dismissViewControllerAnimated:YES completion:nil];
        }
        else [self.navigationController popViewControllerAnimated:YES];
    }
}

@end
