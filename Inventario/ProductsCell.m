//
//  ProductsCellTableViewCell.m
//  Inventario
//
//  Created by Antonio Roldán on 23/09/14.
//  Copyright (c) 2014 Antonio Roldán. All rights reserved.
//

#import "ProductsCell.h"

@implementation ProductsCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end