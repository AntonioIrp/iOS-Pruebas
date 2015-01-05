//
//  AddNewProduct.m
//  Inventario
//
//  Created by Antonio Roldán on 24/09/14.
//  Copyright (c) 2014 Antonio Roldán. All rights reserved.
//

#import "Foundation/Foundation.h"
#import "AddNewProduct.h"
#import "Products.h"

@interface AddNewProduct ()

@end

@implementation AddNewProduct

@synthesize delegate, productName, productDescription, productQuantity;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)AddNewProduct:(id)sender {
    Products *prod=[[Products alloc] init];
    
    NSString *cant=productQuantity.text;
    NSInteger *cantint=[cant integerValue];
    
    [prod setNombre:productName.text];
    [prod setDescripcion:productDescription.text];
    [prod setCantidad: cantint]; // [NSString stringWithFormat:@"%ld", prod.getCantidad];
    NSLog(@"almacenado producto");
    
    [self.delegate addItemViewController:self insertThisProduct:prod];
    [self.navigationController popViewControllerAnimated:YES];
   
     
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
