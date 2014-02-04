//
//  HomepwnerItemCell.m
//  Homepwner1
//
//  Created by Michael Nwani on 2/9/13.
//
//

#import "HomepwnerItemCell.h"

@implementation HomepwnerItemCell
@synthesize controller, tableView;

- (IBAction)showImage:(id)sender {
    
    //Get this name of THIS method, "showImage:"
    NSString *selector = NSStringFromSelector(_cmd);
    
    //selector is now "showImage:atIndexPath:"
    selector = [selector stringByAppendingString:@"atIndexPath"];
    
    //Prepare a selector from this string
    SEL newSelector = NSSelectorFromString(selector);
    
    NSIndexPath *indexPath = [[self tableView] indexPathForCell:self];
    
    //Checking to see if the controller implements showImage:atIndexPath:
    if (indexPath)
    {
        if ([[self controller] respondsToSelector:newSelector])
        {
            //Ignore warning for this line - may or may not appear, does not matter.
            [[self controller] performSelector:newSelector withObject:sender withObject:indexPath];
        }
    }
    
    
    
    /*[[self controller] showImage:sender
                     atIndexPath:indexPath];*/
    
}

@end
