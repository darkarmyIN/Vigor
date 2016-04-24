//
//  Program.h
//  Vigor
//
//  Created by YASH on 24/04/16.
//  Copyright © 2016 Dark Army. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Program : NSObject <KCSPersistable>

@property (nonatomic, retain) NSString *entityId;
@property (nonatomic, retain) NSNumber *completed;
@property (nonatomic, retain) NSNumber *notComplete;

@property (nonatomic, retain) KCSMetadata *metadata;

@end
