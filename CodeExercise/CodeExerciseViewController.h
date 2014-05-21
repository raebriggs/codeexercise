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
- (IBAction)didTapDraw:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *winnerLabel;

@property (weak, nonatomic) IBOutlet UILabel *hand1Card1;

@property (weak, nonatomic) IBOutlet UILabel *hand1Card2;
@property (weak, nonatomic) IBOutlet UILabel *hand2Card1;
@property (weak, nonatomic) IBOutlet UILabel *hand2Card2;

@end
