//
//  ToDoItemDatabase.h
//  ToDoList
//
//  Created by uzero on 13-11-18.
//  Copyright (c) 2013年 net.uzero. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ToDoItem.h"

@interface ToDoItemDatabase : NSObject
- (void)insertItem:(ToDoItem *)item;
- (void)deleteItem:(ToDoItem *)item;
- (void)updateItem:(ToDoItem *)item;
- (NSUInteger)countObjectInUserDefault;
- (ToDoItem *)getItemAtIndex:(NSUInteger)index;
@end
