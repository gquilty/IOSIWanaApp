//
//  iWAuthorPickerViewController.h
//  iWanna
//
//  Created by Gavin Quilty on 09/11/2013.
//  Copyright (c) 2013 Gavin Quilty. All rights reserved.
//

#import <UIKit/UIKit.h>

@class iWAuthorPickerViewController;

@protocol iWAuthorPickerViewControllerDelegate <NSObject>

- (void)authorPickerViewController:
(iWAuthorPickerViewController *)controller
                   didSelectAuthor:(NSString *)author;
@end

@interface iWAuthorPickerViewController : UITableViewController

@property (nonatomic, weak) id <iWAuthorPickerViewControllerDelegate> delegate;
@property (nonatomic, strong) NSString *author;

@end
