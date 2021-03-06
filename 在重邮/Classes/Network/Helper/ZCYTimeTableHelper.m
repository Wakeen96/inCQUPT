//
//  ZCYTimeTableHelper.m
//  在重邮
//
//  Created by 周维康 on 16/10/26.
//  Copyright © 2016年 周维康. All rights reserved.
//

#import "ZCYTimeTableHelper.h"
#import "ZCYTimeTableModel.h"
#import "YYModel.h"

@implementation ZCYTimeTableHelper

+ (void)getTimeTableWithStdNumber:(NSString *)studentNumber shouldSaveTime:(BOOL)shouldSave  withCompeletionBlock:(void (^)(NSError *, NSArray *))compeletionBlock
{
    //存放课表数组初始化
    NSMutableArray *weekArray = [[NSMutableArray alloc] initWithCapacity:7];
    for (NSInteger i = 0; i < 7; i++)
    {
        NSMutableArray <NSMutableArray *>*courseArray = [[NSMutableArray alloc] initWithCapacity:6];
        [weekArray addObject:courseArray];
        for (NSInteger j = 0; j < 6; j++)
        {
            NSMutableArray *detailArray = [NSMutableArray array];
            [weekArray[i] addObject:detailArray];
        }
    }
    
    [[ZCYNetworkHelperMgr sharedMgr] requestWithData:@{@"id" : studentNumber} andCompletionBlock:^(NSError *error, id response, NSURLSessionDataTask *task) {
        NSArray *timeTableArray = response[@"data"][@"lessons"];
        if (error)
        {
            DDLogError(@"%@", error);
            compeletionBlock(error, nil);
            return;
        }
       
       
            dispatch_async(dispatch_get_main_queue(), ^{
                
                if (shouldSave)
                {
                    [ZCYUserMgr sharedMgr].shcoolWeek = [response[@"data"][@"week"] integerValue];
                }
            });
            
            for (NSInteger i = 0; i < 7; i++)
            {
                
                NSMutableArray *mutableArray = timeTableArray[i]; //上课节数,周数不同
                for (NSInteger j = 0; j < 6; j++)
                {
                    NSArray *courseArray = mutableArray[j]; //取出不同周数的课程;
                    for (NSDictionary *courseDic  in courseArray)
                    {
                        ZCYTimeTableModel *model = [[ZCYTimeTableModel alloc] init];
                        [model yy_modelSetWithDictionary:courseDic];
                        
                        if (!([model.courseName  isEqual: @""] || model.courseName == nil))
                        {
                            [weekArray[i][j] addObject:model];
                        }
                    }
                }
            }
        
        if (compeletionBlock)
        {
            compeletionBlock(nil, weekArray);
        }
    } andURLPath:@"/api/get_kebiao.php"];
}
@end
