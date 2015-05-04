//
//  iWFilmDetailsViewController.h
//  iWanna
//
//  Created by Gavin Quilty on 05/11/2013.
//  Copyright (c) 2013 Gavin Quilty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iWFilmGenrePickerViewController.h"


@class iWFilmDetailsViewController;

@class iWFilm;

@protocol iWFilmDetailsViewControllerDelegate <NSObject>

- (void)filmDetailsViewControllerDidCancel:(iWFilmDetailsViewController *)controller;
- (void)filmDetailsViewController: (iWFilmDetailsViewController *)controller
                       didAddFilm:(iWFilm *)film;
- (void)filmDetailsViewController: (iWFilmDetailsViewController *)controller
                       didEditFilm:(iWFilm *)film;
@end

@interface iWFilmDetailsViewController : UITableViewController <iWFilmGenrePickerViewControllerDelegate>


@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

@property (strong, nonatomic) iWFilm *filmToEdit;

@property (nonatomic, weak) id <iWFilmDetailsViewControllerDelegate> delegate;

- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;

@end
