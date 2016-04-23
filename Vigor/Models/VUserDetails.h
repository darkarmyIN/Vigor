//
//  VUserDetails.h
//  Vigor
//
//  Created by Avikant Saini on 4/23/16.
//  Copyright © 2016 Dark Army. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, VUserSex) {
	VUserSexMale = 1,
	VUserSexFemale = 0,
	VUserSexOther = 1,
};

@interface VUserDetails : NSObject

// cm
@property (nonatomic) CGFloat height;

// kg
@property (nonatomic) CGFloat weight;

// integer
@property (nonatomic) NSInteger age;

// male or female
@property (nonatomic) VUserSex sex;


@property (nonatomic) CGFloat bmi;

@property (nonatomic) CGFloat abfp;

@property (nonatomic) CGFloat bmr;


@end
