//
//  ImageViewController.h
//  Homepwner1
//
//  Created by Michael Nwani on 2/10/13.
//
//

#import <UIKit/UIKit.h>

@interface ImageViewController : UIViewController
{
    
    __weak IBOutlet UIScrollView *scrollView;
    __weak IBOutlet UIImageView *imageView;
}
@property (nonatomic, strong) UIImage *image;
@end
