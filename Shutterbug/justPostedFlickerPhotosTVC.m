//
//  justPostedFlickerPhotosTVC.m
//  Shutterbug
//
//  Created by Kaiqi on 11/13/15.
//  Copyright © 2015 self.edu. All rights reserved.
//

#import "justPostedFlickerPhotosTVC.h"
#import "FlickrFetcher.h"

@interface justPostedFlickerPhotosTVC ()

@end

@implementation justPostedFlickerPhotosTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self fetchPhotos];
}

- (void)fetchPhotos
{
    NSURL *url = [FlickrFetcher URLforRecentGeoreferencedPhotos];
#warning Block Main Thread
    NSData *jsonResults = [NSData dataWithContentsOfURL:url];
    if (!jsonResults) {
        return;
    }
    NSDictionary *propertyListResults = [NSJSONSerialization JSONObjectWithData:jsonResults
                                                                        options:0
                                                                          error:NULL];
    NSArray * photos = [propertyListResults valueForKeyPath: FLICKR_RESULTS_PHOTOS];
    self.photos = photos;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
