//
//  ViewController.m
//  Inventario
//
//  Created by Antonio Roldán on 20/09/14.
//  Copyright (c) 2014 Antonio Roldán. All rights reserved.
//

#import "ViewController.h"
#import "RootCell.h"
#import "Commerce.h"
#import "AddNewCommerce.h"
#import "ViewProducts.h"


@interface ViewController ()

@end



@implementation ViewController{
    NSArray *recipes;
    NSMutableArray *commercesArray;
    Commerce *comercio;
    NSMutableArray *recipesArray;
    
}

@synthesize commerceTable;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        NSLog(@"initwith");
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"viewdidload");
    
    if (commercesArray == nil) {
       commercesArray=[[NSMutableArray alloc] init];
       NSLog(@"commercesArray inicializado");
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [commercesArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"CustomRootCell";
    
    RootCell *cell=(RootCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    
    if (cell == nil){
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"RootCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    Commerce *com=[commercesArray objectAtIndex:indexPath.row];
    
    cell.LabelName.text=com.getName;
    cell.labelDescription.text=com.getDescription;
    cell.labelLocation.text=com.getLocation;
    
    cell.rootImage.image= com.getImage;
    
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"Seleccionado: %i", indexPath.row);
    
    Commerce *com=[commercesArray objectAtIndex:indexPath.row];
    
    ViewProducts *viewProducts=[self.storyboard instantiateViewControllerWithIdentifier:@"ViewProducts"];
    
    viewProducts.comercio=com;
    viewProducts.comerciosArray=commercesArray;
    [[self navigationController] pushViewController:viewProducts animated:YES ];
 
    
    NSLog(@"aqui");
}

- (IBAction)EditCommerce:(id)sender {
    NSLog(@"editar");
    [commerceTable reloadData];
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.commerceTable reloadData];
}

- (void)addItemViewController:(AddNewCommerce *)controller didFinishEnteringItem:(Commerce *)item
{
    //NSLog(@"retorno %@", item.getName);
    //NSLog(@"retorno %@", item.getDescription);
    //NSLog(@"retorno %@", item.getLocation);
    
    [commercesArray addObject:item];
}

- (IBAction)openAddNewCommerce:(id)sender {
    AddNewCommerce *addNewCommerce = [self.storyboard instantiateViewControllerWithIdentifier:@"AddNewCommerce"];
    
    addNewCommerce.delegate = self;
    [[self navigationController] pushViewController:addNewCommerce animated:YES];
}


// Swipe to delete.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [commercesArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    
}
@end
