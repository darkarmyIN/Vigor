//
//  Feedback+CoreDataProperties.h
//  Vigor
//
//  Created by Avikant Saini on 4/23/16.
//  Copyright © 2016 Dark Army. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Feedback.h"

NS_ASSUME_NONNULL_BEGIN

@interface Feedback (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *date;
@property (nullable, nonatomic, retain) NSNumber *value;
@property (nullable, nonatomic, retain) NSString *review;
@property (nullable, nonatomic, retain) NSString *programName;

@end

NS_ASSUME_NONNULL_END
