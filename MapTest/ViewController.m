//
//  ViewController.m
//  MapTest
//
//  Created by bibmeke on 2012/07/28.
//  Copyright (c) 2012年 bibmeke. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize mapView;
@synthesize slider;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // ガスト
    CLLocationCoordinate2D lc2d = CLLocationCoordinate2DMake(35.166161, 136.927114);

    MKCoordinateRegion mkcr;
    mkcr.center = lc2d;
    mkcr.span = MKCoordinateSpanMake(0.01f, 0.01f);

    self.mapView.region = mkcr;
//    self.mapView.userTrackingMode = MKUserTrackingModeFollow;
}

- (void)viewDidUnload
{
    [self setMapView:nil];
    [self setSlider:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (IBAction)changeSlider:(id)sender {
    MKCoordinateRegion mkcr;
    mkcr.center = self.mapView.centerCoordinate;
    mkcr.span = MKCoordinateSpanMake(1.0f - slider.value, 1.0f - slider.value);
    
    [self.mapView setRegion:mkcr animated:YES];
}

- (IBAction)pushAddAnnotationr:(id)sender {
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:[[CLLocation alloc] initWithLatitude:self.mapView.centerCoordinate.latitude
                                                                longitude:self.mapView.centerCoordinate.longitude]
                   completionHandler:^(NSArray *placeMarks, NSError *errors) {
                       if([placeMarks count] > 0) {
                           CLPlacemark *placemark = (CLPlacemark *)[placeMarks lastObject];
                           
                           NSMutableString *strAddress = [NSMutableString string];
                           for (NSString *str in [placemark.addressDictionary objectForKey:@"FormattedAddressLines"]) {
                               [strAddress appendString:str];
                           }
                           
                           Annotation *annotation = [[Annotation alloc] initWithCoordinate:self.mapView.centerCoordinate];
                           annotation.title = [placemark.addressDictionary objectForKey:@"Name"];
                           annotation.subtitle = strAddress;
                           
                           [self.mapView addAnnotation:annotation];
                           [self.mapView selectAnnotation:annotation animated:YES];
                       }
                   }];
}
     

@end
