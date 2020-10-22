//
//  ObjectiveC_Hander.h
//  SwiftStudy
//
//  Created by guoliting on 2020/10/22.
//  Copyright © 2020 guoliting. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

NS_ASSUME_NONNULL_BEGIN

@interface ObjectiveC_Hander : NSObject

+ (void)runNormalSql:(NSString *)sqlString;
+ (void)selectSql;

@end

NS_ASSUME_NONNULL_END
