//
//  VBackendClass.m
//  Vigor
//
//  Created by YASH on 23/04/16.
//  Copyright © 2016 Dark Army. All rights reserved.
//

#import "VBackendClass.h"

@implementation VBackendClass

// just to not forget, right side is key on backend, left side is variable name in .h

- (NSDictionary *)hostToKinveyPropertyMapping
{
    
    return @{
             @"entityId" : KCSEntityKeyId,
             @"randomItem" : @"randomKey",
             @"metadata" : KCSEntityKeyMetadata
             };
    
}

@end
