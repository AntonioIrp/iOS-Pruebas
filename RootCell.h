//
//  RootCell.h
//  Inventario
//
//  Created by Antonio Roldán on 20/09/14.
//  Copyright (c) 2014 Antonio Roldán. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *rootImage;
@property (weak, nonatomic) IBOutlet UILabel *LabelName;
@property (weak, nonatomic) IBOutlet UILabel *labelDescription;
@property (weak, nonatomic) IBOutlet UILabel *labelLocation;

@end
