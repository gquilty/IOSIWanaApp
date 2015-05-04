//
//  iWFilmGenrePickerViewController.h
//  iWanna
//
//  Created by Gavin Quilty on 08/11/2013.
//  Copyright (c) 2013 Gavin Quilty. All rights reserved.
//

@class iWFilmGenrePickerViewController;

@protocol iWFilmGenrePickerViewControllerDelegate <NSObject>
- (void)filmGenrePickerViewController:
(iWFilmGenrePickerViewController *)controller
                   didSelectFilmGenre:(NSString *)filmGenre;
@end

@interface iWFilmGenrePickerViewController : UITableViewController

@property (nonatomic, weak) id <iWFilmGenrePickerViewControllerDelegate> delegate;
@property (nonatomic, strong) NSString *filmGenre;

@end