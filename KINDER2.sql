/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     24/6/2021 0:48:51                            */
/*==============================================================*/


drop index RELATIONSHIP_17_FK;

drop index RELATIONSHIP_14_FK;

drop index RELATIONSHIP_8_FK;

drop index RELATIONSHIP_7_FK;

drop index CALIFICACION_PK;

drop table CALIFICACION;

drop index RELATIONSHIP_16_FK;

drop index DATO_ESTUDIANTE_PK;

drop table DATO_ESTUDIANTE;

drop index RELATIONSHIP_18_FK;

drop index ESTUDIANTE_PK;

drop table ESTUDIANTE;

drop index RELATIONSHIP_13_FK;

drop index RELATIONSHIP_15_FK;

drop index RELATIONSHIP_11_FK;

drop index MATRICULA_PK;

drop table MATRICULA;

drop index PERIODO_PK;

drop table PERIODO;

drop index PROFESOR_PK;

drop table PROFESIONAL;

drop index RELATIONSHIP_3_FK;

drop index MATERIA_PK;

drop table PROGRAMA;

drop index TUTOR_PK;

drop table TUTOR;

/*==============================================================*/
/* Table: CALIFICACION                                          */
/*==============================================================*/
create table CALIFICACION (
   ID_CALIFICACION      SERIAL               not null,
   ID_NINO              INT4                 null,
   ID_PROFESIONAL       INT4                 null,
   ID_PERIODO           INT4                 null,
   ID_PROGRAMA          INT4                 null,
   CALIFICACION         VARCHAR(50)          not null,
   constraint PK_CALIFICACION primary key (ID_CALIFICACION)
);

/*==============================================================*/
/* Index: CALIFICACION_PK                                       */
/*==============================================================*/
create unique index CALIFICACION_PK on CALIFICACION (
ID_CALIFICACION
);

/*==============================================================*/
/* Index: RELATIONSHIP_7_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_7_FK on CALIFICACION (
ID_NINO
);

/*==============================================================*/
/* Index: RELATIONSHIP_8_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_8_FK on CALIFICACION (
ID_PROFESIONAL
);

/*==============================================================*/
/* Index: RELATIONSHIP_14_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_14_FK on CALIFICACION (
ID_PERIODO
);

/*==============================================================*/
/* Index: RELATIONSHIP_17_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_17_FK on CALIFICACION (
ID_PROGRAMA
);

/*==============================================================*/
/* Table: DATO_ESTUDIANTE                                       */
/*==============================================================*/
create table DATO_ESTUDIANTE (
   ID_DETALLE           SERIAL               not null,
   ID_NINO              INT4                 null,
   DOMICILIO_NINO       VARCHAR(50)          not null,
   TALLA_VESTIMENTA     VARCHAR(50)          not null,
   TALLA_ZAPATOS        VARCHAR(50)          not null,
   ALERGIAS             VARCHAR(50)          null,
   MEDICAMENTOS         VARCHAR(50)          null,
   ULTIMA_ENFERMEDAD    VARCHAR(50)          not null,
   DIAGNOSTICO          VARCHAR(50)          null,
   DOCTOR_RECURENTE     VARCHAR(50)          null,
   C_I_PADRE            VARCHAR(10)          not null,
   NOMBRES_PADRE        VARCHAR(50)          not null,
   APELLIDOS_PADRE      VARCHAR(50)          not null,
   DOMICILIO_PADRE      VARCHAR(50)          null,
   TELF_PADRE           VARCHAR(10)          null,
   C_I_MADRE            VARCHAR(10)          not null,
   NOMBRES_MADRE        VARCHAR(50)          not null,
   APELLIDOS_MADRE      VARCHAR(50)          not null,
   DOMICILIO_MADRE      VARCHAR(50)          null,
   TELF_MADRE           VARCHAR(10)          null,
   PADRE_ACTIVO         VARCHAR(10)          not null,
   MADRE_ACTIVA         VARCHAR(10)          not null,
   constraint PK_DATO_ESTUDIANTE primary key (ID_DETALLE)
);

