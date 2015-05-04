//
//  iWMusicDetailsViewController.h
//  iWanna
//
//  Created by Gavin Quilty on 05/11/2013.
//  Copyright (c) 2013 Gavin Quilty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iWGenrePickerViewController.h"


@class iWMusicDetailsViewController;

@class iWMusic;

@protocol iWMusicDetailsViewControllerDelegate <NSObject>

- (void)musicDetailsViewControllerDidCancel:(iWMusicDetailsViewController *)controller;
- (void)musicDetailsViewController: (iWMusicDetailsViewController *)controller
                       didAddMusic:(iWMusic *)music;
- (void)musicDetailsViewController: (iWMusicDetailsViewController *)controller
                      didEditMusic:(iWMusic *)music;

@end

@interface iWMusicDetailsViewController : UITableViewController <iWGenrePickerViewControllerDelegate>


@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

@property (strong, nonatomic) iWMusic *musicToEdit;

@property (nonatomic, weak) id <iWMusicDetailsViewControllerDelegate> delegate;

- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;



@end
