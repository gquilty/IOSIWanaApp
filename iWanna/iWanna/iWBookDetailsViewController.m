//
//  iWBookDetailsViewController.m
//  iWanna
//
//  Created by Gavin Quilty on 05/11/2013.
//  Copyright (c) 2013 Gavin Quilty. All rights reserved.
//

#import "iWBookDetailsViewController.h"
#import "iWBook.h"
#import "iWAuthorPickerViewController.h"


@interface iWBookDetailsViewController ()
@end

@implementation iWBookDetailsViewController
{
	NSString *author;
}

@synthesize delegate;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - AuthorPickerViewControllerDelegate

- (void)authorPickerViewController:
(iWAuthorPickerViewController *)controller
                   didSelectAuthor:(NSString *)theAuthor
{
	author = theAuthor;
	self.detailLabel.text = author;
	[self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.bookToEdit != nil) {
        self.title = @"Edit Book"; self.nameTextField.text = self.bookToEdit.name; author = self.bookToEdit.author;
    }
    self.detailLabel.text = author; }


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (indexPath.section == 0)
		[self.nameTextField becomeFirstResponder];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
	if ((self = [super initWithCoder:aDecoder]))
	{
		NSLog(@"init iWBookDetailsViewController");
		author = @"New Genre";
	}
	return self;
}
- (void)dealloc
{
	NSLog(@"dealloc iWBookDetailsViewController");
}

- (IBAction)cancel:(id)sender
{
	[self.delegate bookDetailsViewControllerDidCancel:self];
}

- (IBAction)done:(id)sender
{
	if (self.bookToEdit != nil) {
        self.bookToEdit.name = self.nameTextField.text; self.bookToEdit.author = author;
        [self.delegate bookDetailsViewController:self didEditBook:self.bookToEdit];
    }
    else
    {
        iWBook *book = [[iWBook alloc] init]; book.name = self.nameTextField.text;
        book.author = author;
        [self.delegate bookDetailsViewController:self didAddBook:book];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if ([segue.identifier isEqualToString:@"PickAuthor"])
	{
		iWAuthorPickerViewController *authorPickerViewController =
        segue.destinationViewController;
		authorPickerViewController.delegate = self;
		authorPickerViewController.author = author;
	}
}
         
@end
         
