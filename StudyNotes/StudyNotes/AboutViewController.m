//
//  AboutViewController.m
//  Python StudyNotes
//
//  Created by Michael Dong on 12/30/13.
//  Copyright (c) 2013 Michael Dong. All rights reserved.
//

#import "AboutViewController.h"
#import "SNDataModel.h"

@interface AboutViewController ()


-(void)loadBackButton;
-(void)popBack;
-(void)loadTextView;


@end

@implementation AboutViewController

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
    [self loadTextView];
    [self loadBackButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)loadBackButton
{
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [backButton setFrame:CGRectMake(120, 430, 80, 30)];

    [backButton setTitle:@"Back" forState:UIControlStateNormal];
    backButton.layer.borderColor = [UIColor blueColor].CGColor;
    backButton.layer.borderWidth  = 1;
    backButton.layer.cornerRadius = 4;
    backButton.titleLabel.textColor =[UIColor blueColor];

    [backButton addTarget:self action:@selector(popBack) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:backButton];
    
}

-(void)popBack
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)loadTextView
{

    UITextView *aboutText =[[UITextView alloc]initWithFrame:CGRectMake(20, 50, 280, 350)];
    aboutText.textColor =[UIColor blueColor];
    aboutText.editable  = NO;
    aboutText.font =[UIFont fontWithName:@"Helvetica" size:10.0];
    //aboutText.textAlignment =NSTextAlignmentCenter;
    [aboutText resignFirstResponder];
   
    NSString *filePath =[[NSBundle mainBundle] pathForResource:@"about" ofType:@"txt" inDirectory:@"Htmls"];
    
    
    if (filePath)
    {
        aboutText.text =[NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:NULL];
        
    }else
    {
        aboutText.text =@"I am still working on this part, coming soon...";
    }
    

    [self.view addSubview:aboutText];
    
}

@end
