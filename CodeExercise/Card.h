//
//  Card.h
//  CodeExercise
//
//  Created by Rae Briggs on 2014-05-21.
//  Copyright (c) 2014 Rae Briggs. All rights reserved.
//

#import <Foundation/Foundation.h>

enum suit
{
  hearts,
    diamonds,
    spades,
    clubs
};
@interface Card : NSObject
-(id)initWithCardIndex:(int)cardIndex;
@property enum suit cardSuit;
@property int rank;
@property int cardIndex;
-(NSString*)toString;
@end
