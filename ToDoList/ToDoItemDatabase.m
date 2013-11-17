//
//  ToDoItemDatabase.m
//  ToDoList
//
//  Created by uzero on 13-11-18.
//  Copyright (c) 2013年 net.uzero. All rights reserved.
//

#import "ToDoItemDatabase.h"
#import "ToDoItem.h"

NSString *NAMESID = @"TODOITEMNAMES";
NSString *COMPLETIONSID = @"COMPLETIONS";

@interface ToDoItemDatabase()
@property NSUserDefaults *defaultUser;
@end

@implementation ToDoItemDatabase
- (void) writeBack:(NSMutableArray *)array atKey :(NSString *)key{
    [self.defaultUser removeObjectForKey: key];
    [self.defaultUser setObject: array forKey: key];
    [self.defaultUser synchronize];
}

- (ToDoItemDatabase *)init
{
    NSMutableArray *names;
    NSMutableArray *completions;

    if (self.defaultUser == nil) {
        self.defaultUser = [NSUserDefaults standardUserDefaults];
    }

    NSArray *immutableNameList = [self.defaultUser objectForKey: NAMESID];
    if(immutableNameList == nil){
        names = [[NSMutableArray alloc] init];
        [self.defaultUser setObject:names forKey:NAMESID];
    }
    
    NSArray *immutableCompletionList = [self.defaultUser objectForKey:COMPLETIONSID];
    if(immutableCompletionList == nil){
        completions = [[NSMutableArray alloc] init];
        [self.defaultUser setObject:completions forKey:COMPLETIONSID];
    }

    return self;
}

- (NSMutableArray *)getToDoItemListFromUserDefault:(NSString *)key
{
    NSMutableArray *list;
    
    NSArray *immutableList = [self.defaultUser objectForKey: key];
    list = [NSMutableArray arrayWithArray: immutableList];
    
    return list;
}

- (void)insertItem:(ToDoItem *)item
{
    NSMutableArray *toDoItems;
    NSMutableArray *completions;
    
    toDoItems = [self getToDoItemListFromUserDefault:NAMESID];
    completions = [self getToDoItemListFromUserDefault:COMPLETIONSID];
    
    [toDoItems addObject: item.itemName];
    [completions addObject: item.completed];
    
    [self writeBack: toDoItems atKey:NAMESID];
    [self writeBack: completions atKey:COMPLETIONSID];
}
- (void)deleteItem:(ToDoItem *)item
{
    NSMutableArray *toDoItems;
    NSMutableArray *completions;
    
    toDoItems = [self getToDoItemListFromUserDefault:NAMESID];
    completions = [self getToDoItemListFromUserDefault:COMPLETIONSID];
    
    [toDoItems removeObjectAtIndex: item.index];
    [completions removeObjectAtIndex: item.index];
    
    [self writeBack: toDoItems atKey:NAMESID];
    [self writeBack: completions atKey:COMPLETIONSID];
}

- (void)updateItem:(ToDoItem *)item
{
    NSMutableArray *completions;
    
    completions = [self getToDoItemListFromUserDefault:COMPLETIONSID];
    [completions setObject: item.completed atIndexedSubscript: item.index];
    [self writeBack: completions atKey: COMPLETIONSID];
}

- (NSUInteger)countObjectInUserDefault
{
    NSMutableArray *list = [self getToDoItemListFromUserDefault:NAMESID];
    return [list count];
}

- (ToDoItem *)getItemAtIndex:(NSUInteger)index {
    ToDoItem *item = [[ToDoItem alloc] init];
    
    NSArray *immutableToDoItems = [self getToDoItemListFromUserDefault:NAMESID];
    NSArray *immutableCompletions = [self getToDoItemListFromUserDefault:COMPLETIONSID];
    item.itemName = immutableToDoItems[index];
    item.completed = immutableCompletions[index];
    return item;
}

@end
