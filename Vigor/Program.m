//
//  Program.m
//  Vigor
//
//  Created by YASH on 24/04/16.
//  Copyright © 2016 Dark Army. All rights reserved.
//

#import "Program.h"

@implementation Program

- (NSDictionary *)hostToKinveyPropertyMapping
{
    
    return @{
             @"entityId" : KCSEntityKeyId,
             @"programName" : @"name",
             @"completed" : @"isCompleted",
             @"notComplete" : @"isIncomplete",
             @"metadata" : KCSEntityKeyMetadata
             };
    
}

@end
