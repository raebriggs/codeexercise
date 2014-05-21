//
//  Hand.m
//  CodeExercise
//
//  Created by Rae Briggs on 2014-05-21.
//  Copyright (c) 2014 Rae Briggs. All rights reserved.
//

#import "Hand.h"

@implementation Hand
@synthesize cards;


-(int)hasAPair
{
    int highrank = 0;
    //check each card for a pair
    for(int i=0;i<cards.count-1;i++){
        if([cards[i] rank] == [cards[i+1] rank]){
            //if the rank is higher, store it
            if([cards[i] rank]>highrank){
                highrank = [cards[i] rank];
                self.handValue = pair;
            }
        }
    }
    return highrank;
}
-(int)isAFlush
{
    //no flushes of 1
    if(cards.count > 1){
        for(int i=0;i<cards.count-1;i++){
            if([cards[i] cardSuit] != [cards[i+1] cardSuit]){
                return 0;
            }
        }
        //all match
        if(self.handValue!=pair){
            self.handValue = flush;
        }
    }
    return [self highCard];
}
/*Should just store this in a property
 */
-(int)highCard
{
    int localHighCard = 0;
    for(int i=0;i<cards.count;i++){
        if([cards[i] rank]>localHighCard){
            localHighCard = [cards[i] rank];
        }
    }
    return localHighCard;
//    return  ((Card*)cards[0]).rank >  ((Card*)cards[1]).rank ? ((Card*)cards[0]).rank : ((Card*)cards[1]).rank;
}
-(void)addCard:(Card *)card
{
    if(cards==nil){
        cards = [[NSMutableArray alloc]init];
    }
    [cards addObject:card];
    //evaluate after each card
    [self evaluateHand];
}
-(void)evaluateHand{
    [self isAFlush];
    [self hasAPair];
}
/*
 *convenience to have string output of high hand
 */
-(NSString*)highValueString
{
    return [NSString stringWithFormat:@"%@ %i high", [self handValueToString],[self highCard] ];
}
/*
 *convert the enum to a string
 */
-(NSString*)handValueToString
{
    switch ([self handValue]) {
        case pair:
            return @"Pair";
            break;
        case flush:
            return @"Flush";
            break;
        case highcard:
            return @"HighCard";
            break;
    }
}
@end
