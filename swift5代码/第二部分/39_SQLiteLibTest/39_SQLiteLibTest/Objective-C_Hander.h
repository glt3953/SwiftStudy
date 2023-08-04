//
//  Objective-C_Hander.h
//  39_SQLiteLibTest
//
//  Created by 珲少 on 2021/2/9.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface Objective_C_Hander : NSObject

//创建一个执行非查询语句的方法
+(void)runNormalSql:(NSString *)sqlString;
//创建一个查询数据的方法
+(void)selectSql;

@end

