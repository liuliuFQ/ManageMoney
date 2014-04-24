//
//  UILabel+AutoSize.m
//  BruceLau
//
//  Created by BRUCE LAU on 14-4-9.
//  Copyright (c) 2014年 BRUCE LAU. All rights reserved.
//

#import "UILabel+AutoSize.h"

@implementation UILabel (AutoSize)

-(CGRect)MatchedRect{
    self.numberOfLines=0;
    return [self.text boundingRectWithSize:CGSizeMake(300, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: self.font} context:nil];
}
-(void)setFrame4LabelWithorigin:(CGPoint)o{
    CGRect r=[self MatchedRect];
    [self setFrame:CGRectMake(o.x, o.y, r.size.width, r.size.height)];
}
@end
