//
//  QuizViewController.h
//  Quiz
//
//  Created by Michael Nwani on 12/22/12.
//  Copyright (c) 2012 Michael Nwani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuizViewController : UIViewController
{
    int currentQuestionIndex;
    //The model objects
    NSMutableArray *questions;
    NSMutableArray *answers;
    
    
    IBOutlet UILabel *questionField;
    IBOutlet UILabel *answerField;
}
-(IBAction)showQuestion:(id)sender;
-(IBAction)showAnswer:(id)sender;

@end
