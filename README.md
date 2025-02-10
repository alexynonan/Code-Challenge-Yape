# Yape

## Descripción
Yape es una aplicación iOS desarrollada en Swift y soportada desde iOS 13, que sigue la arquitectura **MVVM con Clean Architecture**, asegurando una estructura modular, escalable y mantenible. Utiliza varios patrones de diseño, como **Dependency Injection, Observer y Factory Method**, para mejorar la separación de responsabilidades y facilitar pruebas unitarias.

---

## Tecnologías y Librerías Usadas
El proyecto utiliza las siguientes librerías para la gestión de redes, parsing de JSON, mapas y pruebas unitarias:

### Dependencias principales
- **[Alamofire (~> 5.4)](https://github.com/Alamofire/Alamofire)** → Manejo de peticiones HTTP de manera sencilla y eficiente.
- **[SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON)** → Facilita la manipulación de datos JSON en Swift.
- **[GoogleMaps (6.2.1)](https://developers.google.com/maps/documentation/ios-sdk/start)** → Integración de mapas de Google en la aplicación.

### Dependencias para pruebas unitarias
- **[Quick (~> 5.0)](https://github.com/Quick/Quick)** → Framework de pruebas unitarias inspirado en BDD (Behavior-Driven Development).
- **[Nimble (~> 10.0)](https://github.com/Quick/Nimble)** → Librería para escribir aserciones en pruebas unitarias con mayor legibilidad y expresividad.

---

## Arquitectura
El proyecto sigue la arquitectura **MVVM con Clean Architecture**, dividiendo la aplicación en capas bien definidas:

### Estructura de Carpetas
```
Yape/
│── ClassGeneral/       # Capa de clases reutilizable (Extension, Message, Closures, Reusable)
│── Resources/          # Capa de Assets (Colores, Icono del app, Imagenes Custom)
│── Network/            # Capa de datos (modelos de red)
│── MVVM/               # Capa de Model View ViewModel (entidades, casos de uso, reglas de negocio, ViewModels, Views)
YapeTests/              # Pruebas unitarias con Quick y Nimble
```

### **Patrones de Diseño Implementados**
1. **Dependency Injection:**
   - Se inyectan dependencias en los `ViewModel` para desacoplar la lógica de negocio de la UI y facilitar las pruebas unitarias.

2. **Observer:**
   - Se usan closures para la comunicación entre `ViewModel` y `ViewController`, permitiendo una actualización reactiva de la UI sin necesidad de usar delegados o `NotificationCenter`.

3. **Factory Method:**
   - Se encapsula la creación de controladores de vista, como en la implementación de `UIHostingController` en `HomeViewController`.

---

## Instalación
Para instalar las dependencias del proyecto, ejecuta:
```sh
pod install
```
Asegúrate de abrir el proyecto con `Yape.xcworkspace` en lugar de `Yape.xcodeproj`.

---

## Recomendación para Apple Silicon (M1/M2/M3)
Si usas una Mac con procesador Apple Silicon, es recomendable habilitar Rosetta para compilar el proyecto correctamente,

Recuerda seleccionar el simulator con Rosetta
```sh
 Product > Destination > Show All Run Destinations
```

---

## Pruebas
Para ejecutar las pruebas unitarias, usa el siguiente comando:
```sh
Cmd + U
```

---

## Contacto

Desarrollado por **Alexander Ynoñan H.**. Para consultas o colaboración, contáctame a través de:

- [LinkedIn](https://www.linkedin.com/in/alexander-johel-ynonan-huayllapuma/)

