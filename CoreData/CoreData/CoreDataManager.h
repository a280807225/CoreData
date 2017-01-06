//
//  CoreDataManager.h
//  CoreData
//
//  Created by dllo on 16/7/5.
//  Copyright © 2016年 敲代码好开心啊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#import "Student.h"

@interface CoreDataManager : NSObject

/** 单例方法 获取唯一的对象*/
+(CoreDataManager *)shareMannager;

/** 数据操作类，进行具体的增删改查 */
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
/** 数据模型类，类似于数据库里的表*/
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
/** 数据连接器，负责对象和数据存储区域的链接*/
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

/** 保存操作*/
- (void)saveContext;
/** 返回存储路径*/
- (NSURL *)applicationDocumentsDirectory;

@end
