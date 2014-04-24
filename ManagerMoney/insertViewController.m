//
//  insertViewController.m
//  ManagerMoney
//
//  Created by BRUCE LAU on 14-4-23.
//  Copyright (c) 2014年 BRUCE LAU. All rights reserved.
//

#import "insertViewController.h"
#import "SDSegmentedControl.h"
#import "BLViewController.h"
#import "UILabel+AutoSize.h"
#import "Income.h"
#import "Expend.h"
@interface insertViewController ()<UITextFieldDelegate>

@end

@implementation insertViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor clearColor]];
    self.label11=[[UILabel alloc]init];
    self.label11.text=@"金额";
    [self.label11 setFrame4LabelWithorigin:CGPointMake(40, 140)];
    
    self.label21=[[UILabel alloc]init];
    self.label21.text=@"类别";
    [self.label21 setFrame4LabelWithorigin:CGPointMake(40, 180)];
    
    self.textField12=[[UITextField alloc]initWithFrame:CGRectMake(110, 135, 130, 30)];
    self.textField12.borderStyle=UITextBorderStyleRoundedRect;
    self.textField12.keyboardType=UIKeyboardTypeNumberPad;
    self.textField12.delegate=self;
    
    self.textField22=[[UITextField alloc]initWithFrame:CGRectMake(110, 175, 130, 30)];
    self.textField22.borderStyle=UITextBorderStyleRoundedRect;
    self.textField22.delegate=self;
    
    UIBarButtonItem *saveButton=[[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStyleBordered target:self action:@selector(showModel)];
    self.navigationItem.rightBarButtonItem=saveButton;
    
    [self.view addSubview:self.label11];
    [self.view addSubview:self.label21];
    [self.view addSubview:self.textField12];
    [self.view addSubview:self.textField22];
    
    //添加SegmentControl
    NSArray *segment=[[NSArray alloc]initWithObjects:@"收入",@"支出",nil];
    self.mySegment=[[UISegmentedControl alloc]initWithItems:segment];
    self.mySegment.frame=CGRectMake(80, 80, 160, 25);
    self.mySegment.tintColor=[UIColor purpleColor];
    [self.mySegment addTarget:self action:@selector(changeLabel) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.mySegment];
    //添加自定义键盘
    self.pickerView=[[UIPickerView alloc]initWithFrame:CGRectMake(0, -200, 230, 160)];
    self.pickerView.dataSource=self;
    self.pickerView.delegate=self;
    self.textField22.inputView=self.pickerView;
    [self pickerDatas];
    [self.view addSubview:self.pickerView];
   
    
}
/**
 *  存储记录
 */
-(void)addMoneyRecode{
    Income * incomeF =[Income MR_createEntity];
    incomeF.money = @600;
    incomeF.category = @"123";
    [[NSManagedObjectContext MR_defaultContext]MR_saveToPersistentStoreAndWait];
    
    
}
#pragma mark-UIPickerViewDataSource代理方法
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}


- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    return [self.arr objectAtIndex:row];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [self.arr count];
}

-(void)pickerDatas{
    self.arr=[[NSMutableArray alloc]initWithObjects:@"工资",@"红利",@"卖艺",@"耍猴",nil];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    self.textField22.text=[self.arr objectAtIndex:row];
}
-(void)changeLabel{
    if (self.mySegment.selectedSegmentIndex==0) {
        self.label11.text=@"收入";
    }else if(self.mySegment.selectedSegmentIndex==1){
    self.label11.text=[NSString stringWithFormat:@"支出"];
    }
}

-(void)showModel{
   
   
    

    if (self.mySegment.selectedSegmentIndex == 1){
        Expend * ex = [Expend MR_createEntity];
        ex.money =[NSNumber numberWithFloat:[self.textField12.text integerValue]] ;
        ex.category = self.textField22.text;
        ex.data = [NSData data];

        
    
    }else{
         NSLog(@"hah");
    Income * incomeF =[Income MR_createEntity];
    incomeF.money = [NSNumber numberWithFloat:[self.textField12.text integerValue]] ;
    incomeF.category = self.textField22.text;
    incomeF.date = [NSDate date];
    }
    
   [[NSManagedObjectContext MR_defaultContext]MR_saveToPersistentStoreAndWait];

    
}

#pragma mark--UITextFieldDelegate代理方法

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField==self.textField12) {
        [textField resignFirstResponder];
    }else if (textField==self.textField22){
        [self.textField22 resignFirstResponder];
    }
    return YES;
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
