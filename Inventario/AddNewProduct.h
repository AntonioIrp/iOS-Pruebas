//
//  AddNewProduct.h
//  Inventario
//
//  Created by Antonio Roldán on 24/09/14.
//  Copyright (c) 2014 Antonio Roldán. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Products.h"

@class AddNewProduct;

@protocol AddNewProductDelegate <NSObject>
- (void)addItemViewController:(AddNewProduct *)controller insertThisProduct:(Products *)item;

@end


@interface AddNewProduct : UIViewController <UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak,nonatomic) id <AddNewProductDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITextField *productName;
@property (weak, nonatomic) IBOutlet UITextView *productDescription;
@property (weak, nonatomic) IBOutlet UITextField *productQuantity;

@end
