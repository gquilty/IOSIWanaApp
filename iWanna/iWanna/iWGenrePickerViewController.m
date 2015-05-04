//
//  iWGenrePickerViewController.m
//  iWanna
//
//  Created by Gavin Quilty on 08/11/2013.
//  Copyright (c) 2013 Gavin Quilty. All rights reserved.
//

#import "iWGenrePickerViewController.h"

@interface iWGenrePickerViewController ()

@end

@implementation iWGenrePickerViewController

{
	NSArray *genres;
	NSUInteger selectedIndex;
}
@synthesize delegate;
@synthesize genre;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	genres = [NSArray arrayWithObjects:
             @"Rock",
             @"R&B",
             @"Pop",
             @"Rap",
             @"Hip-Hop",
             @"Classical",
             @"Electronic",
             @"Alternative",
             nil];
    selectedIndex = [genres indexOfObject:self.genre];

}

- (void)viewDidUnload
{
	[super viewDidUnload];
	genre = nil;
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
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
	return [genres count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:@"GenreCell"];
	cell.textLabel.text = [genres objectAtIndex:indexPath.row];
	if (indexPath.row == selectedIndex)
		cell.accessoryType =
        UITableViewCellAccessoryCheckmark;
	else
		cell.accessoryType = UITableViewCellAccessoryNone;
	return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	if (selectedIndex != NSNotFound)
	{
		UITableViewCell *cell = [tableView
                                 cellForRowAtIndexPath:[NSIndexPath
                                                        indexPathForRow:selectedIndex inSection:0]];
		cell.accessoryType = UITableViewCellAccessoryNone;
	}
	selectedIndex = indexPath.row;
	UITableViewCell *cell =
    [tableView cellForRowAtIndexPath:indexPath];
	cell.accessoryType = UITableViewCellAccessoryCheckmark;
	NSString *theGenre = [genres objectAtIndex:indexPath.row];
	[self.delegate genrePickerViewController:self
                              didSelectGenre:theGenre];
}

@end
