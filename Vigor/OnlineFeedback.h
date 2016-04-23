//
//  OnlineFeedback.h
//  Vigor
//
//  Created by YASH on 24/04/16.
//  Copyright © 2016 Dark Army. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OnlineFeedback : NSObject <KCSPersistable>

@property (nonatomic, retain) NSString *entityId;
@property (nonatomic, retain) NSDate *dateOfUpload;
@property (nonatomic, retain) NSString *review;
@property (nonatomic, retain) NSString *programName;
@property (nonatomic, retain) NSNumber *valueForFeedback;

@property (nonatomic, retain) KCSMetadata *metadata;

@end
