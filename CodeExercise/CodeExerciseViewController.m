//
//  CodeExerciseViewController.m
//  CodeExercise
//
//  Created by Rae Briggs on 2014-05-20.
//  Copyright (c) 2014 Rae Briggs. All rights reserved.
//

#import "CodeExerciseViewController.h"
#import "Card.h"
#import "Hand.h" 

@interface CodeExerciseViewController ()

@end

@implementation CodeExerciseViewController

@synthesize countInputTextField,outputLabel;

@synthesize hand1Card1,hand1Card2,hand2Card1,hand2Card2,winnerLabel;

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
-(NSMutableArray*)generateAndShuffle:(int)count
{
    return [self knuth_fisher_yates:[self generateOrderedArray:count] ];
}
#pragma Problem 2
/**
 *hearts,diamonds,spades,clubs
 * 0 1 2 3
 * value < 14 H
 *value >= 14 < 27 D
 * value >= 27 < 40 S
 * value >= 40 < =52 C
 */
-(NSMutableArray*)generateShuffledDeckOfCards
{
    return [self generateAndShuffle:52];
}

- (IBAction)didTapDraw:(id)sender {
  
    NSMutableArray *cards = [self generateShuffledDeckOfCards];
  //  hand1Card1.text = [cards[0] stringValue];
    
    Hand *hand1 = [[Hand alloc]init];
    [hand1 addCard:[ [Card alloc]initWithCardIndex:[cards[0] intValue] ] ];
     [hand1 addCard:[ [Card alloc]initWithCardIndex:[cards[2] intValue] ] ];
    
    Hand *hand2 = [[Hand alloc]init];
    [hand2 addCard:[ [Card alloc]initWithCardIndex:[cards[1] intValue] ] ];
    [hand2 addCard:[ [Card alloc]initWithCardIndex:[cards[3] intValue] ] ];
    
    if([hand1 compareHand:hand2])
    {
        winnerLabel.text = @"Hand1";
    }else{
        winnerLabel.text = @"Hand2";
    }
     hand1Card1.text =  [hand1.cards[0] toString];
    hand1Card2.text =  [hand1.cards[1] toString];
    hand2Card1.text =  [hand2.cards[0] toString];
    hand2Card2.text = [hand2.cards[1] toString];
    
}
@end

