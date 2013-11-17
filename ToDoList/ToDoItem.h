//
//  ToDoItem.h
//  ToDoList
//
//  Created by uzero on 13-11-17.
//  Copyright (c) 2013年 net.uzero. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoItem : NSObject

@property NSString *itemName;
@property NSString *completed;
@property NSUInteger index;
@property (readonly) NSDate *createDate;
- (void)markAsCompleted: (NSNumber *)isCompleted;

@end
