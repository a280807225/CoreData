//
//  Student+CoreDataProperties.h
//  CoreData
//
//  Created by dllo on 16/7/5.
//  Copyright © 2016年 敲代码好开心啊. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Student.h"

NS_ASSUME_NONNULL_BEGIN

@interface Student (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSNumber *age;
@property (nullable, nonatomic, retain) NSNumber *store;

@end

NS_ASSUME_NONNULL_END
