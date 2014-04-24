//
//  incomeViewController.m
//  ManagerMoney
//
//  Created by BRUCE LAU on 14-4-23.
//  Copyright (c) 2014年 BRUCE LAU. All rights reserved.
//

#import "incomeViewController.h"
#import "insertViewController.h"
#import "UILabel+AutoSize.h"
#import "MyCell.h"
#import "MyCell2.h"
#import "Income.h"
#import "Expend.h"
@interface incomeViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation incomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title=@"个人理财";
    self.tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    [self.view addSubview:self.tableView];
    
}
#pragma mark--数据库处理
/**
 *  查找
 */
-(void)findMoney{
    NSArray * incomeArray = [Income MR_findAll];
    Income * incomeM = [Income MR_findFirst];
    NSLog(@"-----%s----%@---%@",__FUNCTION__,incomeArray,incomeM);
    
}
/**
 *  存储记录
 */
-(void)addMoneyRecode{
    Income * incomeF =[Income MR_createEntity];
    incomeF.money = @600;
    incomeF.category = @"";
    [[NSManagedObjectContext MR_defaultContext]MR_saveOnlySelfAndWait];
    
    
}
/**
 *  更新记录
 */
//-(void)updateMoney{
//Income * incomeM = [Income MR_findFirstByAttribute:<#(NSString *)#> withValue:<#(id)#>];
//   incomeM.money = @600;
//      [[NSManagedObjectContext MR_defaultContext]MR_saveOnlySelfAndWait];
//
//
//}
/**
 *  删除记录
 */
//-(void)deleteMoney{
//Income * incomeM = [Income MR_findFirstByAttribute:<#(NSString *)#> withValue:<#(id)#>];
//    [incomeM MR_deleteEntity];
//      [[NSManagedObjectContext MR_defaultContext]MR_saveOnlySelfAndWait];
//
//
//}

#pragma mark-UITableViewDataSource代理方法

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 1;
    }else if (section==1){
        return 1;
    }else if (section==2){
        return 4;
    }
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        static NSString *identifier=@"123";
        MyCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell=[[MyCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.label11.text=@"收入总额:";
        [cell.label11 setFrame4LabelWithorigin:CGPointMake(10, 10)];
        cell.label21.text=@"支出总额:";
        [cell.label21 setFrame4LabelWithorigin:CGPointMake(10, 45)];
        return cell;
    }else if (indexPath.section==1){
        static NSString *identifier1=@"456";
        UITableViewCell *cell1=[tableView dequeueReusableCellWithIdentifier:identifier1];
        if (!cell1) {
            cell1=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier1];
        }
        cell1.textLabel.text=@"记一记";
        cell1.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        cell1.textLabel.font=[UIFont fontWithName:nil size:21];
        cell1.textLabel.textAlignment=NSTextAlignmentCenter;
        cell1.textLabel.textColor=[UIColor orangeColor];
        return cell1;
    }else if (indexPath.section==2){
        static NSString *identifier2=@"789";
        MyCell2 *cell2=[tableView dequeueReusableCellWithIdentifier:identifier2];
        if (!cell2) {
            cell2=[[MyCell2 alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier2];
        }
        cell2.ImageView.image=[UIImage imageNamed:@"sync_notice_laugh_icon"];
        cell2.MyLabel.text=@"刘阳";
        [cell2.MyLabel setFrame4LabelWithorigin:CGPointMake(60, 15)];
        cell2.incomeLabel.text=@"12元";
        [cell2.incomeLabel setFrame4LabelWithorigin:CGPointMake(270, 10)];
        cell2.payLabel.text=@"100元";
        [cell2.payLabel setFrame4LabelWithorigin:CGPointMake(270, 30)];
        return cell2;
    }
    return nil;
}

#pragma mark--UITableViewDelegate代理方法

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return 80;
    }else if (indexPath.section==1){
        return 40;
    }else if (indexPath.section==2){
        return 50;
    }
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==1) {
        insertViewController *insertVC=[[insertViewController alloc]init];

        [self.navigationController pushViewController:insertVC animated:YES];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
