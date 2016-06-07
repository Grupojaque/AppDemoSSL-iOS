//
//  API.h
//  AppDemoSSL
//
//  Created by Orlando Rey Sánchez on 07/06/16.
//  Copyright © 2016 Grupo Jaque. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

// Las rutas de la API, que en este caso es sólo una, para mandar datos
//static NSString * _Nullable URL_SEND = @"send";


@interface API : NSObject
//{
//    AFHTTPSessionManager *manager;
//    NSURL *baseURL;
//}
@property (nonatomic, retain) AFHTTPSessionManager *manager;
@property (nonatomic, retain) NSURL *baseURL;


/*! Inicializa y regresa la instancia compartida de la API con 
 *  todas sus configuraciones predeterminadas.
 * \returns id  Instancia de la clase API
 */
+ (API *)sharedInstance;


/*! Envia un secreto hacia nuestro servicio web.
 * \param secret  El secreto a enviar.
 * \param completionBlock  El bloque que completa la operación y reporta un NSError* o un NSDictionary* como respuesta
 * \param
 * \returns void
 */
- (void)sendSecret:(NSString *)secret withCompletionBlock:(nullable void (^)(NSError * __nullable error, NSDictionary * __nullable response))completionBlock;

@end
