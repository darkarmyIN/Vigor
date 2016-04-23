//
//  OnlineFeedback.m
//  Vigor
//
//  Created by YASH on 24/04/16.
//  Copyright © 2016 Dark Army. All rights reserved.
//

#import "OnlineFeedback.h"

@implementation OnlineFeedback

- (NSDictionary *)hostToKinveyPropertyMapping
{
    
    return @{
             @"entityId" : KCSEntityKeyId,
             @"dateOfUpload" : @"UploadDate",
             @"review" : @"Review",
             @"programName" : @"Program",
             @"valueForFeedback" : @"Value",
             @"metadata" : KCSEntityKeyMetadata
             };
    
}

@end
