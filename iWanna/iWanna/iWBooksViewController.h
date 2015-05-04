//
//  iWBooksViewController.h
//  iWanna
//
//  Created by Gavin Quilty on 09/11/2013.
//  Copyright (c) 2013 Gavin Quilty. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "iWBookDetailsViewController.h"

@interface iWBooksViewController : UITableViewController <iWBookDetailsViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray *booksArray;


@end
