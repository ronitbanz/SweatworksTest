//
//  UserAPIClient.h
//  Sweatworks
//
//  Created by Ronit Banze on 2020-04-11.
//  Copyright © 2020 Ronit. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@protocol UserAPIClientDelegate;

@interface UserAPIClient : AFHTTPSessionManager
@property (nonatomic, weak) id<UserAPIClientDelegate>delegate;

+ (UserAPIClient *)sharedUserAPIClient;
- (instancetype)initWithBaseURL:(NSURL *)url;
- (void)getUsers;

@end

@protocol UserAPIClientDelegate
@optional
-(void)userAPIClient:(UserAPIClient *)client didReceiveUsers:(id)usersList;
-(void)userAPIClient:(UserAPIClient *)client didFailWithError:(NSError *)error;
@end
