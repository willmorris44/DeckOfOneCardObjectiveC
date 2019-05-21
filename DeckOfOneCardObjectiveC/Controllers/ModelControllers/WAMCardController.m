//
//  WAMCardController.m
//  DeckOfOneCardObjectiveC
//
//  Created by Will morris on 5/21/19.
//  Copyright © 2019 devmtn. All rights reserved.
//

#import "WAMCardController.h"

@implementation WAMCardController

+ (void)fetchCard:(void (^)(WAMCard * _Nullable))completion {
    NSURL *baseUrl = [NSURL URLWithString:@"https://deckofcardsapi.com/api/deck/new/draw"];
    
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseUrl resolvingAgainstBaseURL:true];
    
    NSURLQueryItem *count = [NSURLQueryItem queryItemWithName:@"count" value:@"1"];
    
    components.queryItems = @[count];
    NSURL *finalUrl = components.URL;
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }
        
        if (data) {
            NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            NSArray * cardsDictionaries = jsonDictionary[@"cards"];
            NSDictionary<NSString *, NSString *> *firstCardDictionary = cardsDictionaries[0];
            WAMCard *card = [[WAMCard alloc] initWithDictionary:firstCardDictionary];
            completion(card);
        }
        completion(nil);
        return;
    }] resume];
}

+ (void)fetchImageWithUrlString:(NSString *)urlString completion:(void (^)(UIImage * _Nullable))completion {
    NSURL *url = [NSURL URLWithString:urlString];
    NSLog(@"%@", url);
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }
        
        if (data) {
            UIImage *image = [UIImage imageWithData:data];
            completion(image);
        }
        completion(nil);
        return;
    }] resume];
}

@end
