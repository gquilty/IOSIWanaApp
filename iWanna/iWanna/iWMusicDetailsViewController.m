//
//  iWMusicDetailsViewController.m
//  iWanna
//
//  Created by Gavin Quilty on 05/11/2013.
//  Copyright (c) 2013 Gavin Quilty. All rights reserved.
//

#import "iWMusicDetailsViewController.h"
#import "iWMusic.h"
#import "iWGenrePickerViewController.h"


@interface iWMusicDetailsViewController ()
@end

@implementation iWMusicDetailsViewController
{
	NSString *genre;
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

#pragma mark - GamePickerViewControllerDelegate

- (void)genrePickerViewController:
(iWGenrePickerViewController *)controller
                   didSelectGenre:(NSString *)theGenre
{
	genre = theGenre;
	self.detailLabel.text = genre;
	[self.navigationController popViewControllerAnimated:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.musicToEdit != nil) {
        self.title = @"Edit Music"; self.nameTextField.text = self.musicToEdit.name; genre= self.musicToEdit.genre;
    }
    self.detailLabel.text = genre; }


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
		NSLog(@"init iWMusicDetailsViewController");
		genre = @"New Genre";
	}
	return self;
}
- (void)dealloc
{
	NSLog(@"dealloc iWMusicDetailsViewController");
}

- (IBAction)cancel:(id)sender
{
	[self.delegate musicDetailsViewControllerDidCancel:self];
}

- (IBAction)done:(id)sender
{
	if (self.musicToEdit != nil) {
        self.musicToEdit.name = self.nameTextField.text; self.musicToEdit.genre = genre;
        [self.delegate musicDetailsViewController:self didEditMusic:self.musicToEdit];
    }
    else
    {
        iWMusic *music = [[iWMusic alloc] init]; music.name = self.nameTextField.text; music.genre = genre;
        [self.delegate musicDetailsViewController:self didAddMusic:music];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if ([segue.identifier isEqualToString:@"PickGenre"])
	{
		iWGenrePickerViewController *genrePickerViewController =
        segue.destinationViewController;
		genrePickerViewController.delegate = self;
		genrePickerViewController.genre = genre;
	}
}
@end
