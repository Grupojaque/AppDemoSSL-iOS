//
//  API.m
//  AppDemoSSL
//
//  Created by Orlando Rey Sánchez on 07/06/16.
//  Copyright © 2016 Grupo Jaque. All rights reserved.
//

#import "API.h"

@implementation API

+ (API *)sharedInstance {
    API *newAPI = [[API alloc] init];
    
    [newAPI setAllDefaults];
    
    return newAPI;
}


- (void)setAllDefaults {
    _baseURL = [NSURL URLWithString:@"https://my-server.example.com/"];
    _manager = [[AFHTTPSessionManager alloc] initWithBaseURL:_baseURL];
    
    // Fijar la aplicación con el certificado hará que la petición falle, por ejemplo, cuando el
    // certificado haya caducado; tendrías que renovar la aplicación en la App Store para que siga funcionando
//    AFSecurityPolicy *appPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    
    // Fijar la llave pública del certificado hará que la conexión funcione cuando el certificado tenga
    // la llave pública de alguno de los certificados vigentes. Si deseas conservar la misma llave pública,
    // por ejemplo al renovar el certificado, deberás solicitar el nuevo certificado con el mismo archivo
    // de requerimiento .csr
    AFSecurityPolicy *appPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModePublicKey];
    
    // Esta es la opción por defecto. Si no deseamos agregar ninguna configuración podemos agregar esta línea
    // o no agregar nada.
//    AFSecurityPolicy *appPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    
    // Con esto permitimos certificados firmados por entidades inexistentes. Por ejemplo certificados "staging"
    // emitidos con Letsencrypt para hacer pruebas de servidor.
//    appPolicy.allowInvalidCertificates = YES;
    
    [_manager setSecurityPolicy:appPolicy];
    
    // Peticiones y respuestas van en JSON
    _manager.responseSerializer = [AFJSONResponseSerializer serializer];
    _manager.requestSerializer = [AFJSONRequestSerializer serializer];
}

- (void)sendSecret:(NSString *)secret withCompletionBlock:(void (^)(NSError * _Nullable, NSDictionary * _Nullable))completionBlock {
    NSLog(@"Petición al servidor");

    [_manager POST:@"create" parameters:@{ @"secreto": secret } progress:^(NSProgress * _Nonnull uploadProgress) {
        return;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *response = responseObject;
        
        completionBlock(nil, response);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Hubo una falla: %@", error);
        
        completionBlock(error, nil);
    }];
}

@end
