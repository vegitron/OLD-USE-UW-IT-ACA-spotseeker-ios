//
//  SpotDetailsViewControllerViewController.m
//  SpotSeeker
//
//  Copyright 2012 UW Information Technology, University of Washington
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import "SpotDetailsViewController.h"


@implementation SpotDetailsViewController

@synthesize spot;
@synthesize capacity_label;
@synthesize favorite_button;
@synthesize favorite_spots;
@synthesize img_view;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) showDataForSpot {
//    [self setTitle:[spot name]];
    
    
//    [self.capacity_label setText:[spot capacity]];
          
    if ([Favorites isFavorite:spot]) {
        [self.favorite_button setImage:[UIImage imageNamed:@"star_selected.png"] forState:UIControlStateNormal];        
    }

    NSString *app_path = [[NSBundle mainBundle] bundlePath];
    NSString *plist_path = [app_path stringByAppendingPathComponent:@"spotseeker.plist"];
    NSDictionary *plist_values = [NSDictionary dictionaryWithContentsOfFile:plist_path];
    
    NSString *server = [plist_values objectForKey:@"spotseeker_host"];

    server = [server stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"/"]];

    for (NSString *url in spot.image_urls) {
        NSString *image_url = [server stringByAppendingString:url];
//        UIImage *image = [UIImage alloc] from
  //      [self.img_view a
        NSLog(@"Fetch url: %@", image_url);
    }
}

- (IBAction) btnClickFavorite:(id)sender {
   
   
    if ([Favorites isFavorite:spot]) {
        [self.favorite_button setImage:[UIImage imageNamed:@"star_unselected.png"] forState:UIControlStateNormal];
        [Favorites removeFavorite:spot];     
    }
    else {
        [self.favorite_button setImage:[UIImage imageNamed:@"star_selected.png"] forState:UIControlStateNormal];
        [Favorites addFavorite:spot];
    }
    
}

- (void)viewDidLoad
{
    UIImage *image = [UIImage imageNamed:@"cat_named_spot.jpg"];    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    self.navigationItem.titleView = imageView;

    [super viewDidLoad];
    [self showDataForSpot];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    self.navigationItem.titleView = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

@end
