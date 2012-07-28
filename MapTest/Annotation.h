//
//  Annotation.h
//  MapTest
//
//  Created by bibmeke on 2012/07/28.
//  Copyright (c) 2012年 bibmeke. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface Annotation : NSObject<MKAnnotation>
{
    CLLocationCoordinate2D _coordinate;
}

@property(nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *subtitle;

- (id)initWithCoordinate:(CLLocationCoordinate2D)aCoordinate;

@end
