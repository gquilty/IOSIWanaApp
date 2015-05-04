//
//  iWFilmGenrePickerViewController.m
//  iWanna
//
//  Created by Gavin Quilty on 08/11/2013.
//  Copyright (c) 2013 Gavin Quilty. All rights reserved.
//

#import "iWFilmGenrePickerViewController.h"

@interface iWFilmGenrePickerViewController ()

@end

@implementation iWFilmGenrePickerViewController

{
	NSArray *filmGenres;
	NSUInteger selectedIndex;
}
@synthesize delegate;
@synthesize filmGenre;

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
	filmGenres = [NSArray arrayWithObjects:
              @"Action",
              @"Comedy",
              @"Romatntic",
              @"Documentary",
              @"Musical",
              @"Horror",
              @"Other",
              nil];
    selectedIndex = [filmGenres indexOfObject:self.filmGenre];
    
}

- (void)viewDidUnload
{
	[super viewDidUnload];
	filmGenre = nil;
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
	return [filmGenres count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:@"FilmGenreCell"];
	cell.textLabel.text = [filmGenres objectAtIndex:indexPath.row];
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
	NSString *theFilmGenre = [filmGenres objectAtIndex:indexPath.row];
	[self.delegate filmGenrePickerViewController:self
                              didSelectFilmGenre:theFilmGenre];
}

@end