/*==============================================================*/
/* Index: DATO_ESTUDIANTE_PK                                    */
/*==============================================================*/
create unique index DATO_ESTUDIANTE_PK on DATO_ESTUDIANTE (
ID_DETALLE
);

/*==============================================================*/
/* Index: RELATIONSHIP_16_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_16_FK on DATO_ESTUDIANTE (
ID_NINO
);

/*==============================================================*/
/* Table: ESTUDIANTE                                            */
/*==============================================================*/
create table ESTUDIANTE (
   ID_NINO              SERIAL               not null,
   ID_TUTOR             INT4                 null,
   C_I__NINO            VARCHAR(10)          not null,
   NOMBRES_NINOS        VARCHAR(50)          not null,
   APELLIDOS_NINOS      VARCHAR(50)          not null,
   NACIMIENTO_NINO      DATE                 not null,
   GENERO_NINO          VARCHAR(20)          not null,
   constraint PK_ESTUDIANTE primary key (ID_NINO)
);

/*==============================================================*/
/* Index: ESTUDIANTE_PK                                         */
/*==============================================================*/
create unique index ESTUDIANTE_PK on ESTUDIANTE (
ID_NINO
);

/*==============================================================*/
/* Index: RELATIONSHIP_18_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_18_FK on ESTUDIANTE (
ID_TUTOR
);

/*==============================================================*/
/* Table: MATRICULA                                             */
/*==============================================================*/
create table MATRICULA (
   ID_MATRICULA         SERIAL               not null,
   ID_NINO              INT4                 null,
   ID_PERIODO           INT4                 null,
   ID_PROGRAMA          INT4                 null,
   constraint PK_MATRICULA primary key (ID_MATRICULA)
);

/*==============================================================*/
/* Index: MATRICULA_PK                                          */
/*==============================================================*/
create unique index MATRICULA_PK on MATRICULA (
ID_MATRICULA
);

/*==============================================================*/
/* Index: RELATIONSHIP_11_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_11_FK on MATRICULA (
ID_NINO
);

/*==============================================================*/
/* Index: RELATIONSHIP_15_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_15_FK on MATRICULA (
ID_PERIODO
);

/*==============================================================*/
/* Index: RELATIONSHIP_13_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_13_FK on MATRICULA (
ID_PROGRAMA
);

/*==============================================================*/
/* Table: PERIODO                                               */
/*==============================================================*/
create table PERIODO (
   ID_PERIODO           SERIAL               not null,
   FECHA_INICIO_PERIODO DATE                 not null,
   FECHA_FIN_PERIODO    DATE                 not null,
   ANO_LECTIVO          VARCHAR(10)          not null,
   constraint PK_PERIODO primary key (ID_PERIODO)
);

/*==============================================================*/
/* Index: PERIODO_PK                                            */
/*==============================================================*/
create unique index PERIODO_PK on PERIODO (
ID_PERIODO
);

/*==============================================================*/
/* Table: PROFESIONAL                                           */
/*==============================================================*/
create table PROFESIONAL (
   ID_PROFESIONAL       SERIAL               not null,
   C_I_PROFESIONAL      VARCHAR(10)          not null,
   NOMBRES_PROFESIONAL  VARCHAR(50)          not null,
   APELLIDOS_PROFESIONAL VARCHAR(50)          not null,
   NACIONALIDAD_PROFESIONAL VARCHAR(50)          not null,
   GENERO_PROFESIONAL   VARCHAR(50)          not null,
   DOMICILIO_PROFESIONAL VARCHAR(50)          not null,
   TELF_PROFESIONAL     VARCHAR(10)          not null,
   constraint PK_PROFESIONAL primary key (ID_PROFESIONAL)
);

/*==============================================================*/
/* Index: PROFESOR_PK                                           */
/*==============================================================*/
create unique index PROFESOR_PK on PROFESIONAL (
ID_PROFESIONAL
);

