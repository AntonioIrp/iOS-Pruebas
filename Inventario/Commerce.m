//
//  Commerce.m
//  Inventario
//
//  Created by Antonio Roldán on 20/09/14.
//  Copyright (c) 2014 Antonio Roldán. All rights reserved.
//

#import "Commerce.h"

@implementation Commerce

@synthesize name, description, location, image, products;

-(void)setName: (NSString*)thisName {
    NSLog(@"setName");
    name=thisName;
}

-(void)setDescription: (NSString*)thisDescription {
    NSLog(@"setDescription");
    description=thisDescription;
}

-(void)setLocation: (NSString*)thisLocation{
    NSLog(@"setLocation");
    location=thisLocation;
}

-(void)setImage:(UIImage *)thisImage{
    NSLog(@"setImage");
    image=thisImage;
}

-(void)setProducts:(NSMutableArray *)thisProducts{
    NSLog(@"setProducts");
    products=thisProducts;
}

-(NSString *)getName{
    return name;
}

-(NSString *)getDescription{
    return description;
}

-(NSString *)getLocation{
    return location;
}

-(UIImage *)getImage{
    return image;
}

-(NSMutableArray *)getProducts{
    return products;
}

@end
