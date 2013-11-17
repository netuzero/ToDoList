//
//  ToDoItem.m
//  ToDoList
//
//  Created by uzero on 13-11-17.
//  Copyright (c) 2013年 net.uzero. All rights reserved.
//

#import "ToDoItem.h"

//
//  ToDoItem.m
//  HelloWorld
//
//  Created by uzero on 13-11-11.
//  Copyright (c) 2013年 net.uzero. All rights reserved.
//

#import "ToDoItem.h"

@interface ToDoItem ()
@property NSDate *completionDate;
@end

@implementation ToDoItem

- (void)markAsCompleted: (NSString *)isCompleted
{
    if ([isCompleted isEqualToString: @"Yes"]) {
        self.completed = isCompleted;
        [self setCompletionDate];
    }
}

- (void) setCompletionDate {
    if ([self.completed isEqualToString: @"Yes"]) {
        self.completionDate = [NSDate date];
    } else {
        self.completionDate = nil;
    }
}

@end

