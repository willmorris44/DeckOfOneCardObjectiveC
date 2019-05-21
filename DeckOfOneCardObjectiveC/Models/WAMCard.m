//
//  WAMCard.m
//  DeckOfOneCardObjectiveC
//
//  Created by Will morris on 5/21/19.
//  Copyright © 2019 devmtn. All rights reserved.
//

#import "WAMCard.h"

@implementation WAMCard

- (instancetype)initWithSuit:(NSString *)suit imageUrl:(NSString *)imageUrl {
    self = [super init];
    if (self) {
        _suit = suit;
        _imageUrl = imageUrl;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary {
    NSString *suit = dictionary[@"suit"];
    NSString *image = dictionary[@"image"];
    
    return [self initWithSuit:suit imageUrl:image];
}

@end
