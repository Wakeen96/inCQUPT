//
//  ZCYUserMgr.h
//  在重邮
//
//  Created by 周维康 on 16/10/26.
//  Copyright © 2016年 周维康. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZCYUserMgr : NSObject

@property (strong, nonatomic) NSString *studentNumber;  /**< 学号 */
@property (strong, nonatomic) NSArray *courseArray;  /**< 课程总述 */
@property (strong, nonatomic) NSString *schoolName;  /**< 学校名称 */
@property (strong, nonatomic) NSString *userName;  /**< 用户名称 */
@property (strong, nonatomic) NSString *eduType;  /**< 教育水平（本科生、研究生） */
@property (strong, nonatomic) NSString *eduMajor;  /**< 专业 */
@property (strong, nonatomic) NSDictionary *lendBookDic;  /**< 借阅信息 */
@property (strong, nonatomic) NSArray *examRecord;  /**< 考试安排 */

+ (ZCYUserMgr *)sharedMgr;

@end
