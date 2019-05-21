//
//  WAMCard.h
//  DeckOfOneCardObjectiveC
//
//  Created by Will morris on 5/21/19.
//  Copyright © 2019 devmtn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WAMCard : NSObject

@property (nonatomic, copy) NSString* suit;
@property (nonatomic, copy) NSString* imageUrl;

- (instancetype) initWithSuit:(NSString *)suit imageUrl:(NSString *)imageUrl;

- (instancetype) initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
