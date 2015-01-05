//
//  ViewController.h
//  Inventario
//
//  Created by Antonio Roldán on 20/09/14.
//  Copyright (c) 2014 Antonio Roldán. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddNewCommerce.h"


@interface ViewController : UIViewController
    <UITableViewDataSource, UITableViewDelegate, AddNewCommerceDelegate>


@property (weak, nonatomic) IBOutlet UITableView *commerceTable;



@end
