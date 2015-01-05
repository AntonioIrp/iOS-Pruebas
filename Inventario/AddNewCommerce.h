//
//  AddNewCommerce.h
//  Inventario
//
//  Created by Antonio Roldán on 21/09/14.
//  Copyright (c) 2014 Antonio Roldán. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Commerce.h"

@class AddNewCommerce;

@protocol AddNewCommerceDelegate <NSObject>
- (void)addItemViewController:(AddNewCommerce *)controller didFinishEnteringItem:(Commerce *)item;

@end

@interface AddNewCommerce : UIViewController <UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak,nonatomic) id <AddNewCommerceDelegate> delegate;

@property (weak, nonatomic) IBOutlet UITextField *commerceName;
@property (weak, nonatomic) IBOutlet UITextView *commerceDescription;
@property (weak, nonatomic) IBOutlet UITextField *commerceLocation;

@end
