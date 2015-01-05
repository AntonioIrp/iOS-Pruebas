//
//  Products.m
//  Inventario
//
//  Created by Antonio Roldán on 23/09/14.
//  Copyright (c) 2014 Antonio Roldán. All rights reserved.
//

#import "Products.h"


@implementation Products

@synthesize nombre,cantidad,pasillo,precio,estante,descripcion,fotografia;


-(void)setNombre:(NSString *)thisNombre{
    nombre=thisNombre;
}
-(void)setCantidad:(NSInteger *)thisCantidad{
    cantidad=thisCantidad;
}
-(void)setPrecio:(double *)thisPrecio{
    precio=thisPrecio;
}
-(void)setPasillo:(NSInteger *)thisPasillo{
    pasillo=thisPasillo;
}
-(void)setEstante:(NSInteger *)thisEstante{
    estante=thisEstante;
}
-(void)setDescripcion:(NSString *)thisDescripcion{
    descripcion=thisDescripcion;
}
-(void)setFotografia:(UIImage *)thisFotografia{
    fotografia=thisFotografia;
}

-(NSString *)getNombre{
    return nombre;
}
-(NSInteger *)getCantidad{
    return cantidad;
}
-(double *)getPrecio{
    return precio;
}
-(NSInteger *)getPasillo{
    return pasillo;
}
-(NSInteger *)getEstante{
    return estante;
}
-(NSString *)getDescripcion{
    return descripcion;
}
-(UIImage *)getFotografia{
    return fotografia;
}


@end
