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

@property (nonatomic, weak) IBOutlet WKInterfaceTable * table;
//unnessasray? 
//@property (nonatomic, strong) NSArray * creatureList;
@property (nonatomic, strong) CreaturesTableRowController * theRow;
@property (nonatomic, strong) NSArray *creatureList;

@end


@implementation InterfaceController

- (instancetype)initWithContext:(id)context {
    self = [super initWithContext:context];
    if (self){
        // Initialize variables here.
        // Configure interface objects here.
        // Okay
        self.creatureList = [[NSArray alloc] initWithObjects:@"Bob", @"Dave", @"Jerry", @"Jorge", @"Kevin", @"Mark", @"Phil", @"Stuart", @"Tim", nil];
        
        [self configureTableWithData:_creatureList];
        
        NSLog(@"%@ initWithContext", self);
        
    }
    return self;
}

- (void)configureTableWithData:(NSArray*)dataObjects
{
    [self.table setNumberOfRows:[dataObjects count] withRowType:@"CreaturesTableRowController"];
    //NSInteger numofRows = self.table.numberOfRows;
    for (NSInteger i = 0; i < self.table.numberOfRows; i++)
    {
        CreaturesTableRowController * theRow = [self.table rowControllerAtIndex:i];
        
        // unnessasary?
        //[dataObjects objectAtIndex:i];
        
        [theRow.rowLabel setText:dataObjects[i]];
        [theRow.rowIcon setImage:[UIImage imageNamed:dataObjects[i]]];
    }
}

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



