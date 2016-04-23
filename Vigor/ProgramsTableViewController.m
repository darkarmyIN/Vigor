//
//  ProgramsTableViewController.m
//  Vigor
//
//  Created by YASH on 24/04/16.
//  Copyright © 2016 Dark Army. All rights reserved.
//

#import "ProgramsTableViewController.h"

@interface ProgramsTableViewController ()
{
    NSArray *programNames;
}

@end

@implementation ProgramsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    programNames = @[@"Insanity Workout", @"Greek God Program", @"Vesuvius Regimen", @"Hercules Task Marathon", @"Sorte Workout"];
	
	self.tableView.rowHeight = UITableViewAutomaticDimension;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [programNames count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"Cell";
    ProgramNamesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ProgramName" owner:self options:nil];
    cell = [nib objectAtIndex:0];
    if (cell == nil)
    {
        cell = [[ProgramNamesTableViewCell alloc] init];
    }
    cell.programImage = nil;
    cell.programNameLabel.text = [NSString stringWithFormat:@"%@", [programNames objectAtIndex:indexPath.row]];
    cell.programDescriptionLabel.text = [NSString stringWithFormat:@"SORTE WTF times %li", (long) indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[[NSUserDefaults standardUserDefaults] setObject:[programNames objectAtIndex:indexPath.row] forKey:@"CurrentProgram"];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
	[self.navigationController popViewControllerAnimated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 60.f;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [[UIView alloc] initWithFrame:CGRectZero];
}

@end
