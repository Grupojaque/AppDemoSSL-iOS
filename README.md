# AppDemoSSL iOS

En este repositorio mostramos el código fuente de demostración de la aplicación 
de iOS se conecta para enviar información a un servidor SSL.

## Uso

Instalar Cocoapods:

`pod install`

Abrir el archivo .xcworkspace

`open AppDemoSSL.xcworkspace`

Cambia en el archivo Api.m el nombre del host donde alojarás tu aplicación demo, 
y asegúrate de que tu servidor cuente con un certificado SSL válido. 

Además, es necesario que incluyas en la aplicación el certificado en un formato 
DER con extensión `.cer`. Es un formato binario.

Recomiendo también que leas y experimentes con las otras opciones, `AFSSLPinningModeCertificate`,
 `AFSSLPinningModePublicKey` y `AFSSLPinningModeNone`.

Una vez incluido el certificado la aplicación se conectará con tu servidor y 
no con otro. Eso incluye el caso donde haces un MITM a la IP de tu simulador iOS.
