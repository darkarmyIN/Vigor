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
    NSArray *programDesc;
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
    
    programNames = @[@"Insanity Workout",
                     @"Greek God Program",
                     @"Vesuvius Regimen",
                     @"Hercules Task Marathon",
                     @"Sorte Workout",
                     @"Warrior Body",
                     @"Superhero Workout",
                     @"Guns Like Wahlberg",
                     @"Terry Crews Regimen",
                     @"Saiyan Gym Training"];
    
    programDesc = @[@"Be very sure you can handle this.",
                    @"Get the body of Thor.",
                    @"You want those abs, don't you?",
                    @"This task is not for mortal humans",
                    @"This workout is not for normal people.",
                    @"Train like you have to fight Superman",
                    @"Even Bruce Wayne follows this workout",
                    @"Get guns like Mark Wahlberg",
                    @"Be ripped like Crews",
                    @"Prepare for the next martial arts tournament."];
	
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
    cell.programImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%li", ((indexPath.row)%8+1)]];
    cell.programNameLabel.text = [NSString stringWithFormat:@"%@", [programNames objectAtIndex:indexPath.row]];
    cell.programDescriptionLabel.text = [programDesc objectAtIndex:indexPath.row];
	
	if ([[NSString stringWithFormat:@"%@", [programNames objectAtIndex:indexPath.row]] isEqualToString:[[NSUserDefaults standardUserDefaults] objectForKey:@"CurrentProgram"]])
		cell.accessoryType = UITableViewCellAccessoryCheckmark;
	else
		cell.accessoryType = UITableViewCellAccessoryNone;
	
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[[NSUserDefaults standardUserDefaults] setObject:[programNames objectAtIndex:indexPath.row] forKey:@"CurrentProgram"];
    if (![[NSUserDefaults standardUserDefaults] objectForKey:[NSString stringWithFormat:@"%@", [programNames objectAtIndex:indexPath.row]]])
    {
        [[NSUserDefaults standardUserDefaults] setObject:[NSDate date] forKey:[NSString stringWithFormat:@"%@", [programNames objectAtIndex:indexPath.row]]];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
	[self.navigationController popViewControllerAnimated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 60.f;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [[UIView alloc] initWithFrame:CGRectZero];
}

@end
