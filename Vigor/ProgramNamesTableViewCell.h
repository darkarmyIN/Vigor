//
//  ProgramNamesTableViewCell.h
//  Vigor
//
//  Created by YASH on 24/04/16.
//  Copyright © 2016 Dark Army. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProgramNamesTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *programImage;
@property (strong, nonatomic) IBOutlet UILabel *programNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *programDescriptionLabel;

@end
