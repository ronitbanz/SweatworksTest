//
//  UserAPIClient.m
//  Sweatworks
//
//  Created by Ronit Banze on 2020-04-11.
//  Copyright © 2020 Ronit. All rights reserved.
//

#import "UserAPIClient.h"

static NSString * const URLString = @"https://randomuser.me/api/?results=30";

@implementation UserAPIClient

+ (UserAPIClient *)sharedUserAPIClient
{
    static UserAPIClient *_sharedUserAPIClient = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedUserAPIClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:URLString]];
    });
    
    return _sharedUserAPIClient;
}

- (instancetype)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    
    if (self) {
        self.responseSerializer = [AFJSONResponseSerializer serializer];
        self.requestSerializer = [AFJSONRequestSerializer serializer];
    }
    
    return self;
}

- (void)getUsers
{
    NSURL *URL                      = [NSURL URLWithString:URLString];
    AFHTTPSessionManager *manager   = [AFHTTPSessionManager manager];
    [manager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    [manager GET:URL.absoluteString parameters:nil headers:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        [self.delegate userAPIClient:self didReceiveUsers:responseObject];
    }
         failure:^(NSURLSessionTask *operation, NSError *error) {
        [self.delegate userAPIClient:self didFailWithError:error];
    }];
}

@end
