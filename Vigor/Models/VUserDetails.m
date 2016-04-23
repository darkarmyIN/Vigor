//
//  VUserDetails.m
//  Vigor
//
//  Created by Avikant Saini on 4/23/16.
//  Copyright © 2016 Dark Army. All rights reserved.
//

#import "VUserDetails.h"

@implementation VUserDetails

- (instancetype)init {
	self = [super init];
	if (self) {
		self.height = 150;
		self.weight = 60.2;
		self.age = 18;
		self.sex = VUserSexMale;
	}
	return self;
}

- (CGFloat)bmi {
	return (self.weight)/(pow(self.height/100, 2));
}

- (CGFloat)abfp {
	return (1.20 * self.bmi) + (0.23 * self.age) - (10.8 * self.sex) - 5.4;
}

- (CGFloat)bmr {
	CGFloat temp = (10 * self.weight) + (6.25 * self.height) - (5 * self.age);
	if (self.sex == VUserSexMale)
		return temp + 5;
	return temp - 161;
}

- (NSString *)description {
	return [NSString stringWithFormat:@"\n-------------\nbmi = %.3f\nabfp = %.3f\nbmr = %.3f\n---------------", self.bmi, self.abfp, self.bmr];
}

@end
