# Proyecto vision artifical - ESP32CAM

 ## Instrucciones de instalacion y configuracion
 En esta seccion se detalla el proceso de instalacion y configuracion de los repositorios necesarios para el manejo de un **esp32-cam** por medio de el entorno de desarrolo **ESP-IDF**, en el sistema operativo LINUX. 

 ### ESP-IDF
 La instalacion y configuracion del entorno de desarrollo se puede encontrar directamente en el repositorio del fabricante espressif ([Get started - ESPIDF](https://docs.espressif.com/projects/esp-idf/en/latest/esp32/get-started/index.html)).

 - [x] En primer lugar es necesario **clonar el repositorio** de github correspondiente de ESP-IDF.
   ```sh
   git clone --recursive https://github.com/espressif/esp-idf
   ``` 
 - [x] Una vez clonado el repositorio es necesario dirigirse a la carpeta.
   ```sh
   cd ~/esp-idf
   ```
 - [x] Es necesario ejecutar el archivo bash **install.sh**, para poder utilizar las funciones de ESP-IDF.
   ```sh
   ./install.sh
   ``` 
 - [x] Luego se ejecuta el archivo bash **export.sh**, para exportar las variables de entorno que se utilizaran.
   ```sh
   . ./export.sh
   ```
En este punto el entorno de desarrollo ESP-IDF debe estar configurado y listo para implementar proyectos sobre un esp32.


 ### Driver para esp32-cam 
  La instalacion y configuracion del driver se puede encontrar directamente en el repositorio del fabricante espressif ([ESP32 Camera Driver](https://github.com/espressif/esp32-camera)).

 - [x] En primer lugar es necesario **clonar el repositorio** de github correspondiente del driver esp32-cam. Es necesario clonar el repositorio en la carpeta *components* del repositorio clonado de ESP-IDF.
   ```sh
   cd ~/esp-idf/components
   git clone --recursive https://github.com/espressif/esp32-camera
   ``` 
 - [x] Una vez clonado el repositorio en la carpeta correspondiente, se procede a [crear un proyecto](#crear-un-proyecto-esp-idf) un proyecto ESP-IDF) para implementar sobre este los ajustes necesarios para que el driver de la camara funcione junto con el esp32-cam.
 ```c
    #include <esp_camera.h>
 ```

 ## Implementacion
 
 ### Crear un proyecto ESP-IDF
 El entorno de desarrollo ESP-IDF permite realizar varias acciones por medio de el archivo ***idf.py***. En este caso mostraremos un pequeno instructivo para registrar como **crear, construir y ejecutar** un proyecto en esp-32.

 - [x] En primer lugar es recomendable crear una carpeta en donde se puedan alojar todos los proyectos que se vayan a realizar.

 ```sh
 mkdir ~/esp-idf/projects
 ```
 - [x] Y dentro del folder de *projects* utilizamos una de las funciones que presta ***idf.py***, con la cual creamos un projecto con el nombre que deseemos.

 ```sh
 idf.py create-project "nombre-del-proyecto"
 ```
 ```sh
 Ejemplo: idf.py create-project helloworld
 ```
 - [ ] Todas las funciones que presta ***idf.py*** se pueden observar ejecutando el siguiente comando.

 ```sh
 idf.py --help
 ```

 - [x] 

 ### Inicializacion camara con esp32
 ### Ejemplo guardar imagen en SD 


