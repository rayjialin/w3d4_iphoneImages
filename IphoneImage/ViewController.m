//
//  ViewController.m
//  IphoneImage
//
//  Created by ruijia lin on 4/25/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *iphoneImage;
@property NSArray *imageArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.imageArray = [NSArray new];
    self.imageArray = @[@"http://imgur.com/bktnImE.png",
                         @"http://imgur.com/zdwdenZ.png",
                        @"http://imgur.com/CoQ8aNl.png",
                        @"http://imgur.com/2vQtZBb.png",
                        @"http://imgur.com/y9MIaCS.png"];
    
    //    NSInteger randomIndex = arc4random_uniform(imageArray.count+1);
    
    //    NSString *randomImageString = [imageArray objectAtIndex:arc4random_uniform(imageArray.count+1)];
    //
    //    NSURL *url = [NSURL URLWithString:randomImageString];
    //
    //    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    //
    //    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfiguration];
    //
    //    NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithURL:url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    //        if (error){
    //            NSLog(@"download failed");
    //            return;
    //        }
    //
    //        NSData *data = [NSData dataWithContentsOfURL:location];
    //        UIImage *image = [UIImage imageWithData:data];
    //
    //        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
    //            self.iphoneImage.image = image;
    //        }];
    //    }];
    //
    //    [downloadTask resume];
    
}
- (IBAction)randomImageAction:(UIButton *)sender {
    NSInteger index = arc4random_uniform(5);
    NSString *randomImageString = [self.imageArray objectAtIndex:index];
    
    NSURL *url = [NSURL URLWithString:randomImageString];
    
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfiguration];
    
    NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithURL:url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error){
            NSLog(@"download failed");
            return;
        }
        
        NSData *data = [NSData dataWithContentsOfURL:location];
        UIImage *image = [UIImage imageWithData:data];
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.iphoneImage.image = image;
        }];
    }];
    
    [downloadTask resume];
}

@end
