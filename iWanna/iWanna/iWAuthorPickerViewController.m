//
//  iWGenrePickerViewController.m
//  iWanna
//
//  Created by Gavin Quilty on 08/11/2013.
//  Copyright (c) 2013 Gavin Quilty. All rights reserved.
//

#import "iWAuthorPickerViewController.h"

@interface iWAuthorPickerViewController ()

@end

@implementation iWAuthorPickerViewController

{
	NSArray *authors;
	NSUInteger selectedIndex;
}
@synthesize delegate;
@synthesize author;

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
	authors = [NSArray arrayWithObjects:
              @"Science Fiction",
              @"Biography",
              @"Graphic Novel",
              @"Funny",
              @"Historical",
              @"Sports",
              @"Fiction",
              @"Other",
              nil];
    selectedIndex = [authors indexOfObject:self.author];
    
}

- (void)viewDidUnload
{
	[super viewDidUnload];
	author = nil;
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
	return [authors count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:@"AuthorCell"];
	cell.textLabel.text = [authors objectAtIndex:indexPath.row];
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
	NSString *theAuthor = [authors objectAtIndex:indexPath.row];
	[self.delegate authorPickerViewController:self
                              didSelectAuthor:theAuthor];
}

@end
