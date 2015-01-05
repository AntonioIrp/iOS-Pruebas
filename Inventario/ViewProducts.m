//
//  ViewProducts.m
//  Inventario
//
//  Created by Antonio Roldán on 23/09/14.
//  Copyright (c) 2014 Antonio Roldán. All rights reserved.
//

#import "ViewProducts.h"
#import "ViewController.h"
#import "Products.h"
#import "Commerce.h"
#import "ProductsCell.h"



@interface ViewProducts ()

@end


@implementation ViewProducts

@synthesize comercio, productsArray, productsTable, comerciosArray;

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
    NSLog(@"el comercio seleccionado es: %@", comercio.getName);
    productsArray=[[NSMutableArray alloc] init];
    
    //productsArray=comercio.getProducts;
    [productsArray addObjectsFromArray:comercio.getProducts];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [productsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"CustomProductsCell";
    
     ProductsCell *cell=(ProductsCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    
    if (cell == nil){
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ProductsCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    Products *prod=[productsArray objectAtIndex:indexPath.row];
    
    cell.productName.text= prod.getNombre;
    cell.productDescription.text=prod.getDescripcion;
    cell.productQuantity.text=[NSString stringWithFormat:@"%ld", prod.getCantidad];
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"Seleccionado: %i", indexPath.row);
    
}

- (IBAction)addNewProduct:(id)sender {
    AddNewProduct *addNewProduct=[self.storyboard instantiateViewControllerWithIdentifier:@"AddNewProduct"];
    addNewProduct.delegate=self;
    [[self navigationController] pushViewController:addNewProduct animated:YES];
}

-(void)addItemViewController:(AddNewProduct *)controller insertThisProduct:(Products *)item{
    NSLog(@"vuelta a viewProducts");
    
    Products *newProduct=[[Products alloc] init];
    [newProduct setNombre:item.getNombre];
    [newProduct setDescripcion:item.getDescripcion];
    [newProduct setCantidad:item.getCantidad];
    
    [productsArray addObject:newProduct];
    [comercio setProducts:productsArray];
    
    
   // NSArray *fruits = @[@"Apple", @"Mango", @"Pineapple", @"Plum", @"Apricot"];
    
    //NSString *filePathFruits = [documents stringByAppendingPathComponent:@"fruits.plist"];
    //[fruits writeToFile:filePathFruits atomically:YES];
    //[comerciosArray writeToFile:@"Comerces.plist" atomically:YES];
    
    //NSMutableArray *loadedFruits = [NSMutableArray arrayWithContentsOfFile:@"Comerces.plist"];
    //NSLog(@"Fruits Array > %@", loadedFruits);
    
    //NSMutableArray *array=[[NSMutableArray alloc] init];
    //[array addObject:@"test"];
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"comerces" ofType:@"plist"];    
    NSLog(plistPath);
    
    //NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    //NSString *libraryDirectory = [paths objectAtIndex:0];
    //NSString *location = [libraryDirectory stringByAppendingString:@"comerces.plist"];
    //[comerciosArray writeToFile:plistPath atomically:YES];
    //NSMutableArray *arra=@[@"aklsdjf", @"kfjasd"];
    //NSArray *arr=@[@"aklsdjf", @"kfjasd"];
    [comerciosArray writeToFile:plistPath atomically:YES];
    
    NSMutableArray *loadedFruits = [NSMutableArray arrayWithContentsOfFile:plistPath];
    NSLog(@"Fruits Array > %@", loadedFruits);

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.productsTable reloadData];
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
