//
//  iWMusicsViewController.h
//  iWanna
//
//  Created by Gavin Quilty on 04/11/2013.
//  Copyright (c) 2013 Gavin Quilty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iWMusicDetailsViewController.h"

@interface iWMusicsViewController : UITableViewController <iWMusicDetailsViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray *musicArray;


@end
