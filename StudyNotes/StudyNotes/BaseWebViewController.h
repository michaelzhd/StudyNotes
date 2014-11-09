//
//  BaseWebViewController.h
//  Python StudyNotes
//
//  Created by Michael Dong on 12/27/13.
//  Copyright (c) 2013 Michael Dong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseWebViewController : UIViewController <UIGestureRecognizerDelegate>

@property(nonatomic,retain) NSString  *htmlFileName;
@property(nonatomic,retain) NSString  *tabDirectory;
@property(nonatomic,retain) UIWebView *webView;

@property(nonatomic,weak) id <UIGestureRecognizerDelegate> gestureDelegate;


@property(nonatomic,assign) int ratio;




@end
