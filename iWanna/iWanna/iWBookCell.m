//
//  iWBookCell.m
//  iWanna
//
//  Created by Gavin Quilty on 09/11/2013.
//  Copyright (c) 2013 Gavin Quilty. All rights reserved.
//

#import "iWBookCell.h"

@implementation iWBookCell

@synthesize nameLabel;
@synthesize authorLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end

