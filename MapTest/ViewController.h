//
//  ViewController.h
//  MapTest
//
//  Created by bibmeke on 2012/07/28.
//  Copyright (c) 2012年 bibmeke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import <Twitter/Twitter.h>
#import "Annotation.h"

@interface ViewController : UIViewController <CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UISlider *slider;

- (IBAction)changeSlider:(id)sender;
- (IBAction)pushAddAnnotationr:(id)sender;

@end
