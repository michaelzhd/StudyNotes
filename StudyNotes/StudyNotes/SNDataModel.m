//
//  SNDataModel.m
//  Python StudyNotes
//
//  Created by Michael Dong on 12/27/13.
//  Copyright (c) 2013 Michael Dong. All rights reserved.
//

#import "SNDataModel.h"

@implementation SNDataModel



+(id)configDataParser
{

    NSString *plistPath =[[NSBundle mainBundle]  pathForResource:@"NoteList" ofType:@"plist"];
    NSDictionary *plistDict =[NSDictionary dictionaryWithContentsOfFile:plistPath];
    return plistDict;

}



@end
