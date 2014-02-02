//
//  TJLTestModel.h
//  YapDatabase Example
//
//  Created by Terry Lewis II on 2/2/14.
//  Copyright (c) 2014 Blue Plover Productions LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TJLTestModel : NSObject <NSCoding>

- (instancetype)initWithName:(NSString *)name subtitle:(NSString *)subtitle;

@property(strong, nonatomic) NSString *name;
@property(strong, nonatomic) NSString *subtitle;
@end

