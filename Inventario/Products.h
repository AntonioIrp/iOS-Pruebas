//
//  Products.h
//  Inventario
//
//  Created by Antonio Roldán on 23/09/14.
//  Copyright (c) 2014 Antonio Roldán. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Products : NSObject

@property (nonatomic) NSString * nombre;
@property (nonatomic) NSInteger * cantidad;
@property (nonatomic) double * precio;
@property (nonatomic) NSInteger * pasillo;
@property (nonatomic) NSInteger * estante;
@property (nonatomic) NSString * descripcion;
@property (nonatomic) UIImage * fotografia;

-(void)setNombre:(NSString *)thisNombre;
-(void)setCantidad:(NSInteger *)thisCantidad;
-(void)setPrecio:(double *)thisPrecio;
-(void)setPasillo:(NSInteger *)thisPasillo;
-(void)setEstante:(NSInteger *)thisEstante;
-(void)setDescripcion:(NSString *)thisDescripcion;
-(void)setFotografia:(UIImage *)thisFotografia;

-(NSString *)getNombre;
-(NSInteger *)getCantidad;
-(double *)getPrecio;
-(NSInteger *)getPasillo;
-(NSInteger *)getEstante;
-(NSString *)getDescripcion;
-(UIImage *)getFotografia;







@end