/*==============================================================*/
/* Table: PROGRAMA                                              */
/*==============================================================*/
create table PROGRAMA (
   ID_PROGRAMA          SERIAL               not null,
   ID_PROFESIONAL       INT4                 null,
   ACTIVIDAD_PROGRAMA   VARCHAR(50)          not null,
   DESCRIPCION_ACTIVIAD VARCHAR(50)          not null,
   MATERIALES_ACTIVIDAD VARCHAR(200)         not null,
   DURACION_PROGRAMA    VARCHAR(20)          not null,
   NUM_CERTIFICADO      VARCHAR(50)          not null,
   constraint PK_PROGRAMA primary key (ID_PROGRAMA)
);

/*==============================================================*/
/* Index: MATERIA_PK                                            */
/*==============================================================*/
create unique index MATERIA_PK on PROGRAMA (
ID_PROGRAMA
);

/*==============================================================*/
/* Index: RELATIONSHIP_3_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_3_FK on PROGRAMA (
ID_PROFESIONAL
);

/*==============================================================*/
/* Table: TUTOR                                                 */
/*==============================================================*/
create table TUTOR (
   ID_TUTOR             SERIAL               not null,
   C_I_TUTOR            VARCHAR(10)          not null,
   NOMBRES_TUTOR        VARCHAR(50)          not null,
   APELLIDOS_TUTOR      VARCHAR(50)          not null,
   NACIONALIDAD_TUTOR   VARCHAR(50)          not null,
   DIRECCION_TUTOR      VARCHAR(50)          not null,
   TELF_HOGAR           VARCHAR(10)          not null,
   TELF_PERSONAL        VARCHAR(10)          not null,
   GENERO_TUTOR         VARCHAR(20)          not null,
   constraint PK_TUTOR primary key (ID_TUTOR)
);

/*==============================================================*/
/* Index: TUTOR_PK                                              */
/*==============================================================*/
create unique index TUTOR_PK on TUTOR (
ID_TUTOR
);

alter table CALIFICACION
   add constraint FK_CALIFICA_RELATIONS_PERIODO foreign key (ID_PERIODO)
      references PERIODO (ID_PERIODO)
      on delete restrict on update restrict;

alter table CALIFICACION
   add constraint FK_CALIFICA_RELATIONS_PROGRAMA foreign key (ID_PROGRAMA)
      references PROGRAMA (ID_PROGRAMA)
      on delete restrict on update restrict;

alter table CALIFICACION
   add constraint FK_CALIFICA_RELATIONS_ESTUDIAN foreign key (ID_NINO)
      references ESTUDIANTE (ID_NINO)
      on delete restrict on update restrict;

alter table CALIFICACION
   add constraint FK_CALIFICA_RELATIONS_PROFESIO foreign key (ID_PROFESIONAL)
      references PROFESIONAL (ID_PROFESIONAL)
      on delete restrict on update restrict;

alter table DATO_ESTUDIANTE
   add constraint FK_DATO_EST_RELATIONS_ESTUDIAN foreign key (ID_NINO)
      references ESTUDIANTE (ID_NINO)
      on delete restrict on update restrict;

alter table ESTUDIANTE
   add constraint FK_ESTUDIAN_RELATIONS_TUTOR foreign key (ID_TUTOR)
      references TUTOR (ID_TUTOR)
      on delete restrict on update restrict;

alter table MATRICULA
   add constraint FK_MATRICUL_RELATIONS_ESTUDIAN foreign key (ID_NINO)
      references ESTUDIANTE (ID_NINO)
      on delete restrict on update restrict;

alter table MATRICULA
   add constraint FK_MATRICUL_RELATIONS_PROGRAMA foreign key (ID_PROGRAMA)
      references PROGRAMA (ID_PROGRAMA)
      on delete restrict on update restrict;

alter table MATRICULA
   add constraint FK_MATRICUL_RELATIONS_PERIODO foreign key (ID_PERIODO)
      references PERIODO (ID_PERIODO)
      on delete restrict on update restrict;

alter table PROGRAMA
   add constraint FK_PROGRAMA_RELATIONS_PROFESIO foreign key (ID_PROFESIONAL)
      references PROFESIONAL (ID_PROFESIONAL)
      on delete restrict on update restrict;

