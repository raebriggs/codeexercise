//
//  CodeExerciseTests.m
//  CodeExerciseTests
//
//  Created by Rae Briggs on 2014-05-20.
//  Copyright (c) 2014 Rae Briggs. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Card.h"
#import "Hand.h";

@interface CodeExerciseTests : XCTestCase

@end

@implementation CodeExerciseTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}
-(void)testHighCardDifferentSuits
{
    Card *card1 =  [[Card alloc]initWithCardIndex:17];
    Card *card2 =[[Card alloc]initWithCardIndex:1];
    Hand *hand1 = [[Hand alloc]init];
    [hand1 addCard:card1];
    [hand1 addCard:card2];
    
    XCTAssertTrue([hand1 handValue] == highcard, @"highcard");
}
- (void)testPair
{
    //a pair
    Card *card1 =  [[Card alloc]initWithCardIndex:21];
    Card *card2 =[[Card alloc]initWithCardIndex:8];
    Hand *hand1 = [[Hand alloc]init];
    [hand1 addCard:card1];
    [hand1 addCard:card2];
    
    XCTAssertTrue([hand1 handValue] == pair, @"pair");
     XCTAssertTrue([hand1 highCard] == 8, @"highcard is 8");
}
-(void)testFlush
{
    Card *card1 =  [[Card alloc]initWithCardIndex:4];
    Card *card2 =[[Card alloc]initWithCardIndex:1];
    Hand *hand1 = [[Hand alloc]init];
    [hand1 addCard:card1];
    [hand1 addCard:card2];
    
    XCTAssertTrue([hand1 handValue] == flush, @"flush");
     XCTAssertTrue([hand1 highCard] == 4, @"flush highcard is 4");
}

@end
