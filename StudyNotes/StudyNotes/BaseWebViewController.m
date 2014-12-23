//
//  BaseWebViewController.m
//  Data Structures And Algorithms In C
//
//  Created by Michael Dong on 12/27/13.
//  Copyright (c) 2013 Michael Dong. All rights reserved.
//

#import "BaseWebViewController.h"

@interface BaseWebViewController ()

-(void)_initWebviewWithDirectory:(NSString *)dir andFileName:(NSString *)fileName;
-(void)_initTextSizeControllerButton;
-(void)_adjustWebviewFontSizeWithRatio:(id)sendor;
-(void)_initNavBarTabBarControl;
-(void)_showOrHideBars;
-(void)_removeBodyMargin;

@end

@implementation BaseWebViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self _initWebviewWithDirectory:_tabDirectory andFileName:_htmlFileName];

    
    _ratio = 100;
    
    [self _initTextSizeControllerButton];
    
    [self _initNavBarTabBarControl];
   
    [self _removeBodyMargin];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)_initWebviewWithDirectory:(NSString *)dir andFileName:(NSString *)fileName
{
    _webView =[[UIWebView alloc] initWithFrame:self.view.frame];
    _webView.scalesPageToFit = YES;
    _webView.scrollView.scrollEnabled =YES;

    
    
    NSString *directory =[NSString stringWithFormat:@"Htmls/%@", dir];
    NSString *filePath =[[NSBundle mainBundle] pathForResource:fileName ofType:@"html" inDirectory:directory];
    
    
    if (filePath)
    {
        
        NSURLRequest *fileRequest =[NSURLRequest requestWithURL:[NSURL fileURLWithPath:filePath]];
        
     
        
        [_webView loadRequest:fileRequest];
    

    }else
    {   NSString *errorFilePath =[[NSBundle mainBundle] pathForResource:@"fileError" ofType:@"html" inDirectory:@"Htmls"];
        NSURLRequest *fileRequest = [NSURLRequest requestWithURL:[NSURL fileURLWithPath:errorFilePath]];
        [_webView loadRequest:fileRequest];
    }
    



    
    [self.view addSubview:_webView];
    

}


-(void)_initTextSizeControllerButton
{


    UIBarButtonItem *plus =[[UIBarButtonItem alloc]initWithTitle:@"A+" style:UIBarButtonItemStyleDone target:self action:@selector(_adjustWebviewFontSizeWithRatio:)];
    plus.tag  =1;
    
    
    UIBarButtonItem *minus =[[UIBarButtonItem alloc]initWithTitle:@"A-" style:UIBarButtonItemStylePlain target:self action:@selector(_adjustWebviewFontSizeWithRatio:)];
    minus.tag =2;
    
    
    
    NSArray *rightBarButtons =@[minus, plus];
    
    
    
    self.navigationItem.rightBarButtonItems =rightBarButtons;

    

    
}

-(void)_adjustWebviewFontSizeWithRatio:(id)sender
{
    UIBarButtonItem *sizeButton =sender;
    

    
    
    if(sizeButton.tag == 1)
    {
        _ratio *=1.2;
    }else if(sizeButton.tag == 2)
    {
        _ratio *=0.8;
    }else
    {
        _ratio *=1.0;
    }
    
    
    
    NSString *script =[NSString stringWithFormat:@"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust='%d%%'",_ratio];
    
    [self.webView stringByEvaluatingJavaScriptFromString:script];


    
}


-(void)_initNavBarTabBarControl
{
    UITapGestureRecognizer  *tapGesture =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_showOrHideBars)];
    
    tapGesture.numberOfTapsRequired = 2;
    [tapGesture setDelegate:self];
    
    [self.view addGestureRecognizer:tapGesture];
    
    
}

-(void)_showOrHideBars
{
    if(self.navigationController.navigationBarHidden)
    {

        [self.navigationController setNavigationBarHidden:NO animated:YES];

        
    }else
    {

        [self.navigationController setNavigationBarHidden:YES animated:YES];

    }
    
}


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    
    return YES;
}


//override the UIViewController method to make sure there will be no blank area at original tab bar location
- (BOOL)hidesBottomBarWhenPushed
{
    return YES;
    
}

- (void)_removeBodyMargin
{
    NSString *padding = @"document.body.style.margin='0';document.body.style.padding='0'";
    [self.webView stringByEvaluatingJavaScriptFromString:padding];
    
}



@end

