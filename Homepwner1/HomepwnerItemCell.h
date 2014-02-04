//
//  HomepwnerItemCell.h
//  Homepwner1
//
//  Created by Michael Nwani on 2/9/13.
//
//

#import <Foundation/Foundation.h>

@interface HomepwnerItemCell : UITableViewCell
{
    
}
@property (weak, nonatomic) IBOutlet UIImageView *thumbnailView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *serialNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *valueLabel;
- (IBAction)showImage:(id)sender;
@property (weak, nonatomic) id controller;
@property (weak, nonatomic) UITableView *tableView;
@end
