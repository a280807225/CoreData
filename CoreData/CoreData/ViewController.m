//
//  ViewController.m
//  CoreData
//
//  Created by dllo on 16/7/5.
//  Copyright © 2016年 敲代码好开心啊. All rights reserved.
//

#import "ViewController.h"
#import "CoreDataManager.h"

@interface ViewController ()
/**  存放查询结果*/
@property(nonatomic,retain)NSMutableArray *dataSource;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)idsert:(id)sender {
    //获取实体描述:
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Student" inManagedObjectContext:[[CoreDataManager shareMannager] managedObjectContext]];
    //创建对象:
    Student *stu = [[Student alloc]initWithEntity:entity insertIntoManagedObjectContext:[[CoreDataManager shareMannager] managedObjectContext]];
    stu.name = @"瑞文";
    stu.age = @13;
    stu.store = @99;
    //存储
    [[CoreDataManager shareMannager]saveContext];
    
    //打印地址  显示数据库路径
    NSLog(@"%@",[[CoreDataManager shareMannager]applicationDocumentsDirectory]);
    
    
}
- (IBAction)delete:(id)sender {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Student"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name = '瑞文'"];
    fetchRequest.predicate = predicate;
    
    //错误信息
    NSError *error = nil;
    //查询符合条件的对象
    NSArray *array = [[[CoreDataManager shareMannager]managedObjectContext]executeFetchRequest:fetchRequest error:&error];
    if (array == nil) {
        NSLog(@"查询失败");
    }else{
        NSLog(@"查询成功");
        for (Student *stu in array) {
            [[[CoreDataManager shareMannager]managedObjectContext]deleteObject:stu];
            
        }
        
    }
    //保存操作
    [[CoreDataManager shareMannager]saveContext];
    
}
- (IBAction)update:(id)sender {
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Student"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name = '瑞文'"];
    fetchRequest.predicate = predicate;
    
    //查询出符合条件的对象进行修改
    NSArray *array = [[[CoreDataManager shareMannager]managedObjectContext]executeFetchRequest:fetchRequest error:nil];
    if (array == nil) {
        NSLog(@"查询失败");
    }else{
        NSLog(@"查询失败");
        for (Student *stu in array) {
            stu.age = @85;
        }
        
    }
    //保存操作
    [[CoreDataManager shareMannager]saveContext];
    
    
    
}
- (IBAction)select:(id)sender {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Student"];
    //设置谓词(查询条件)
    NSPredicate *preducate = [NSPredicate predicateWithFormat:@"name = '德玛'"];

    fetchRequest.predicate = preducate;
    //设置查询结果的排序:参数一表示按照什么属性排序，参数二表示是否升序
    NSSortDescriptor *sortDisctiptor = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    //字面量创建的数组是不可变的
    [fetchRequest setSortDescriptors:@[sortDisctiptor]];
    
    
    //执行查询
    NSArray *array = [[[CoreDataManager shareMannager]managedObjectContext]executeFetchRequest:fetchRequest error:nil];
    if (array == nil) {
        NSLog(@"查询失败");
    }else{
        NSLog(@"查询成功");
        
        for (Student *stu in array) {
            NSLog(@"%@ - %@ - %@",stu.name,stu.age,stu.store);
        }
        
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
