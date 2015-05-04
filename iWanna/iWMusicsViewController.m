//
//  iWMusicsViewController.m
//  iWanna
//
//  Created by Gavin Quilty on 04/11/2013.
//  Copyright (c) 2013 Gavin Quilty. All rights reserved.
//

#import "iWMusicsViewController.h"
#import "iWMusic.h"
#import "iWMusicCell.h"

@interface iWMusicsViewController ()

@end

@implementation iWMusicsViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}



- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
	return [self.musicArray count];
}



- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (editingStyle == UITableViewCellEditingStyleDelete)
	{
		[self.musicArray removeObjectAtIndex:indexPath.row];
		[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
	}
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	iWMusicCell *cell = (iWMusicCell *)[tableView dequeueReusableCellWithIdentifier:@"MusicCell"];
	iWMusic *music = [self.musicArray objectAtIndex:indexPath.row];
	cell.nameLabel.text = music.name;
	cell.genreLabel.text = music.genre;
    
    return cell;
}



#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"AddMusic"])
	{
		UINavigationController *navigationController = segue.destinationViewController;
		iWMusicDetailsViewController *musicDetailsViewController = [[navigationController viewControllers]objectAtIndex:0];
		musicDetailsViewController.delegate = self;
	}
    else if ([segue.identifier isEqualToString:@"EditMusic"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        iWMusicDetailsViewController *musicDetailsViewController = [navigationController viewControllers][0];
        musicDetailsViewController.delegate = self;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        iWMusic *music = self.musicArray[indexPath.row];
        musicDetailsViewController.musicToEdit = music;
    }
}

- (void)musicDetailsViewController:
(iWMusicDetailsViewController *)controller
                       didAddMusic:(iWMusic *)music
{
	[self.musicArray addObject:music];
	NSIndexPath *indexPath =
    [NSIndexPath indexPathForRow:[self.musicArray count] - 1
                       inSection:0];
	[self.tableView insertRowsAtIndexPaths:
     [NSArray arrayWithObject:indexPath]
                          withRowAnimation:UITableViewRowAnimationAutomatic];
	[self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - PlayerDetailsViewControllerDelegate

- (void)musicDetailsViewControllerDidCancel:
(iWMusicDetailsViewController *)controller
{
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (void)musicDetailsViewControllerDidSave:
(iWMusicDetailsViewController *)controller
{
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (void)musicDetailsViewController: (iWMusicDetailsViewController *)controller
                      didEditMusic:(iWMusic *)music
{
    NSUInteger index = [self.musicArray indexOfObject:music]; NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index                                                 inSection:0]; [self.tableView reloadRowsAtIndexPaths:@[indexPath]withRowAnimation:UITableViewRowAnimationAutomatic]; [self dismissViewControllerAnimated:YES completion:nil];
}


@end
