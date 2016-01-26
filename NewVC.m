//
//  NewVC.m
//  ScrollViewImageGallery
//
//  Created by Kerry Toonen on 2016-01-25.
//  Copyright © 2016 Kerry Toonen. All rights reserved.
//

#import "NewVC.h"
#import "ViewController.h"

@interface NewVC () <UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *detailScrollView;
@property (nonatomic, strong) UIImageView *imageTapped;
@end

@implementation NewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.detailScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 10, CGRectGetWidth(self.view.frame) - 20, CGRectGetHeight(self.view.frame) - 20)];
    self.detailScrollView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.detailScrollView];
    
    UIImageView *largeImageView = [[UIImageView alloc]initWithImage:self.myImage];
    [self.detailScrollView addSubview:largeImageView];
    
    // we need to set the content size to allow scrolling
    self.detailScrollView.contentSize = CGSizeMake(CGRectGetWidth(largeImageView.frame), CGRectGetHeight(largeImageView.frame));
    
    // To enable scrolling, we need to implement the delegate method viewForZoomingInScrollView:
    
    self.detailScrollView.delegate = self;
    
    // We also need to set the zoom scale
    self.detailScrollView.minimumZoomScale = 0.5;
    self.detailScrollView.maximumZoomScale = 10;
    
    // Add a tag to the image view to allow us to access it later. Don't abuse tags, creating properties is preferred most of the time!
    largeImageView.tag = 100;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
