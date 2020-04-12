//
//  DetailViewController.h
//  Sweatworks
//
//  Created by Ronit on 4/10/20.
//  Copyright © 2020 Ronit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDWebImage/SDWebImage.h"

@interface DetailViewController : UIViewController
@property ( nonatomic, strong ) NSString *firstName;
@property ( nonatomic, strong ) NSString *lastName;
@property ( nonatomic, strong ) NSString *imageUrl;
@property ( nonatomic, strong ) NSString *address;

@end
