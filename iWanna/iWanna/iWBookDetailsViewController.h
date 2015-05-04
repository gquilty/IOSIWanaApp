//
//  iWBookDetailsViewController.h
//  iWanna
//
//  Created by Gavin Quilty on 05/11/2013.
//  Copyright (c) 2013 Gavin Quilty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iWAuthorPickerViewController.h"


@class iWBookDetailsViewController;

@class iWBook;

@protocol iWBookDetailsViewControllerDelegate <NSObject>

- (void)bookDetailsViewControllerDidCancel:(iWBookDetailsViewController *)controller;
- (void)bookDetailsViewController: (iWBookDetailsViewController *)controller
                       didAddBook:(iWBook *)book;
- (void)bookDetailsViewController: (iWBookDetailsViewController *)controller
                      didEditBook:(iWBook *)book;
@end

@interface iWBookDetailsViewController : UITableViewController <iWAuthorPickerViewControllerDelegate>


@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

@property (strong, nonatomic) iWBook *bookToEdit;



@property (nonatomic, weak) id <iWBookDetailsViewControllerDelegate> delegate;

- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;

@end
