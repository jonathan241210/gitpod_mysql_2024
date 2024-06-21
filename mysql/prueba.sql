drop DATABASE prueba;
CREATE DATABASE prueba;
USE prueba;

CREATE TABLE materias (
  id_materia int NOT NULL AUTO_INCREMENT,
  nombre_de_materia varchar(100) NOT NULL,
  cuatrimestre varchar(100) NOT NULL,
  PRIMARY KEY (id_materia)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOAD DATA LOCAL INFILE "materias.csv"
INTO TABLE materias
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

CREATE TABLE temas (
  id_tema int NOT NULL AUTO_INCREMENT,
  id_materia int NOT NULL,
  tema varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  dificultad int NOT NULL,
  PRIMARY KEY (id_tema),
  KEY temas_materias_FK (id_materia),
  CONSTRAINT temas_materias_FK FOREIGN KEY (id_materia) REFERENCES materias (id_materia) ON DELETE SET DEFAULT ON UPDATE SET DEFAULT,
  CONSTRAINT chk_dificultad CHECK (dificultad BETWEEN 1 AND 5)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOAD DATA LOCAL INFILE "temas.csv"
INTO TABLE temas
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;


CREATE TABLE preguntas (
  id_pregunta int NOT NULL AUTO_INCREMENT,
  id_tema int NOT NULL,
  pregunta varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  calidad_promt int NOT NULL,
  PRIMARY KEY (id_pregunta),
  KEY preguntas_temas_FK (id_tema),
  CONSTRAINT preguntas_temas_FK FOREIGN KEY (id_tema) REFERENCES temas (id_tema) ON DELETE SET DEFAULT ON UPDATE SET DEFAULT,
  CONSTRAINT chk_calidad_promt CHECK (calidad_promt >= 1 AND calidad_promt <= 5)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOAD DATA LOCAL INFILE "preguntas.csv"
INTO TABLE preguntas
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

CREATE TABLE respuestas (
  id_respuesta int NOT NULL AUTO_INCREMENT,
  id_pregunta int NOT NULL,
  respuesta text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  ai varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  calidad_respuesta int NOT NULL,
  PRIMARY KEY (id_respuesta),
  KEY respuestas_preguntas_FK (id_pregunta),
  CONSTRAINT respuestas_preguntas_FK FOREIGN KEY (id_pregunta) REFERENCES preguntas (id_pregunta) ON DELETE SET DEFAULT ON UPDATE SET DEFAULT,
  CONSTRAINT chk_calidad_respuesta CHECK (calidad_respuesta IN ('bueno', 'regular', 'malo'))
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOAD DATA LOCAL INFILE "respuestas.csv"
INTO TABLE respuestas
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;




