//
//  CodeExerciseViewController.m
//  CodeExercise
//
//  Created by Rae Briggs on 2014-05-20.
//  Copyright (c) 2014 Rae Briggs. All rights reserved.
//

#import "CodeExerciseViewController.h"

@interface CodeExerciseViewController ()

@end

@implementation CodeExerciseViewController

@synthesize countInputTextField,outputLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didTapShuffle:(id)sender {
    if(countInputTextField.text.length<=0){
        //show an error
    }else{
        NSString *count = countInputTextField.text;
        
        [self shuffleIt: [count intValue] ];
    }
}
/**
 *Use the Knuth-Fisher-Yates algorithm
 */
 
-(void)shuffleIt:(int) count
{
    NSMutableArray *array = [self generateOrderedArray:count];
    outputLabel.text = [[self knuth_fisher_yates:array] componentsJoinedByString:@","];
    //[array componentsJoinedByString:@","];
    
}
-(NSMutableArray*)knuth_fisher_yates:(NSMutableArray*)array
{
    for(int i=array.count-1;i>=0;i--){
        //generate random
        int random = arc4random_uniform(i);
        //temp store obj (maybe its not a number!)
        id temp = [array objectAtIndex:random];
        //swap em
        array[random] = array[i];
        array[i] = temp;
    }
    return array;
}
-(NSMutableArray*)generateOrderedArray:(int)count
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for(int i=0;i<count;i++)
    {
        array[i]=[NSNumber numberWithInt:i+1];
    }
    return array;
}
@end
