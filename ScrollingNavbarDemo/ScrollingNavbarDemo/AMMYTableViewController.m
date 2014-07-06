//
//  AMMYTableViewController.m
//  ScrollingNavbarDemo
//
//  Created by Ron on 6/7/14.
//  Copyright (c) 2014 Andrea Mazzini. All rights reserved.
//

#import "AMMYTableViewController.h"
#import "UIViewController+ScrollingNavbar.h"

@interface AMMYTableViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) NSArray* data;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) UIView *headView;
@property (strong, nonatomic) UIView *sectionheadView;

@end

@implementation AMMYTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.data = @[@"Awesome content", @"Great content", @"Amazing content", @"Ludicrous content", @"Awesome content", @"Great content", @"Amazing content", @"Ludicrous content", @"Awesome content", @"Great content", @"Amazing content", @"Ludicrous content", @"Awesome content", @"Great content", @"Amazing content", @"Ludicrous content"];
	
	if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
		self.edgesForExtendedLayout = UIRectEdgeNone;
	}
    
    self.tableView.tableHeaderView = self.headView;
    
	// Just call this line to enable the scrolling navbar
	[self followScrollView:self.tableView];
    
    [self setHeadViewHeight:self.headView.frame.size.height];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView*)headView{
    if(!_headView){
        _headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 100)];
        _headView.backgroundColor = [UIColor orangeColor];
    }
    return _headView;
}

- (UIView*)sectionheadView{
    if(!_sectionheadView){
        _sectionheadView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 50)];
        _sectionheadView.backgroundColor = [UIColor blueColor];
    }
    return _sectionheadView;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [self.data count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"Identifier"];
	if (!cell) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Identifier"];
	}
	
	cell.textLabel.text = self.data[indexPath.row];
	
	return cell;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return self.sectionheadView;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
