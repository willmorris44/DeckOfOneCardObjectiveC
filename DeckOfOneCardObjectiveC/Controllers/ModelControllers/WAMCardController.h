//
//  WAMCardController.h
//  DeckOfOneCardObjectiveC
//
//  Created by Will morris on 5/21/19.
//  Copyright © 2019 devmtn. All rights reserved.
//

#import "WAMCard.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WAMCardController : NSObject

+ (void) fetchCard:(void (^) (WAMCard * _Nullable))completion;

+ (void) fetchImageWithUrlString:(NSString *)urlString completion:(void (^) (UIImage * _Nullable))completion;

@end

NS_ASSUME_NONNULL_END
