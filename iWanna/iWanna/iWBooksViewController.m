//
//  iWMusicsViewController.m
//  iWanna
//
//  Created by Gavin Quilty on 04/11/2013.
//  Copyright (c) 2013 Gavin Quilty. All rights reserved.
//

#import "iWBooksViewController.h"
#import "iWBook.h"
#import "iWBookCell.h"

@interface iWBooksViewController ()

@end

@implementation iWBooksViewController

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
	return [self.booksArray count];
}



- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (editingStyle == UITableViewCellEditingStyleDelete)
	{
		[self.booksArray removeObjectAtIndex:indexPath.row];
		[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
	}
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	iWBookCell *cell = (iWBookCell *)[tableView dequeueReusableCellWithIdentifier:@"BookCell"];
	iWBook *book = [self.booksArray objectAtIndex:indexPath.row];
	cell.nameLabel.text = book.name;
	cell.authorLabel.text = book.author;
    
    return cell;
}



#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"AddBook"])
	{
		UINavigationController *navigationController = segue.destinationViewController;
		iWBookDetailsViewController *bookDetailsViewController = [[navigationController viewControllers]objectAtIndex:0];
		bookDetailsViewController.delegate = self;
	}
    else if ([segue.identifier isEqualToString:@"EditBook"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        iWBookDetailsViewController *bookDetailsViewController = [navigationController viewControllers][0];
        bookDetailsViewController.delegate = self;
        
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        iWBook *book = self.booksArray[indexPath.row];
        bookDetailsViewController.bookToEdit = book;
    }
}

- (void)bookDetailsViewController:
(iWBookDetailsViewController *)controller
                       didAddBook:(iWBook *)book
{
	[self.booksArray addObject:book];
	NSIndexPath *indexPath =
    [NSIndexPath indexPathForRow:[self.booksArray count] - 1
                       inSection:0];
	[self.tableView insertRowsAtIndexPaths:
     [NSArray arrayWithObject:indexPath]
                          withRowAnimation:UITableViewRowAnimationAutomatic];
	[self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - BookDetailsViewControllerDelegate

- (void)bookDetailsViewControllerDidCancel:
(iWBookDetailsViewController *)controller
{
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (void)bookDetailsViewControllerDidSave:
(iWBookDetailsViewController *)controller
{
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (void)bookDetailsViewController: (iWBookDetailsViewController *)controller
                      didEditBook:(iWBook *)book
{
    NSUInteger index = [self.booksArray indexOfObject:book]; NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index                                                 inSection:0]; [self.tableView reloadRowsAtIndexPaths:@[indexPath]withRowAnimation:UITableViewRowAnimationAutomatic]; [self dismissViewControllerAnimated:YES completion:nil];
}

@end
