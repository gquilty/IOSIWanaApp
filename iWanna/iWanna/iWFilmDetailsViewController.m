//
//  iWFilmDetailsViewController.m
//  iWanna
//
//  Created by Gavin Quilty on 05/11/2013.
//  Copyright (c) 2013 Gavin Quilty. All rights reserved.
//

#import "iWFilmDetailsViewController.h"
#import "iWFilm.h"
#import "iWFilmGenrePickerViewController.h"


@interface iWFilmDetailsViewController ()
@end

@implementation iWFilmDetailsViewController
{
	NSString *filmGenre;
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

#pragma mark - FilmGenrePickerViewControllerDelegate

- (void)filmGenrePickerViewController:
(iWFilmGenrePickerViewController *)controller
                   didSelectFilmGenre:(NSString *)theFilmGenre
{
	filmGenre = theFilmGenre;
	self.detailLabel.text = theFilmGenre;
	[self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.filmToEdit != nil) {
        self.title = @"Edit Film"; self.nameTextField.text = self.filmToEdit.name; filmGenre = self.filmToEdit.filmGenre;
    }
    self.detailLabel.text = filmGenre; }


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
		NSLog(@"init iWFilmDetailsViewController");
		filmGenre = @"New Genre";
	}
	return self;
}
- (void)dealloc
{
	NSLog(@"dealloc iWFilmDetailsViewController");
}

- (IBAction)cancel:(id)sender
{
	[self.delegate filmDetailsViewControllerDidCancel:self];
}

- (IBAction)done:(id)sender
{
	if (self.filmToEdit != nil) {
        self.filmToEdit.name = self.nameTextField.text; self.filmToEdit.filmGenre= filmGenre;
        [self.delegate filmDetailsViewController:self didEditFilm:self.filmToEdit];
    }
    else
    {
        iWFilm *film = [[iWFilm alloc] init]; film.name = self.nameTextField.text;
        film.filmGenre = filmGenre;
        [self.delegate filmDetailsViewController:self didAddFilm:film];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if ([segue.identifier isEqualToString:@"PickFilmGenre"])
	{
		iWFilmGenrePickerViewController *filmGenrePickerViewController =
        segue.destinationViewController;
		filmGenrePickerViewController.delegate = self;
		filmGenrePickerViewController.filmGenre = filmGenre;
	}
}
@end
