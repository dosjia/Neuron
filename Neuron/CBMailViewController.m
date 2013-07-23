//
//  CBMailViewController.m
//  Neuron
//
//  Created by 赵 佳 on 13-7-19.
//  Copyright (c) 2013年 赵 佳. All rights reserved.
//

#import "CBMailViewController.h"
#import "CBMail.h"
#import "CBMailContentViewController.h"

@implementation CBMailViewController

@synthesize mailList,tableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self setTitle:@"Mail List"];
        CBMail *mail1=[[CBMail alloc] initWithRead:NO mailTitle:@"Fund Transfer Fail" mailContent:@"Your transfer is fail!" date:[[NSDate alloc] init]];
        CBMail *mail2=[[CBMail alloc] initWithRead:NO mailTitle:@"Fund Transfer Fail" mailContent:@"Your transfer is fail!" date:[[NSDate alloc] init]];
        NSMutableArray *day1=[NSMutableArray arrayWithObjects:mail1,mail2, nil];
        
        NSDate *yesterday=[NSDate dateWithTimeIntervalSinceNow: -(24*60*60)];
        CBMail *mail3=[[CBMail alloc] initWithRead:NO mailTitle:@"Withdraw successfull!" mailContent:@"Your withdraw is successfull!" date:yesterday];
        CBMail *mail4=[[CBMail alloc] initWithRead:NO mailTitle:@"Fund Transfer successfull" mailContent:@"Your transfer is successfull!" date:yesterday];
        NSMutableArray *day2=[NSMutableArray arrayWithObjects:mail3,mail4, nil];
        mailList=[NSMutableArray arrayWithObjects:day1,day2, nil];
        UIBarButtonItem *editButton=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editButtonPressed)];
        self.navigationItem.rightBarButtonItem=editButton;
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
    NSLog(@"get count in section. %d",[[mailList objectAtIndex:section] count]);
    return [[mailList objectAtIndex:section] count];
}
-(UITableViewCell*) tableView:(UITableView*) tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"get the cell!");
    static NSString* identifier = @"mail-list";
    UITableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if(nil==cell){
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        cell.textLabel.text=((CBMail*)[[mailList objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]).title;
        cell.detailTextLabel.text=((CBMail*)[[mailList objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]).content;
        cell.accessoryType=UITableViewCellAccessoryDetailDisclosureButton;
        if(((CBMail*)[[mailList objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]).isRead){
            UIImage *image = [UIImage imageNamed:@"mail.PNG"];
            cell.imageView.image = image;
        }else {
            UIImage *image = [UIImage imageNamed:@"mail.PNG"];
            cell.imageView.image = image;
        }
    }
    
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSLog(@"Get group count! %d", [mailList count]);
    return [mailList count];
    
}
-(NSString*)tableView:(UITableView*)tableView titleForHeaderInSection:(NSInteger)section{
    NSLog(@"Get header! %@",[[[mailList objectAtIndex:section] objectAtIndex:0] date]);
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *currentDateStr = [dateFormatter stringFromDate:[[[mailList objectAtIndex:section] objectAtIndex:0] date]];
    //return [[@"%@",[[mailList objectAtIndex:section] objectAtIndex:0] date] ];
    return currentDateStr;
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//	CBMailContentViewController *mailContentController = [[CBMailContentViewController alloc] initWithNibName:@"CBMailContentViewController" bundle:nil];
//    mailContentController.title = @"Mail Content";
//    mailContentController.mail= [[mailList objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
//	[self.navigationController pushViewController:mailContentController animated:YES];
//    
//}

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    CBMailContentViewController *mailContentController = [[CBMailContentViewController alloc] initMail:[[mailList objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]];
    mailContentController.title = @"Mail Content";
    //mailContentController.mail= [[mailList objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
	[self.navigationController pushViewController:mailContentController animated:YES];

}

-(void) editButtonPressed{
    NSLog(@"edit pressed");
    [tableView setEditing:YES animated:YES];
}
-(void) tableView:(UITableView*)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if(editingStyle==UITableViewCellEditingStyleDelete){
        //CBMail *mailTemp=[[mailList objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
        //[mailList removeObjectAtIndex:indexPath.section];
        [[mailList objectAtIndex:indexPath.section] removeObjectAtIndex:indexPath.row];
        NSLog(@"+++++%d",[mailList count]);
        NSLog(@"=====%d",[[mailList objectAtIndex:indexPath.section] count]);
        if([[mailList objectAtIndex:indexPath.section] count]==0){
            [mailList removeObjectAtIndex:indexPath.section];
        }
        
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationFade];
        [tableView reloadData];
        [tableView setEditing:NO];
    }
}
@end
