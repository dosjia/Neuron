//
//  CBAccountController.m
//  Neuron
//
//  Created by 赵 佳 on 13-7-19.
//  Copyright (c) 2013年 赵 佳. All rights reserved.
//

#import "CBAccountController.h"
#import "CBAccount.h"
#import "LoginController.h"
#import "CBAccountDetailControllerViewController.h"

@implementation CBAccountController

@synthesize accountList;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self setTitle:@"Account List"];
        CBAccount *account1=[[CBAccount alloc]init];
        account1.description=@"Time Deposite Account";
        account1.currencyCode=@"SGD";
        account1.accountNo=@"0157192830198371";
        account1.amount=[NSNumber numberWithFloat:1000.34];
        account1.productCode=@"DDA-302";
        CBAccount *account2=[[CBAccount alloc]init];
        account2.description=@"Call Deposite Account";
        account2.currencyCode=@"USD";
        account2.accountNo=@"0157622643002463";
        account2.amount=[NSNumber numberWithFloat:1000000.94];
        account2.productCode=@"DDA-405";
        NSMutableArray *ddaArray=[NSMutableArray arrayWithObjects:account1,account2, nil];
        CBAccount *account3=[[CBAccount alloc]init];
        account3.description=@"Gold Manhattan Card";
        account3.currencyCode=@"SGD";
        account3.accountNo=@"0157192830198371";
        account3.amount=[NSNumber numberWithFloat:1078.34];
        account3.productCode=@"MNT-123";
        CBAccount *account4=[[CBAccount alloc]init];
        account4.description=@"Visa Infinite Card";
        account4.currencyCode=@"SGD";
        account4.accountNo=@"6003912103689897";
        account4.amount=[NSNumber numberWithFloat:1098127.94];
        account4.productCode=@"CCA-405";
        NSMutableArray *ccaArray=[NSMutableArray arrayWithObjects:account3,account4, nil];
        
        accountList=[NSMutableArray arrayWithObjects:ddaArray,ccaArray, nil];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger) tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section{
    return [[accountList objectAtIndex:section] count];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [accountList count];
    
}
-(NSString*)tableView:(UITableView*)tableView titleForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return @"Current/Saving Account";
    }else if (section==1){
        return @"Credit Card Account";
    }else{
        return @"Other Account";
    }
}

-(UITableViewCell*) tableView:(UITableView*) tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"get the cell!");
    static NSString* identifier = @"account-list";
    UITableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if(nil==cell){
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        cell.textLabel.text=((CBAccount*)[[accountList objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]).description;
        cell.detailTextLabel.text=((CBAccount*)[[accountList objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]).accountNo;
        cell.accessoryType=UITableViewCellAccessoryDetailDisclosureButton;
//        if(((CBMail*)[[mailList objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]).isRead){
//            UIImage *image = [UIImage imageNamed:@"mail.PNG"];
//            cell.imageView.image = image;
//        }else {
//            UIImage *image = [UIImage imageNamed:@"mail.PNG"];
//            cell.imageView.image = image;
//        }
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    CBAccountDetailControllerViewController *accountDetailController = [[CBAccountDetailControllerViewController alloc] initAccount:[[accountList objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]];
	[self.navigationController pushViewController:accountDetailController animated:YES];
    
}
@end
