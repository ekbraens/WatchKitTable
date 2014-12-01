//
//  DetailCreatureController.m
//  WatchKitTable
//
//  Created by New on 11/28/14.
//
//

#import "DetailCreatureController.h"

@implementation DetailCreatureController

- (instancetype)initWithContext:(id)context {
    self = [super initWithContext:context];
    if (self){
        // Initialize variables here.
        // Configure interface objects here.
        
        // context passes along certain data from the previous table
        // put that information into a string
        NSString * namePassed = (NSString *)context;
        
        // give it to label and have the string find the image again
        [self.detailLabel setText:namePassed];
        [self.detailImage setImage:[UIImage imageNamed:namePassed]];
        
        NSLog(@"%@ initWithContext", self);
        
    }
    return self;
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    NSLog(@"%@ will activate", self);
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    NSLog(@"%@ did deactivate", self);
}

@end
