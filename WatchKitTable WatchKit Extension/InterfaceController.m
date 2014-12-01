//
//  InterfaceController.m
//  WatchKitTable WatchKit Extension
//
//  Created by New on 11/26/14.
//
//

#import "InterfaceController.h"
#import "CreaturesTableRowController.h"
#import "DetailCreatureController.h"

@interface InterfaceController()

// table connected from sotryboard, dont forget
@property (nonatomic, weak) IBOutlet WKInterfaceTable * table;

// custom row controller class
@property (nonatomic, strong) CreaturesTableRowController * theRow;

//  think it is nessasary to have this array as a private variable to use
// in multiple functions within this class
@property (nonatomic, strong) NSArray *creatureList;

@end


@implementation InterfaceController

- (instancetype)initWithContext:(id)context {
    self = [super initWithContext:context];
    if (self){
        // Initialize variables here.
        // Configure interface objects here.
        NSLog(@"%@ initWithContext", self);
        
        // initilze the array once, use it multiple times in configureTable
        // wouldnt want to initialize it there each time
        self.creatureList = [[NSArray alloc] initWithObjects:@"Bob", @"Dave", @"Jerry", @"Jorge", @"Kevin", @"Mark", @"Phil", @"Stuart", @"Tim", nil];
        
        // pass in the array to populate the table
        [self configureTableWithData:_creatureList];
        
    }
    return self;
}

// from watchkit programming guide, modified slightly
- (void)configureTableWithData:(NSArray*)dataObjects
{
    // row type specified in storyboard, dont forget
    [self.table setNumberOfRows:[dataObjects count] withRowType:@"CreaturesTableRowController"];
    
    for (NSInteger i = 0; i < self.table.numberOfRows; i++)
    {
        // custom class, imported and used as row controller
        CreaturesTableRowController * theRow = [self.table rowControllerAtIndex:i];
        
        [theRow.rowLabel setText:dataObjects[i]];
        [theRow.rowIcon setImage:[UIImage imageNamed:dataObjects[i]]];
    }
}

// this is the function that is used when a row is pressed for watchkit when done through storyboard
// set up segueIdentifier in sotryboard
// table should already be set up in this class
// rowIndex is the row pressed at time of event
// set up an interface controller to land on
- (instancetype) contextForSegueWithIdentifier:(NSString *)segueIdentifier inTable:(WKInterfaceTable *)table rowIndex:(NSInteger)rowIndex
{
    
    return [self.creatureList objectAtIndex:rowIndex];
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



