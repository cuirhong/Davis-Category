//
//  ViewController.m
//  Davis-Category-Demo
//
//  Created by cuirhong on 2020/8/6.
//  Copyright © 2020 cuirhong. All rights reserved.
//

#import "ViewController.h"
#import "Davis_Category_Demo-Swift.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testTableView];
    // Do any additional setup after loading the view.
}





- (void)testTableView{
    UITableView *tableView = [[UITableView alloc]init];
    BOOL isChanged = tableView.dataHasChanged;
    NSLog(@"3232");
 
    id dd = [tableView getVisibleSections];
    UIImage *image = [UIImage getLocalImage:@""];
   
    UIColor *color = [[UIColor alloc]initWithHexString:@""];
    
    id test = [UIDevice currentDeviceName];
    UIImage *mage =  [self.view screenshotToImage];
    
    
    
    
    NSString *string = [NSString localPath:@""];
//    NSDate *date = [NSString getDateFromStringWithDateStr:<#(NSString * _Nullable)#> formatter:<#(NSString * _Nullable)#> isLocal:<#(BOOL)#>]
    NSString *md5String = [string MD5For32BateWithIsUpper:NO];
    NSLog(md5String);
//    UIButton *button = [[UIButton alloc] initWithTitle:<#(NSString * _Nullable)#> titleColor:<#(UIColor * _Nullable)#> font:<#(UIFont * _Nullable)#> target:<#(id _Nullable)#> selector:<#(SEL _Nullable)#>]
//    [self.view setDd_viewBorderWidth:23];
 
//    id ddss = [CADisplayLink displayLinkWithTarget:<#(id _Nonnull)#> selector:<#(SEL _Nonnull)#> second:<#(NSInteger)#> isPause:<#(BOOL)#>]
    
//    id ss = [CADisplayLink displayLinkWithTarget:<#(nonnull id)#> selector:<#(nonnull SEL)#>]
     
}

@end
