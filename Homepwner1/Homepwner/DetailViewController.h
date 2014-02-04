#import <UIKit/UIKit.h>

@class BNRItem;

@interface DetailViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate,
UITextFieldDelegate, UIPopoverControllerDelegate>
{
    __weak IBOutlet UITextField *nameField;
    __weak IBOutlet UITextField *serialNumberField;
    __weak IBOutlet UITextField *valueField;
    __weak IBOutlet UILabel *dateLabel;
    __weak IBOutlet UIImageView *imageView;
    
    UIPopoverController *imagePickerPopover;
}

-(id)initForNewItem:(BOOL)isNew;

@property (nonatomic, strong) BNRItem *item;
//New property for a pointer to a block). This says DVC has a property named dismissBlock
//That points to a block. Like a C function, this block returns void and has no arguments
@property (nonatomic, copy) void (^dismissBlock)(void);

- (IBAction)takePicture:(id)sender;
- (IBAction)backgroundTapped:(id)sender;



@end
