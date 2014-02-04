//
//  DetailViewController.m
//  Homepwner
//
//  Created by joeconway on 9/1/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"
#import "BNRItem.h"
#import "BNRImageStore.h"
#import "BNRItemStore.h"

@implementation DetailViewController
@synthesize item, dismissBlock;

-(id)initForNewItem:(BOOL)isNew
{
    //If the DVC is being used to create a new BNRItem, we want it to show a "Done" button
    //and a "Cancel" button on its navigation item.
    
    self = [super initWithNibName:@"DetailViewController" bundle:nil];
    
    if (self)
    {
        if (isNew)
        {
            //"Done" Button
            UIBarButtonItem *doneItem = [[UIBarButtonItem alloc]
                                         initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(save:)];
            [[self navigationItem] setRightBarButtonItem:doneItem];
            
            //"Cancel" Button
            UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc]
                                           initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel:)];
            [[self navigationItem] setLeftBarButtonItem:cancelItem];
            
            
        }
    }
    
    return self;
}

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    //Overriding UIViewController's designated initializer
    //Halts the application and shows the exception in the console.
    @throw [NSException exceptionWithName:@"Wrong Initializer" reason:@"Use initForNewItem:" userInfo:nil];
    
    return nil;
}

- (void)setItem:(BNRItem *)i
{
    item = i;
    [[self navigationItem] setTitle:[item itemName]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIColor *clr = nil;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
    {
        clr = [UIColor colorWithRed:0.357 green:0.902 blue:0.788 alpha:1];
    }
    else
    {
        clr = [UIColor colorWithRed:0.357 green:0.902 blue:0.788 alpha:1];
    }
    
    [[self view] setBackgroundColor:clr];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];

    // Clear first responder
    [[self view] endEditing:YES];

    // "Save" changes to item
    [item setItemName:[nameField text]];
    [item setSerialNumber:[serialNumberField text]];
    [item setValueInDollars:[[valueField text] intValue]];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    [nameField setText:[item itemName]];
    [serialNumberField setText:[item serialNumber]];
    [valueField setText:[NSString stringWithFormat:@"%d", [item valueInDollars]]];

    // Create a NSDateFormatter that will turn a date into a simple date string
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];

    // Use filtered NSDate object to set dateLabel contents
    [dateLabel setText:[dateFormatter stringFromDate:[item dateCreated]]];

    // Change the navigation item to display name of item
    [[self navigationItem] setTitle:[item itemName]];
    
    NSString *imageKey = [item imageKey];
    
    if (imageKey)
    {
        //Get the image for image key from image store
        UIImage *imageToDisplay = [[BNRImageStore sharedStore] imageForKey:imageKey];
        
        //Use that image to put on the screen in image view
        [imageView setImage:imageToDisplay];
    }
    else
    {
        //Clear the image view
        [imageView setImage:nil];
    }
}

- (void)viewDidUnload {
    imageView = nil;
    [super viewDidUnload];
}
- (IBAction)takePicture:(id)sender {
    
    if ([imagePickerPopover isPopoverVisible])
    {
        //If the popover is already up, get rid of it.
        [imagePickerPopover dismissPopoverAnimated:YES];
        imagePickerPopover = nil;
        return;
    }
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    //If our device has a camera, we want to take a picture, otherwise we just pick from a photo library
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
    }
    else
    {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }
    
    //Will generate an warning right now, ignore:
    [imagePicker setDelegate:self];
    
    //Place image picker on the screen (Going to utilize a popover controller for iPad situations I believe
    //Check for iPad device before instantiating the popover controller
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
    {
        //Create a new popover controller that will display the imagePicker
        imagePickerPopover = [[UIPopoverController alloc] initWithContentViewController:imagePicker];
        [imagePickerPopover setDelegate:self];
        
        //Display the popover controller; the sender is the camera button item
        //We've said here it'll be enacted from a button press, which it knows from imagePicker and this method accessory
        [imagePickerPopover presentPopoverFromBarButtonItem:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    }
    else
    {
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
}

- (IBAction)backgroundTapped:(id)sender
{
    [[self view] endEditing:YES];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    NSString *oldKey = [item imageKey];
    
    //Did the item already have an image? (This is only going to be used when creating a new image)
    if (oldKey)
    {
        //Delete the old image
        [[BNRImageStore sharedStore] deleteImageForKey:oldKey];
    }
    
    //Get picked image from info directory
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    //For creating a thumbnail image version when the original gets taken
    [item setThumbnailDataFromImage:image];
    
    //Create a CFUUID object - it knows how to create unique ID strings
    CFUUIDRef newUniqueID = CFUUIDCreate(kCFAllocatorDefault);
    
    //Create a string from inique identifier
    CFStringRef newUniqueIDString = CFUUIDCreateString(kCFAllocatorDefault, newUniqueID);
    
    //Typecasting newUniqueIDString and setting it as the imageKey of the selected BNRItem
    
    //Use that unique ID to set our items imageKey
    NSString *key = (__bridge NSString *)newUniqueIDString;
    [item setImageKey:key];
    
    //Store image in the BNRImageStore with this key
    [[BNRImageStore sharedStore] setImage:image forKey:[item imageKey]];
    
    CFRelease(newUniqueIDString);
    CFRelease(newUniqueID);
    
    //Put that image onto the screen in our image view
    [imageView setImage:image];
    
    //Take image picker off the screen
    //You MUST call this dismiss method
    //Dismiss the popover when an image is selected.
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        // If on the phone, the image picker is presented modally. Dismiss it.
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else
    {
        // If on the pad, the image is in the popover. Dismiss the popover.
        [imagePickerPopover dismissPopoverAnimated:YES];
        imagePickerPopover = nil;
    }
        
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(BOOL)shouldAutorotate
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
    {
        return YES;
    }
    else
    {
        return UIInterfaceOrientationPortrait;
    }
}
-(void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    //For when the popover is dismissed by tapping anywhere else on the screen
    NSLog(@"User dismissed the popover");
    //Destroying the popover controller. It'll be created everytime the camera button's pressed.
    imagePickerPopover = nil;
}
//Save and Cancel weren't auto-filled because (they're bar button itmes) at this point the compiler doesn't know of their existence
//That'll come in at runtime automatically, otherwise I'd get a selector error message.

- (void)save:(id)sender
{
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:dismissBlock];
}

-(void)cancel:(id)sender
{
    //If the user cancelled, then remove the BNRItem from the store.
    [[BNRItemStore defaultStore] removeItem:item];
    
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:dismissBlock];
    
}
@end
