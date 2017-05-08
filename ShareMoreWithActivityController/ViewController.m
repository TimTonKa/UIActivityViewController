//
//  ViewController.m
//  ShareMoreWithActivityController
//
//  Created by 1134 on 2017/4/28.
//  Copyright © 2017年 1134. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)shareBtnPressed:(UIButton *)sender {
    NSString *content = @"找不到你的應用程式想要看更多嗎？";
    NSString *url = @"https://www.google.com";
    NSArray *items = @[content,url];
    
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:items applicationActivities:nil];
    activityVC.modalPresentationStyle = UIModalPresentationPopover;
    [self presentViewController:activityVC animated:true completion:nil];
    
    
    // For iPad: make the presentation a Popover
    UIPopoverPresentationController *popController = [activityVC popoverPresentationController];
    popController.permittedArrowDirections = UIPopoverArrowDirectionAny;
    popController.barButtonItem = self.navigationItem.leftBarButtonItem;
    
    // access the completion handler
    activityVC.completionWithItemsHandler = ^(NSString *activityType,
                                              BOOL completed,
                                              NSArray *returnedItems,
                                              NSError *error){
        // react to the completion
        if (completed) {
            
            // user shared an item
            NSLog(@"We used activity type%@", activityType);
            
        } else {
            
            // user cancelled
            NSLog(@"We didn't want to share anything after all.");
        }
        
        if (error) {
            NSLog(@"An Error occured: %@, %@", error.localizedDescription, error.localizedFailureReason);
        }
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
