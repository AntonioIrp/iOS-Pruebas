//
//  AddNewCommerce.m
//  Inventario
//
//  Created by Antonio Roldán on 21/09/14.
//  Copyright (c) 2014 Antonio Roldán. All rights reserved.
//

#import "AddNewCommerce.h"
#import "ViewController.h"
#import "Commerce.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface AddNewCommerce ()

@end

@implementation AddNewCommerce{
    UIImage *commerceImage;
}

@synthesize commerceName, commerceDescription, commerceLocation, delegate;

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

- (IBAction)saveNewCommerce:(id)sender {
    Commerce *comercio=[[Commerce alloc]init];
    
    [comercio setName:commerceName.text];
    [comercio setDescription:commerceDescription.text];
    [comercio setLocation:commerceLocation.text];
    [comercio setImage:commerceImage];
    
    NSLog(commerceName.text);
    NSLog(commerceDescription.text);
    NSLog(commerceLocation.text);
    
    [self.delegate addItemViewController:self didFinishEnteringItem:comercio];
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (IBAction)addCommercePhoto:(id)sender {
    NSLog(@"Añadir fotografia");
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                initWithTitle:@"¿Quieres adjuntar fotografía?"
                                delegate:self
                                cancelButtonTitle:@"Cancelar"
                                destructiveButtonTitle:nil
                                otherButtonTitles:@"Tomar Fotografía", @"Seleccionar existente", nil];
    actionSheet.tag=100;
    [actionSheet showInView:self.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (actionSheet.tag == 100) {
        NSLog(@"indice de boton: %i", buttonIndex);
        if (buttonIndex==0){
            if ([UIImagePickerController isSourceTypeAvailable:
                 UIImagePickerControllerSourceTypeCamera])
            {
                [self takeAPhoto];
            }else{
                UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Cámara no responde"
                            message:@"No se pudo acceder a la cámara. No se puede capturar una fotografía"
                            delegate:nil
                            cancelButtonTitle:@"OK"
                            otherButtonTitles:nil];
                
                [message show];

            }
        }else if (buttonIndex==1){
            [self openPhotoLibrary];
        }
        
    }
    //NSLog(@"Index = %d - Title = %@", buttonIndex, [actionSheet buttonTitleAtIndex:buttonIndex]);
}

-(void)takeAPhoto{
    NSLog(@"capturar foto");
    UIImagePickerController *imagePicker =[[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    imagePicker.mediaTypes = @[(NSString *) kUTTypeImage];
    imagePicker.allowsEditing = YES;
    [self presentViewController:imagePicker animated:YES completion:nil];
}

-(void)openPhotoLibrary{
    NSLog(@"seleccionar foto existente");
    UIImagePickerController *imagePicker =[[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePicker.mediaTypes = @[(NSString *) kUTTypeImage];
    imagePicker.allowsEditing = YES;
    [self presentViewController:imagePicker animated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSLog(@"image picker did finish");
    commerceImage=info[UIImagePickerControllerEditedImage];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)imagePickerControllerDidCancel: (UIImagePickerController *)picker
{
    NSLog(@"image picker did cancel");
    [self dismissViewControllerAnimated:YES completion:nil];
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
