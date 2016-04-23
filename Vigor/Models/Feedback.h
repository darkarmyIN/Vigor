//
//  Feedback.h
//  Vigor
//
//  Created by Avikant Saini on 4/23/16.
//  Copyright © 2016 Dark Army. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface Feedback : NSManagedObject

// Insert code here to declare functionality of your managed object subclass

+ (Feedback *)createNewFeedbackWithDate:(NSDate *)date review:(NSString *)review value:(CGFloat)value;

+ (NSMutableArray <Feedback *> *)getAllFeedbacks;

@end

NS_ASSUME_NONNULL_END

#import "Feedback+CoreDataProperties.h"
