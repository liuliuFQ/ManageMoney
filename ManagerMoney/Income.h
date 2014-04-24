//
//  Income.h
//  ManagerMoney
//
//  Created by BRUCE LAU on 14-4-24.
//  Copyright (c) 2014年 BRUCE LAU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Income : NSManagedObject

@property (nonatomic, retain) NSString * category;
@property (nonatomic, retain) NSNumber * money;
@property (nonatomic, retain) NSDate * date;

@end
