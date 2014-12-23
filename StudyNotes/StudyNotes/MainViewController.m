//
//  MainViewController.m
//  Data Structures And Algorithms In C
//
//  Created by Michael Dong on 12/27/13.
//  Copyright (c) 2013 Michael Dong. All rights reserved.
//

#import "MainViewController.h"
#import "BaseViewController.h"
#import "SNDataModel.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
//        [self.tabBar setHidden:YES];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self _initViewControllers];
    
    //[self.tabBar setHidden:YES];
//    self.tabBarController.hidesBottomBarWhenPushed=YES;
    //[[self navigationController] pushViewController:self.tabBarController animated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)_initViewControllers
{
    //Retrieve infomation from 'NoteList.plist' file and store in a dictionary.
    NSDictionary *plistDict = [SNDataModel configDataParser];

    //Retrieve the top level keys of plist file and sort. These keys should be in alphabetical or numerical order
    //when fill in plist file. Otherwise the order of tabs will be unpredictable.
    NSMutableArray *tabs =[[NSMutableArray alloc]initWithArray:[plistDict allKeys]];
    [tabs sortUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    

    //Create tabBars according to the information stored in plist file.
    NSMutableArray *viewControllers =[[NSMutableArray alloc] initWithCapacity:[tabs count]];
    for(NSString *tab in tabs)
    {
        BaseViewController *tabViewController =[[BaseViewController alloc]init];

        NSDictionary *tabDictionary =[plistDict objectForKey:tab];

        tabViewController.title =[tabDictionary objectForKey:@"name"];
        tabViewController.navigationItem.title =[tabDictionary objectForKey:@"viewTitle"];
        tabViewController.tableContents =[tabDictionary objectForKey:@"topics"];
        tabViewController.tableCellDescription = [tabDictionary objectForKey:@"descriptions"];
        tabViewController.tabBarItem.image=[UIImage imageNamed:[tabDictionary objectForKey:@"logo"]];
        [viewControllers addObject:tabViewController];

    }

    
    
    
    NSMutableArray *navViewControllers =[[NSMutableArray alloc] initWithCapacity:[viewControllers count]];
  
    
    for(BaseViewController *viewController in viewControllers){

        UINavigationController *navViewController =[[UINavigationController alloc] initWithRootViewController:viewController];
        [navViewControllers addObject:navViewController];
    }
    
    
    
    self.viewControllers = navViewControllers;
    
    
    
}

@end
