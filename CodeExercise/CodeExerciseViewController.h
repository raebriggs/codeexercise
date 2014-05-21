//
//  CodeExerciseViewController.h
//  CodeExercise
//
//  Created by Rae Briggs on 2014-05-20.
//  Copyright (c) 2014 Rae Briggs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CodeExerciseViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *outputLabel;
@property (weak, nonatomic) IBOutlet UIButton *shuffleButton;
@property (weak, nonatomic) IBOutlet UITextField *countInputTextField;
- (IBAction)didTapShuffle:(id)sender;

@end
