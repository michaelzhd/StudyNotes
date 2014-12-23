//
//  BaseViewController.m
//  Data Structures And Algorithms In C
//
//  Created by Michael Dong on 12/27/13.
//  Copyright (c) 2013 Michael Dong. All rights reserved.
//

#import "BaseViewController.h"
#import "BaseWebViewController.h"
#import "AboutViewController.h"

@interface BaseViewController ()


-(void) _initTableView;

@end

@implementation BaseViewController

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
    
    [self setTitleFontSize:15.0 andColor:[UIColor blueColor]];

    [self setAboutButton];
    [self _initTableView];
    
 
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)setTitleFontSize:(float)fontSize andColor:(UIColor*)color
{
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                            [UIFont boldSystemFontOfSize:fontSize], NSFontAttributeName,
                                            color, NSForegroundColorAttributeName,nil]];
}



- (void)setAboutButton
{
     self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"About"] style:(UIBarButtonItemStylePlain) target:self action:@selector(showAboutView)];
}



- (void)showAboutView
{
    AboutViewController *aboutViewController =[[AboutViewController alloc]init];
    aboutViewController.title = @"About";
    
    aboutViewController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self.navigationController presentViewController:aboutViewController animated:YES completion:nil];
}

-(void)_initTableView
{
    _tableView =[[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    
    [_tableView setDelegate:self];
    [_tableView setDataSource:self];

    
    [self.view addSubview:_tableView];
    [_tableView reloadData];
    
}




#pragma mark -UITableviewDatasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{


//    return [self.tableContents count];
    return 1;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    
    return [self.tableContents count];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier =@"Cell";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell ==nil)
    {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        
    }
    
    //customizing TableViewCell
    cell.accessoryType   = UITableViewCellAccessoryDisclosureIndicator;
    
    
    cell.textLabel.text  = [self.tableContents objectAtIndex:indexPath.section];
    if ([self.tableCellDescription count] > indexPath.section)
    {
        cell.detailTextLabel.text = [self.tableCellDescription objectAtIndex:indexPath.section];
        cell.imageView.image = [UIImage imageNamed:cell.textLabel.text];
//        cell.imageView.frame = CGRectOffset(cell.frame, 10, 10);
    }else
    {
        cell.detailTextLabel.text =cell.textLabel.text;
    }
    cell.textLabel.textColor =[UIColor blueColor];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    

    
    if(indexPath.section >= [self.tableContents count])
    {
        cell.hidden =YES;
    }
    
    
    return cell;
    
}

#pragma mark -UITableViewDelegate


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *tableCellTitle =[self.tableContents objectAtIndex:indexPath.section];
    
    //removing non-alphanumeric characters
    NSCharacterSet *charToRemove =[[NSCharacterSet alphanumericCharacterSet] invertedSet];
    NSString *htmlFile =[[tableCellTitle componentsSeparatedByCharactersInSet:charToRemove] componentsJoinedByString:@""];
    
    BaseWebViewController *cellWebView =[[BaseWebViewController alloc] init];
    
    cellWebView.navigationItem.title =tableCellTitle;
    cellWebView.tabDirectory =[[self.title componentsSeparatedByCharactersInSet:charToRemove] componentsJoinedByString:@""];
    
    cellWebView.htmlFileName =htmlFile;
    [self.navigationController pushViewController:cellWebView animated:YES];
    
    
}





@end
