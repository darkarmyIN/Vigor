//
//  Feedback.m
//  Vigor
//
//  Created by Avikant Saini on 4/23/16.
//  Copyright © 2016 Dark Army. All rights reserved.
//

#import "Feedback.h"

@implementation Feedback

// Insert code here to add functionality to your managed object subclass

+ (Feedback *)createNewFeedbackWithDate:(NSDate *)date review:(NSString *)review value:(CGFloat)value {
	
	AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
	NSManagedObjectContext *context = appDelegate.managedObjectContext;
	Feedback *fback = [NSEntityDescription insertNewObjectForEntityForName:@"Feedback" inManagedObjectContext:context];
	
	fback.date = date;
	fback.review = review;
	fback.value = [NSNumber numberWithFloat:value];
	fback.programName = [NSString stringWithFormat:@"SorteSwag%i", arc4random_uniform(9)+1];
	
	NSError *error;
	if (![context save:&error]) {
		
	}
	
	return fback;
}

+ (NSMutableArray<Feedback *> *)getAllFeedbacks {
	
	AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
	NSManagedObjectContext *context = appDelegate.managedObjectContext;
	
	NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Feedback"];
	
	NSError *error;
	
	return [[context executeFetchRequest:request error:&error] mutableCopy];
	
}

@end
