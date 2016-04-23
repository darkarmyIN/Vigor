//
//  VBackendClass.h
//  Vigor
//
//  Created by YASH on 23/04/16.
//  Copyright © 2016 Dark Army. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VBackendClass : NSObject <KCSPersistable>

@property (nonatomic, retain) KCSMetadata *metadata;

@property (strong, nonatomic) NSString *randomItem;

@end
