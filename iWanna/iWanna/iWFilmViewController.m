//
//  iWFilmViewController.m
//  iWanna
//
//  Created by Gavin Quilty on 04/11/2013.
//  Copyright (c) 2013 Gavin Quilty. All rights reserved.
//

#import "iWFilmViewController.h"
#import "iWFilm.h"
#import "iWFilmCell.h"

@interface iWFilmViewController ()

@end

@implementation iWFilmViewController

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
	return [self.filmArray count];
}



- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (editingStyle == UITableViewCellEditingStyleDelete)
	{
		[self.filmArray removeObjectAtIndex:indexPath.row];
		[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
	}
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	iWFilmCell *cell = (iWFilmCell *)[tableView dequeueReusableCellWithIdentifier:@"FilmCell"];
	iWFilm *film = [self.filmArray objectAtIndex:indexPath.row];
	cell.nameLabel.text = film.name;
	cell.filmGenreLabel.text = film.filmGenre;
    
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
    if ([segue.identifier isEqualToString:@"AddFilm"])
	{
		UINavigationController *navigationController = segue.destinationViewController;
		iWFilmDetailsViewController *filmDetailsViewController = [[navigationController viewControllers]objectAtIndex:0];
		filmDetailsViewController.delegate = self;
	}
    else if ([segue.identifier isEqualToString:@"EditFilm"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        iWFilmDetailsViewController *filmDetailsViewController = [navigationController viewControllers][0];
        filmDetailsViewController.delegate = self;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        iWFilm *film = self.filmArray[indexPath.row];
        filmDetailsViewController.filmToEdit = film;
    }
}

- (void)filmDetailsViewController:
(iWFilmDetailsViewController *)controller
                       didAddFilm:(iWFilm *)film
{
	[self.filmArray addObject:film];
	NSIndexPath *indexPath =
    [NSIndexPath indexPathForRow:[self.filmArray count] - 1
                       inSection:0];
	[self.tableView insertRowsAtIndexPaths:
     [NSArray arrayWithObject:indexPath]
                          withRowAnimation:UITableViewRowAnimationAutomatic];
	[self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - PlayerDetailsViewControllerDelegate

- (void)filmDetailsViewControllerDidCancel:
(iWFilmDetailsViewController *)controller
{
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (void)filmDetailsViewControllerDidSave:
(iWFilmDetailsViewController *)controller
{
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (void)filmDetailsViewController: (iWFilmDetailsViewController *)controller
                      didEditFilm:(iWFilm *)film
{
    NSUInteger index = [self.filmArray indexOfObject:film]; NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index                                                 inSection:0]; [self.tableView reloadRowsAtIndexPaths:@[indexPath]withRowAnimation:UITableViewRowAnimationAutomatic]; [self dismissViewControllerAnimated:YES completion:nil];
}

@end
