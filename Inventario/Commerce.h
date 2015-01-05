//
//  Commerce.h
//  Inventario
//
//  Created by Antonio Roldán on 20/09/14.
//  Copyright (c) 2014 Antonio Roldán. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Commerce : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *description;
@property (nonatomic) NSString *location;
@property (nonatomic) UIImage *image;
@property (nonatomic) NSMutableArray *products;

-(void)setName: (NSString*)thisName;
-(void)setDescription: (NSString*)thisDescription;
-(void)setLocation: (NSString*)thisLocation;
-(void)setImage:(UIImage *)thisImage;
-(void)setProducts:(NSMutableArray *)thisProducts;

-(NSString *)getName;
-(NSString *)getDescription;
-(NSString *)getLocation;
-(UIImage *)getImage;
-(NSMutableArray *) getProducts;





@end
