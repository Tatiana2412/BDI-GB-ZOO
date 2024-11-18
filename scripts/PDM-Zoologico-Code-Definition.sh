// Modelo de Base de Datos para Gestión de Zoológico

/*
Este script establece la estructura de una base de datos relacional destinada a 
gestionar la información de un zoológico. Incluye datos sobre animales, cuidadores, 
especies, hábitats, visitantes y otras entidades relacionadas.

Cada tabla corresponde a una entidad del zoológico, conectada mediante claves foráneas 
que garantizan la integridad referencial y reducen la redundancia de datos. La estructura 
está diseñada según los principios de la Cuarta Forma Normal (4FN) para optimizar la organización 
de la información.

Tablas Principales:
  - ANIMALES: Almacena información específica de cada animal, incluyendo su cuidador, hábitat y especie.
  - CUIDADOR: Registra los datos de los cuidadores, así como su especialidad en el cuidado de animales.
  - ESPECIE: Define las especies animales, con información sobre su familia taxonómica y estado de conservación.
  - HABITAT: Describe los hábitats del zoológico, junto con su ubicación, tipo de clima y costo base.
  - VISITANTES: Registra la información de los visitantes al zoológico y su tipo.

Tablas de Referencia:
  - ESPECIALIDAD: Enumera las especialidades de los cuidadores.
  - FAMILIA: Clasifica las especies en diferentes familias taxonómicas.
  - ESTADO_CONSERVACION: Describe los posibles estados de conservación de las especies.
  - UBICACION: Define las diferentes ubicaciones físicas del zoológico.
  - CLIMA: Enumera los tipos de clima asociados a los hábitats.
  - TIPO_VISITANTES: Define los tipos de visitantes y los descuentos asociados.

Tabla Intermedia:
  - HABITAT_VISITANTES: Relaciona los hábitats y visitantes, permitiendo rastrear los hábitats visitados y el costo final calculado.

Este diseño permite un seguimiento detallado y preciso de las actividades del zoológico, 
como asociar animales con sus cuidadores, hábitats y especies, además de analizar los patrones 
de visitas a cada hábitat. Las claves foráneas y referencias incluidas en el script aseguran que 
los datos estén correctamente vinculados y que se preserve la consistencia del sistema.
*/
Table ANIMALES {
  ID SERIAL [pk]
  Nombre VARCHAR(50) [not null]
  FechaNac DATE [null]
  IDCuidador SERIAL [ref: > CUIDADOR.ID]
  IDHabitat SERIAL [ref: > HABITAT.ID]
  IDEspecie SERIAL [ref: > ESPECIE.ID]
}

Table CUIDADOR {
  ID SERIAL [pk]
  Nombre VARCHAR(50) [not null]
  FechaContratacion DATE [not null]
  Salario NUMERIC(10,2) [not null]
  IDEspecialidad SERIAL [ref: > ESPECIALIDAD.ID]
}

Table ESPECIALIDAD {
  ID SERIAL [pk]
  Nombre VARCHAR(50) [not null]
}

Table ESPECIE {
  ID SERIAL [pk]
  Nombre VARCHAR(50) [not null]
  IDFamilia SERIAL [ref: > FAMILIA.ID]
  IDEstadoConservacion SERIAL [ref: > ESTADO_CONSERVACION.ID]
}

Table FAMILIA {
  ID SERIAL [pk]
  NombreCientifico VARCHAR(50) [not null]
  NombreComun VARCHAR(50) [not null]
}

Table ESTADO_CONSERVACION {
  ID SERIAL [pk]
  Codigo VARCHAR(2) [not null]
  Nombre VARCHAR(50) [not null]
  Descripcion VARCHAR(50) [not null]
}

Table HABITAT {
  ID SERIAL [pk]
  Nombre VARCHAR(50) [not null]
  CostoBase NUMERIC(10,2) [not null]
  IDUbicacion SERIAL [ref: > UBICACION.ID]
  IDClima SERIAL [ref: > CLIMA.ID]
}

Table UBICACION {
  ID SERIAL [pk]
  Nombre VARCHAR(50) [not null]
}

Table CLIMA {
  ID SERIAL [pk]
  Nombre VARCHAR(50) [not null]
}

Table TIPO_VISITANTES {
  ID SERIAL [pk]
  Nombre VARCHAR(50) [not null]
  Descuento NUMERIC(5, 2) [not null] //CHECK (Descuento BETWEEN 0 AND 100)
}


Table VISITANTES {
  ID SERIAL [pk]
  Nombre VARCHAR(50) [not null]
  IdTipoVisitantes  SERIAL [ref: > TIPO_VISITANTES.ID]
}

// Tabla intermedia
Table HABITAT_VISITANTES {
  ID SERIAL [pk]
  IDHabitat SERIAL [ref: > HABITAT.ID]
  IDVisitantes SERIAL [ref: > VISITANTES.ID]
  FechaVisita DATE [null] //DEFAULT CURRENT_DATE
  CostoFinal NUMERIC(10, 2) [not null]
}