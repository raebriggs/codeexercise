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
-(bool)compareHand:(Hand *)otherHand
{
    if([self hasAPair]>0){
        if([otherHand hasAPair]<=0){
            //hand 1 wins with pair
            return YES;
        }else if([otherHand hasAPair]<[self hasAPair])
        {
            //other hand has a pair, but it is lower
            return YES;
        }
    }
    if([self isAFlush]>0 && [otherHand isAFlush]<=0){
        //this has a flush
        return YES;
    }
    if([self isAFlush]>=0 && [self isAFlush]>[otherHand isAFlush]){
        return YES;
    }
    //high card
    return [self highCard]>[otherHand highCard] ? YES : NO;
}

-(int)hasAPair
{
    if( ((Card*)cards[0]).rank ==  ((Card*)cards[1]).rank){
        return  ((Card*)cards[0]).rank;
    }
    
    return 0;
}
-(int)isAFlush
{
    if( ((Card*)cards[0]).suit ==  ((Card*)cards[1]).suit){
        return  [self highCard];
    }

    return 0;
}
-(int)highCard
{
    return  ((Card*)cards[0]).rank >  ((Card*)cards[1]).rank ? ((Card*)cards[0]).rank : ((Card*)cards[1]).rank;
}
-(void)addCard:(Card *)card
{
    if(cards==nil){
        cards = [[NSMutableArray alloc]init];
    }
    [cards addObject:card];
}
@end
