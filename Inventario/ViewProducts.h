//
//  ViewProducts.h
//  Inventario
//
//  Created by Antonio Roldán on 23/09/14.
//  Copyright (c) 2014 Antonio Roldán. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Commerce.h"
#import "Products.h"
#import "ViewController.h"
#import "AddNewProduct.h"

@interface ViewProducts : UIViewController <UITableViewDataSource, UITableViewDelegate, AddNewProductDelegate>


@property (nonatomic) Commerce* comercio;
@property (nonatomic) NSMutableArray* comerciosArray;
@property (nonatomic) NSMutableArray* productsArray;
@property (weak, nonatomic) IBOutlet UITableView *productsTable;


@end
