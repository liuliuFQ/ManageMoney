//
//  MyCell.m
//  ManagerMoney
//
//  Created by BRUCE LAU on 14-4-23.
//  Copyright (c) 2014年 BRUCE LAU. All rights reserved.
//

#import "MyCell.h"
#import "Income.h"
#import "Expend.h"
@implementation MyCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{    Income * incomeM = [[Income MR_findAllSortedBy:@"money" ascending:YES] lastObject];
    Expend * ex = [Expend MR_findFirst];
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.label11=[[UILabel alloc]init];
        self.label11.text=@"收入总额";
        self.label11.font=[UIFont fontWithName:nil size:19];
        self.label11.textColor=[UIColor purpleColor];
        [self.contentView addSubview:self.label11];
        
        self.label12=[[UILabel alloc]init];
       
        self.label12.font=[UIFont fontWithName:nil size:15];
        self.label12.textColor=[UIColor greenColor];
        self.label12.text = [incomeM.money stringValue];
        [self.contentView addSubview:self.label12];
        
        self.label21=[[UILabel alloc]init];
        self.label21.text=@"支出总额";
        self.label21.font=[UIFont fontWithName:nil size:19];
        self.label21.textColor=[UIColor purpleColor];
        [self.contentView addSubview:self.label21];
        
        self.label22=[[UILabel alloc]init];
        self.label22.font=[UIFont fontWithName:nil size:15];
        self.label22.textColor=[UIColor redColor];
        self.label22.text = [ex.money stringValue];
        [self.contentView addSubview:self.label22];
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
