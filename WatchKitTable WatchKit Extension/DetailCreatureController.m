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
        
        NSString * namePassed = (NSString *)context;
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
