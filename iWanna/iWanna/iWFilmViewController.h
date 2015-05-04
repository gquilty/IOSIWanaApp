//
//  iWFilmViewController.h
//  iWanna
//
//  Created by Gavin Quilty on 10/11/2013.
//  Copyright (c) 2013 Gavin Quilty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iWFilmDetailsViewController.h"

@interface iWFilmViewController : UITableViewController <iWFilmDetailsViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray *filmArray;


@end
