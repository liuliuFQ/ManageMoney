//
//  MyCell2.m
//  ManagerMoney
//
//  Created by BRUCE LAU on 14-4-23.
//  Copyright (c) 2014年 BRUCE LAU. All rights reserved.
//

#import "MyCell2.h"

@implementation MyCell2

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.ImageView=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 35, 35)];
        [self.contentView addSubview:self.ImageView];
        
        self.MyLabel=[[UILabel alloc]init];
        self.MyLabel.font=[UIFont fontWithName:nil size:20];
        [self.contentView addSubview:self.MyLabel];
        
        self.incomeLabel=[[UILabel alloc]init];
        self.incomeLabel.textColor=[UIColor greenColor];
        self.incomeLabel.font=[UIFont fontWithName:nil size:13];
        [self.contentView addSubview:self.incomeLabel];
        
        self.payLabel=[[UILabel alloc]init];
        self.payLabel.font=[UIFont fontWithName:nil size:13];
        self.payLabel.textColor=[UIColor redColor];
        [self.contentView addSubview:self.payLabel];
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
