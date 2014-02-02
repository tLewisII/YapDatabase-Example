//
//  TJLTestModel.m
//  YapDatabase Example
//
//  Created by Terry Lewis II on 2/2/14.
//  Copyright (c) 2014 Blue Plover Productions LLC. All rights reserved.
//

#import "TJLTestModel.h"

@implementation TJLTestModel
- (instancetype)initWithName:(NSString *)name subtitle:(NSString *)subtitle {
    self = [super init];
    if(!self) {
        return nil;
    }

    _name = name;
    _subtitle = subtitle;

    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.subtitle forKey:@"subtitle"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if(!self) {
        return nil;
    }
    self.name = [aDecoder decodeObjectForKey:@"name"];
    self.subtitle = [aDecoder decodeObjectForKey:@"subtitle"];


    return self;
}
@end
