//
//  iWGenrePickerViewController.h
//  iWanna
//
//  Created by Gavin Quilty on 08/11/2013.
//  Copyright (c) 2013 Gavin Quilty. All rights reserved.
//

@class iWGenrePickerViewController;

@protocol iWGenrePickerViewControllerDelegate <NSObject>
- (void)genrePickerViewController:
(iWGenrePickerViewController *)controller
                   didSelectGenre:(NSString *)genre;
@end

@interface iWGenrePickerViewController : UITableViewController

@property (nonatomic, weak) id <iWGenrePickerViewControllerDelegate> delegate;
@property (nonatomic, strong) NSString *genre;

@end