//
//  DetailViewController.m
//  Sweatworks
//
//  Created by Ronit on 4/10/20.
//  Copyright © 2020 Ronit. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *userImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 220, 200)];
    userImageView.center = CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height / 6);
    [userImageView sd_setImageWithURL:[NSURL URLWithString:_imageUrl]];
    [userImageView.layer setCornerRadius : 40];
    [userImageView.layer setMasksToBounds:YES];
    [self.view addSubview: userImageView];
    
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 21)];
    nameLabel.center = CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height / 3);
    [nameLabel setTextAlignment:NSTextAlignmentCenter];
    NSString *nameString = [NSString stringWithFormat:@"%@, %@", _lastName, _firstName];
    NSString *lowerNameString = [nameString lowercaseString];
    [nameLabel setFont:[UIFont fontWithName:@"Roboto-Regular" size:15]];
    [nameLabel setText:lowerNameString];
    [self.view addSubview: nameLabel];
    
    UILabel *addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 21)];
    addressLabel.center = CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height / 2.5);
    [addressLabel setTextAlignment:NSTextAlignmentCenter];
    NSString *addressString = [_address lowercaseString];
    [addressLabel setFont:[UIFont fontWithName:@"Roboto-Regular" size:15]];
    [addressLabel setText:addressString];
    addressLabel.adjustsFontSizeToFitWidth = true;
    [self.view addSubview: addressLabel];
}

@end
