//
//  CreaturesTableRowController.h
//  WatchKitTable
//
//  Created by New on 11/26/14.
//
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface CreaturesTableRowController : NSObject

@property (weak, nonatomic) IBOutlet WKInterfaceImage *rowIcon;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *rowLabel;

@end
