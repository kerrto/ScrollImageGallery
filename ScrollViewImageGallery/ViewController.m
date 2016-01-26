//
//  ViewController.m
//  ScrollViewImageGallery
//
//  Created by Kerry Toonen on 2016-01-25.
//  Copyright © 2016 Kerry Toonen. All rights reserved.
//

#import "ViewController.h"
#import "NewVC.h"

@interface ViewController ()<UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIPageControl *pageController;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 10,CGRectGetWidth(self.view.frame) - 20, CGRectGetHeight(self.view.frame) - 20)];
    self.scrollView.backgroundColor = [UIColor yellowColor];
   
    [self.view addSubview:self.scrollView];
    self.scrollView.delegate=self;
    self.scrollView.pagingEnabled = YES;
    
    NSArray *images = @[[UIImage imageNamed:@"lighthouse-night.jpg"], [UIImage imageNamed:@"lighthouse.jpg"], [UIImage imageNamed:@"Lighthouse-in-Field.jpg"]];
    
    self.scrollView.userInteractionEnabled=YES;
    
    UIView *containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.scrollView.frame), CGRectGetHeight(self.scrollView.frame))];
    [self.scrollView addSubview:containerView];

    CGFloat xPosition = 0;
    for (UIImage *image in images) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(xPosition, 0, CGRectGetWidth(self.scrollView.frame), CGRectGetHeight(self.scrollView.frame))];
        imageView.image=image;
        [containerView addSubview:imageView];
        
        xPosition += self.scrollView.frame.size.width;
        
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        self.scrollView.contentSize = CGSizeMake(xPosition, self.scrollView.frame.size.height);
        
        self.containerView.userInteractionEnabled=YES;
        self.navigationController.navigationBarHidden=FALSE;
        
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapForSegue:)];
        
        imageView.userInteractionEnabled=YES;
        
        [imageView addGestureRecognizer:tapGestureRecognizer];
         [self.view addSubview:self.pageController];        
//
    }
}
- (void) tapForSegue: (UITapGestureRecognizer *)recognizer
{
    
    [self performSegueWithIdentifier:@"GoToDetail" sender:recognizer.view];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIImageView *)sender
{
    NewVC *dvc = (NewVC*)segue.destinationViewController;
    dvc.myImage = sender.image;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGPoint i=self.scrollView.contentOffset;
    if (i.x>0 && i.x<CGRectGetWidth(self.view.frame)) {
    self.pageController.currentPage=1;}
    else if (i.x>CGRectGetWidth(self.view.frame) && i.x<CGRectGetWidth(self.view.frame)*2){
        self.pageController.currentPage=2;}
    else if (i.x>CGRectGetWidth(self.view.frame)*3){
        self.pageController.currentPage=3;}
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
