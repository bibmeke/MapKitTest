//
//  Annotation.h
//  MapTest
//
//  Created by bibmeke on 2012/07/28.
//  Copyright (c) 2012年 bibmeke. All rights reserved.
//

#import "Annotation.h"

@implementation Annotation

- (id)initWithCoordinate:(CLLocationCoordinate2D)aCoordinate
{
    self = [super init];
    if (self) {
        _coordinate = aCoordinate;
    }
    return self;
}

@end
