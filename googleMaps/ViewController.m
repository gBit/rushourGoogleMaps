//
//  ViewController.m
//  googleMaps
//
//  Created by gBit on 4/20/13.
//  Copyright (c) 2013 Oess Industries. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    GMSMapView *mapView_;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:41.888954
                                                            longitude:-87.633776
                                                                 zoom:15];
    
    mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView_.delegate = self;

//    mapView_.myLocationEnabled = YES;
    self.view = mapView_;
    
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(41.888954, -87.633776);
    marker.title = @"Mobile Makers";
    marker.snippet = @"Chicago";
    marker.map = mapView_;
}

- (void)mapView:(GMSMapView *)mapView didLongPressAtCoordinate:(CLLocationCoordinate2D)coordinate
{
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = coordinate;
    marker.map = mapView_;
    marker.animated = YES;
    marker.icon = [GMSMarker markerImageWithColor:[UIColor blueColor]];
    NSLog(@"You tapped at %f,%f", coordinate.latitude, coordinate.longitude);

}

#pragma mark - GMSMapViewDelegate

//- (void)mapView:(GMSMapView *)mapView didTapAtCoordinate:(CLLocationCoordinate2D)coordinate
//{
//    NSLog(@"You tapped at %f,%f", coordinate.latitude, coordinate.longitude);
//}

@end
