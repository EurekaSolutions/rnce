--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.2
-- Dumped by pg_dump version 9.3.2
-- Started on 2015-04-23 16:54:40

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 3422 (class 1262 OID 416550)
-- Dependencies: 3421
-- Name: rnc; Type: COMMENT; Schema: -; Owner: eureka
--

COMMENT ON DATABASE rnc IS 'Base de datos del sistema de Registro Nacional de Contratistas.';


--
-- TOC entry 6 (class 2615 OID 416551)
-- Name: activos; Type: SCHEMA; Schema: -; Owner: eureka
--

CREATE SCHEMA activos;


ALTER SCHEMA activos OWNER TO eureka;

--
-- TOC entry 7 (class 2615 OID 416552)
-- Name: cuentas; Type: SCHEMA; Schema: -; Owner: eureka
--

CREATE SCHEMA cuentas;


ALTER SCHEMA cuentas OWNER TO eureka;

--
-- TOC entry 344 (class 3079 OID 11750)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3425 (class 0 OID 0)
-- Dependencies: 344
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 343 (class 3079 OID 416553)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 3426 (class 0 OID 0)
-- Dependencies: 343
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET search_path = public, pg_catalog;

--
-- TOC entry 690 (class 1247 OID 416563)
-- Name: cooperativa_capital; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE cooperativa_capital AS ENUM (
    'SUPLEMENTARIO',
    'LIMITADO'
);


ALTER TYPE public.cooperativa_capital OWNER TO postgres;

--
-- TOC entry 693 (class 1247 OID 416568)
-- Name: cooperativa_distribuicion; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE cooperativa_distribuicion AS ENUM (
    'UTILIDADES',
    'EXCEDENTES'
);


ALTER TYPE public.cooperativa_distribuicion OWNER TO postgres;

--
-- TOC entry 696 (class 1247 OID 416574)
-- Name: objeto_empresa; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE objeto_empresa AS ENUM (
    'PRODUCTOR',
    'FABRICANTE',
    'FABRICANTE IMPORTADOR',
    'DISTRIBUIDOR',
    'DISTRIBUIDOR AUTORIZADO',
    'DISTRIBUIDOR IMPORTADOR',
    'DISTRIBUIDOR IMPORTADOR AUTORIZADO',
    'SERVICIOS BASICOS',
    'SERVICIOS PROFESIONALES',
    'SERVICIOS COMERCIALES',
    'SERVICIOS COMERCIALES AUTORIZADO',
    'OBRA'
);


ALTER TYPE public.objeto_empresa OWNER TO postgres;

--
-- TOC entry 699 (class 1247 OID 416600)
-- Name: principio_contable; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE principio_contable AS ENUM (
    'PYME',
    'OSP',
    'FP',
    'PN',
    'COOPERATIVA',
    'ESPECIAL',
    'GRAN ENTIDAD',
    'EMPRESA DE SEGURO'
);


ALTER TYPE public.principio_contable OWNER TO postgres;

--
-- TOC entry 702 (class 1247 OID 416618)
-- Name: tipo_acta; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE tipo_acta AS ENUM (
    'CONSTITUTIVA',
    'ESTATUTARIA'
);


ALTER TYPE public.tipo_acta OWNER TO postgres;

--
-- TOC entry 705 (class 1247 OID 416624)
-- Name: tipo_capital; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE tipo_capital AS ENUM (
    'PRINCIPAL',
    'PAGO',
    'AUMENTO',
    'DISMINUCION',
    'CORRECCION MONETARIA'
);


ALTER TYPE public.tipo_capital OWNER TO postgres;

--
-- TOC entry 708 (class 1247 OID 416636)
-- Name: tipo_contrato; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE tipo_contrato AS ENUM (
    'OBRAS',
    'SERVICIOS',
    'BIENES'
);


ALTER TYPE public.tipo_contrato OWNER TO postgres;

--
-- TOC entry 711 (class 1247 OID 416644)
-- Name: tipo_cuenta_banco; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE tipo_cuenta_banco AS ENUM (
    'CUENTA CORRIENTE',
    'CUENTA CORRIENTE CON INTERESES / REMUNERADA',
    'CUENTA DE AHORROS',
    'CUENTA EN MONEDA EXTRANGERA'
);


ALTER TYPE public.tipo_cuenta_banco OWNER TO postgres;

--
-- TOC entry 714 (class 1247 OID 416654)
-- Name: tipo_estatus_banco; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE tipo_estatus_banco AS ENUM (
    'ACTIVA',
    'INACTIVA'
);


ALTER TYPE public.tipo_estatus_banco OWNER TO postgres;

--
-- TOC entry 717 (class 1247 OID 416660)
-- Name: tipo_moneda; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE tipo_moneda AS ENUM (
    'BOLIVARES',
    'DOLARES',
    'EUROS'
);


ALTER TYPE public.tipo_moneda OWNER TO postgres;

--
-- TOC entry 720 (class 1247 OID 416668)
-- Name: tipo_moneda_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE tipo_moneda_enum AS ENUM (
    'Nacional',
    'Extranjera'
);


ALTER TYPE public.tipo_moneda_enum OWNER TO postgres;

--
-- TOC entry 723 (class 1247 OID 416674)
-- Name: tipo_nacionalidad; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE tipo_nacionalidad AS ENUM (
    'NACIONAL',
    'EXTRANJERA'
);


ALTER TYPE public.tipo_nacionalidad OWNER TO postgres;

--
-- TOC entry 726 (class 1247 OID 416680)
-- Name: tipo_objeto_social; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE tipo_objeto_social AS ENUM (
    'PRINCIPAL',
    'AMPLIACION',
    'MODIFICACION PARCIAL',
    'MODIFICACION TOTAL'
);


ALTER TYPE public.tipo_objeto_social OWNER TO postgres;

--
-- TOC entry 729 (class 1247 OID 416690)
-- Name: tipo_poliza; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE tipo_poliza AS ENUM (
    'PATRIMONIALES',
    'PERSONAS'
);


ALTER TYPE public.tipo_poliza OWNER TO postgres;

--
-- TOC entry 732 (class 1247 OID 416696)
-- Name: tipo_profesion; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE tipo_profesion AS ENUM (
    'CONTADOR PUBLICO',
    'ADMINISTRADOR',
    'ABOGADO'
);


ALTER TYPE public.tipo_profesion OWNER TO postgres;

--
-- TOC entry 735 (class 1247 OID 416704)
-- Name: tipo_relacion_empresa; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE tipo_relacion_empresa AS ENUM (
    'ACCIONISTA',
    'INVERSION',
    'CLIENTE',
    'PROVEEDOR',
    'CONVENIO',
    'FILIAL / SUBSIDIARIA'
);


ALTER TYPE public.tipo_relacion_empresa OWNER TO postgres;

--
-- TOC entry 738 (class 1247 OID 416718)
-- Name: tipo_sector; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE tipo_sector AS ENUM (
    'PUBLICO',
    'PRIVADO'
);


ALTER TYPE public.tipo_sector OWNER TO postgres;

--
-- TOC entry 741 (class 1247 OID 416724)
-- Name: tipo_sector_mixto; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE tipo_sector_mixto AS ENUM (
    'PUBLICO',
    'PRIVADO',
    'MIXTO'
);


ALTER TYPE public.tipo_sector_mixto OWNER TO postgres;

--
-- TOC entry 744 (class 1247 OID 416732)
-- Name: tipo_sus_pag; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE tipo_sus_pag AS ENUM (
    'SUSCRITA',
    'PAGADO'
);


ALTER TYPE public.tipo_sus_pag OWNER TO postgres;

SET search_path = activos, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 172 (class 1259 OID 416737)
-- Name: activos_biologicos; Type: TABLE; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE TABLE activos_biologicos (
    id integer NOT NULL,
    bien_id integer NOT NULL,
    catidad integer NOT NULL,
    certificado boolean DEFAULT false,
    num_certificado character varying(255),
    detalles character varying(255) NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone,
    sys_finalizado_el timestamp with time zone
);


ALTER TABLE activos.activos_biologicos OWNER TO eureka;

--
-- TOC entry 3427 (class 0 OID 0)
-- Dependencies: 172
-- Name: TABLE activos_biologicos; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON TABLE activos_biologicos IS 'Tabla que almacena los activos biologicos de los contratistas';


--
-- TOC entry 3428 (class 0 OID 0)
-- Dependencies: 172
-- Name: COLUMN activos_biologicos.id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN activos_biologicos.id IS 'Clave primaria';


--
-- TOC entry 3429 (class 0 OID 0)
-- Dependencies: 172
-- Name: COLUMN activos_biologicos.bien_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN activos_biologicos.bien_id IS 'Clave foranea a la tabla Bienes';


--
-- TOC entry 3430 (class 0 OID 0)
-- Dependencies: 172
-- Name: COLUMN activos_biologicos.catidad; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN activos_biologicos.catidad IS 'Numero de activos biologicos';


--
-- TOC entry 3431 (class 0 OID 0)
-- Dependencies: 172
-- Name: COLUMN activos_biologicos.certificado; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN activos_biologicos.certificado IS 'Si el activo biologico esta o no certificado';


--
-- TOC entry 3432 (class 0 OID 0)
-- Dependencies: 172
-- Name: COLUMN activos_biologicos.num_certificado; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN activos_biologicos.num_certificado IS 'Si el activo esta certifiado, numero de certificado';


--
-- TOC entry 3433 (class 0 OID 0)
-- Dependencies: 172
-- Name: COLUMN activos_biologicos.detalles; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN activos_biologicos.detalles IS 'Informacion de complemento al activo biologico';


--
-- TOC entry 3434 (class 0 OID 0)
-- Dependencies: 172
-- Name: COLUMN activos_biologicos.sys_status; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN activos_biologicos.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 3435 (class 0 OID 0)
-- Dependencies: 172
-- Name: COLUMN activos_biologicos.sys_creado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN activos_biologicos.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 3436 (class 0 OID 0)
-- Dependencies: 172
-- Name: COLUMN activos_biologicos.sys_actualizado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN activos_biologicos.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 3437 (class 0 OID 0)
-- Dependencies: 172
-- Name: COLUMN activos_biologicos.sys_finalizado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN activos_biologicos.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 173 (class 1259 OID 416746)
-- Name: activos_biologicos_id_seq; Type: SEQUENCE; Schema: activos; Owner: eureka
--

CREATE SEQUENCE activos_biologicos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activos.activos_biologicos_id_seq OWNER TO eureka;

--
-- TOC entry 3438 (class 0 OID 0)
-- Dependencies: 173
-- Name: activos_biologicos_id_seq; Type: SEQUENCE OWNED BY; Schema: activos; Owner: eureka
--

ALTER SEQUENCE activos_biologicos_id_seq OWNED BY activos_biologicos.id;


--
-- TOC entry 174 (class 1259 OID 416748)
-- Name: activos_intangibles; Type: TABLE; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE TABLE activos_intangibles (
    id integer NOT NULL,
    bien_id integer NOT NULL,
    certificado_registro character varying(255),
    fecha_registro date,
    vigencia date NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone,
    sys_finalizado_el timestamp with time zone
);


ALTER TABLE activos.activos_intangibles OWNER TO eureka;

--
-- TOC entry 3439 (class 0 OID 0)
-- Dependencies: 174
-- Name: TABLE activos_intangibles; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON TABLE activos_intangibles IS 'Tabla que almacena los activos intangibles de los contratistas';


--
-- TOC entry 3440 (class 0 OID 0)
-- Dependencies: 174
-- Name: COLUMN activos_intangibles.id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN activos_intangibles.id IS 'Clave primaria';


--
-- TOC entry 3441 (class 0 OID 0)
-- Dependencies: 174
-- Name: COLUMN activos_intangibles.bien_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN activos_intangibles.bien_id IS 'Clave foranea a la tabla Bienes';


--
-- TOC entry 3442 (class 0 OID 0)
-- Dependencies: 174
-- Name: COLUMN activos_intangibles.certificado_registro; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN activos_intangibles.certificado_registro IS 'Certificado de registro';


--
-- TOC entry 3443 (class 0 OID 0)
-- Dependencies: 174
-- Name: COLUMN activos_intangibles.fecha_registro; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN activos_intangibles.fecha_registro IS 'Fecha de registro del activo intangible';


--
-- TOC entry 3444 (class 0 OID 0)
-- Dependencies: 174
-- Name: COLUMN activos_intangibles.vigencia; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN activos_intangibles.vigencia IS 'Vigencia del activo intangible';


--
-- TOC entry 3445 (class 0 OID 0)
-- Dependencies: 174
-- Name: COLUMN activos_intangibles.sys_status; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN activos_intangibles.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 3446 (class 0 OID 0)
-- Dependencies: 174
-- Name: COLUMN activos_intangibles.sys_creado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN activos_intangibles.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 3447 (class 0 OID 0)
-- Dependencies: 174
-- Name: COLUMN activos_intangibles.sys_actualizado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN activos_intangibles.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 3448 (class 0 OID 0)
-- Dependencies: 174
-- Name: COLUMN activos_intangibles.sys_finalizado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN activos_intangibles.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 175 (class 1259 OID 416753)
-- Name: activos_intangibles_id_seq; Type: SEQUENCE; Schema: activos; Owner: eureka
--

CREATE SEQUENCE activos_intangibles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activos.activos_intangibles_id_seq OWNER TO eureka;

--
-- TOC entry 3449 (class 0 OID 0)
-- Dependencies: 175
-- Name: activos_intangibles_id_seq; Type: SEQUENCE OWNED BY; Schema: activos; Owner: eureka
--

ALTER SEQUENCE activos_intangibles_id_seq OWNED BY activos_intangibles.id;


--
-- TOC entry 176 (class 1259 OID 416755)
-- Name: avaluos; Type: TABLE; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE TABLE avaluos (
    id integer NOT NULL,
    bien_id integer NOT NULL,
    valor numeric(38,6) NOT NULL,
    fecha_informe date NOT NULL,
    perito_id integer NOT NULL,
    gremio_id integer NOT NULL,
    num_inscripcion_gremio character varying(255) NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone,
    sys_finalizado_el timestamp with time zone
);


ALTER TABLE activos.avaluos OWNER TO eureka;

--
-- TOC entry 3450 (class 0 OID 0)
-- Dependencies: 176
-- Name: TABLE avaluos; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON TABLE avaluos IS 'Tabla donde se registran todos los avaluos de los contratistas';


--
-- TOC entry 3451 (class 0 OID 0)
-- Dependencies: 176
-- Name: COLUMN avaluos.id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN avaluos.id IS 'Clave primaria';


--
-- TOC entry 3452 (class 0 OID 0)
-- Dependencies: 176
-- Name: COLUMN avaluos.bien_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN avaluos.bien_id IS 'Clave foranea a la tabla Bienes';


--
-- TOC entry 3453 (class 0 OID 0)
-- Dependencies: 176
-- Name: COLUMN avaluos.valor; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN avaluos.valor IS 'Valor del avaluo';


--
-- TOC entry 3454 (class 0 OID 0)
-- Dependencies: 176
-- Name: COLUMN avaluos.fecha_informe; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN avaluos.fecha_informe IS 'Fecha del informe del Avaluo';


--
-- TOC entry 3455 (class 0 OID 0)
-- Dependencies: 176
-- Name: COLUMN avaluos.perito_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN avaluos.perito_id IS 'Clave foranea a la tabla Personas_Naturales';


--
-- TOC entry 3456 (class 0 OID 0)
-- Dependencies: 176
-- Name: COLUMN avaluos.gremio_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN avaluos.gremio_id IS 'Clave foranea a la tabla Sys_gremios';


--
-- TOC entry 3457 (class 0 OID 0)
-- Dependencies: 176
-- Name: COLUMN avaluos.num_inscripcion_gremio; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN avaluos.num_inscripcion_gremio IS 'Numero de incripcion del gremio';


--
-- TOC entry 3458 (class 0 OID 0)
-- Dependencies: 176
-- Name: COLUMN avaluos.sys_status; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN avaluos.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 3459 (class 0 OID 0)
-- Dependencies: 176
-- Name: COLUMN avaluos.sys_creado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN avaluos.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 3460 (class 0 OID 0)
-- Dependencies: 176
-- Name: COLUMN avaluos.sys_actualizado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN avaluos.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 3461 (class 0 OID 0)
-- Dependencies: 176
-- Name: COLUMN avaluos.sys_finalizado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN avaluos.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 177 (class 1259 OID 416760)
-- Name: avaluos_id_seq; Type: SEQUENCE; Schema: activos; Owner: eureka
--

CREATE SEQUENCE avaluos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activos.avaluos_id_seq OWNER TO eureka;

--
-- TOC entry 3462 (class 0 OID 0)
-- Dependencies: 177
-- Name: avaluos_id_seq; Type: SEQUENCE OWNED BY; Schema: activos; Owner: eureka
--

ALTER SEQUENCE avaluos_id_seq OWNED BY avaluos.id;


--
-- TOC entry 178 (class 1259 OID 416762)
-- Name: bienes; Type: TABLE; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE TABLE bienes (
    id integer NOT NULL,
    sys_tipo_bien_id integer NOT NULL,
    principio_contable integer NOT NULL,
    depreciable boolean DEFAULT true NOT NULL,
    deterioro boolean DEFAULT true NOT NULL,
    detalle character varying(255),
    origen character varying(255) NOT NULL,
    fecha_origen date NOT NULL,
    contratista_id integer NOT NULL,
    propio boolean DEFAULT true NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone,
    sys_finalizado_el timestamp with time zone
);


ALTER TABLE activos.bienes OWNER TO eureka;

--
-- TOC entry 3463 (class 0 OID 0)
-- Dependencies: 178
-- Name: TABLE bienes; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON TABLE bienes IS 'Tabla donde se almacenan los bienes que posee la empresa';


--
-- TOC entry 3464 (class 0 OID 0)
-- Dependencies: 178
-- Name: COLUMN bienes.id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN bienes.id IS 'Clave primaria';


--
-- TOC entry 3465 (class 0 OID 0)
-- Dependencies: 178
-- Name: COLUMN bienes.sys_tipo_bien_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN bienes.sys_tipo_bien_id IS 'Clave foranea a la tabla sys_tipo_bien';


--
-- TOC entry 3466 (class 0 OID 0)
-- Dependencies: 178
-- Name: COLUMN bienes.principio_contable; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN bienes.principio_contable IS 'Principio contable que aplica para el bien';


--
-- TOC entry 3467 (class 0 OID 0)
-- Dependencies: 178
-- Name: COLUMN bienes.depreciable; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN bienes.depreciable IS 'Si el bien es depreciable o no';


--
-- TOC entry 3468 (class 0 OID 0)
-- Dependencies: 178
-- Name: COLUMN bienes.deterioro; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN bienes.deterioro IS 'Si el bien tiene deterioro o no';


--
-- TOC entry 3469 (class 0 OID 0)
-- Dependencies: 178
-- Name: COLUMN bienes.detalle; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN bienes.detalle IS 'Descripcion complementaria';


--
-- TOC entry 3470 (class 0 OID 0)
-- Dependencies: 178
-- Name: COLUMN bienes.origen; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN bienes.origen IS 'Origen del bien';


--
-- TOC entry 3471 (class 0 OID 0)
-- Dependencies: 178
-- Name: COLUMN bienes.fecha_origen; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN bienes.fecha_origen IS 'Fecha de la adquisicion del bien';


--
-- TOC entry 3472 (class 0 OID 0)
-- Dependencies: 178
-- Name: COLUMN bienes.contratista_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN bienes.contratista_id IS 'Clave foranea al contratista';


--
-- TOC entry 3473 (class 0 OID 0)
-- Dependencies: 178
-- Name: COLUMN bienes.propio; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN bienes.propio IS 'Si el bien es o no propio';


--
-- TOC entry 3474 (class 0 OID 0)
-- Dependencies: 178
-- Name: COLUMN bienes.sys_status; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN bienes.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 3475 (class 0 OID 0)
-- Dependencies: 178
-- Name: COLUMN bienes.sys_creado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN bienes.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 3476 (class 0 OID 0)
-- Dependencies: 178
-- Name: COLUMN bienes.sys_actualizado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN bienes.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 3477 (class 0 OID 0)
-- Dependencies: 178
-- Name: COLUMN bienes.sys_finalizado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN bienes.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 179 (class 1259 OID 416773)
-- Name: bienes_id_seq; Type: SEQUENCE; Schema: activos; Owner: eureka
--

CREATE SEQUENCE bienes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activos.bienes_id_seq OWNER TO eureka;

--
-- TOC entry 3478 (class 0 OID 0)
-- Dependencies: 179
-- Name: bienes_id_seq; Type: SEQUENCE OWNED BY; Schema: activos; Owner: eureka
--

ALTER SEQUENCE bienes_id_seq OWNED BY bienes.id;


--
-- TOC entry 180 (class 1259 OID 416775)
-- Name: construcciones_inmuebles; Type: TABLE; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE TABLE construcciones_inmuebles (
    id integer NOT NULL,
    bien_id integer NOT NULL,
    area_construccion character varying(255) NOT NULL,
    porcentaje_ejecucion numeric(38,6) NOT NULL,
    monto_ejecutado numeric(38,6) NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone,
    sys_finalizado_el timestamp with time zone
);


ALTER TABLE activos.construcciones_inmuebles OWNER TO eureka;

--
-- TOC entry 3479 (class 0 OID 0)
-- Dependencies: 180
-- Name: TABLE construcciones_inmuebles; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON TABLE construcciones_inmuebles IS 'Tabla que contiene los inmuebles en construccion';


--
-- TOC entry 3480 (class 0 OID 0)
-- Dependencies: 180
-- Name: COLUMN construcciones_inmuebles.id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN construcciones_inmuebles.id IS 'Clave primaria';


--
-- TOC entry 3481 (class 0 OID 0)
-- Dependencies: 180
-- Name: COLUMN construcciones_inmuebles.bien_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN construcciones_inmuebles.bien_id IS 'Clave foranea a la tabla Bienes';


--
-- TOC entry 3482 (class 0 OID 0)
-- Dependencies: 180
-- Name: COLUMN construcciones_inmuebles.sys_status; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN construcciones_inmuebles.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 3483 (class 0 OID 0)
-- Dependencies: 180
-- Name: COLUMN construcciones_inmuebles.sys_creado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN construcciones_inmuebles.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 3484 (class 0 OID 0)
-- Dependencies: 180
-- Name: COLUMN construcciones_inmuebles.sys_actualizado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN construcciones_inmuebles.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 3485 (class 0 OID 0)
-- Dependencies: 180
-- Name: COLUMN construcciones_inmuebles.sys_finalizado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN construcciones_inmuebles.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 181 (class 1259 OID 416780)
-- Name: construcciones_inmuebles_id_seq; Type: SEQUENCE; Schema: activos; Owner: eureka
--

CREATE SEQUENCE construcciones_inmuebles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activos.construcciones_inmuebles_id_seq OWNER TO eureka;

--
-- TOC entry 3486 (class 0 OID 0)
-- Dependencies: 181
-- Name: construcciones_inmuebles_id_seq; Type: SEQUENCE OWNED BY; Schema: activos; Owner: eureka
--

ALTER SEQUENCE construcciones_inmuebles_id_seq OWNED BY construcciones_inmuebles.id;


--
-- TOC entry 182 (class 1259 OID 416782)
-- Name: datos_importaciones; Type: TABLE; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE TABLE datos_importaciones (
    id integer NOT NULL,
    bien_id integer NOT NULL,
    num_guia_nac character varying(100) NOT NULL,
    costo_adquisicion numeric(38,6) NOT NULL,
    gastos_mon_extranjera numeric(38,6) NOT NULL,
    sys_divisa_id integer NOT NULL,
    tasa_cambio numeric(38,6) NOT NULL,
    gastos_imp_nacional numeric(38,6) NOT NULL,
    otros_costros_imp_instalacion numeric(38,6) NOT NULL,
    total_costo_adquisicion numeric(38,6) NOT NULL,
    pais_origen_id integer NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone,
    sys_finalizado_el timestamp with time zone
);


ALTER TABLE activos.datos_importaciones OWNER TO eureka;

--
-- TOC entry 3487 (class 0 OID 0)
-- Dependencies: 182
-- Name: TABLE datos_importaciones; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON TABLE datos_importaciones IS 'Tabla que lleva adquisicion / Imporatada';


--
-- TOC entry 3488 (class 0 OID 0)
-- Dependencies: 182
-- Name: COLUMN datos_importaciones.id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN datos_importaciones.id IS 'Clave primaria';


--
-- TOC entry 3489 (class 0 OID 0)
-- Dependencies: 182
-- Name: COLUMN datos_importaciones.bien_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN datos_importaciones.bien_id IS 'Clave foranea a la tabla Bienes';


--
-- TOC entry 3490 (class 0 OID 0)
-- Dependencies: 182
-- Name: COLUMN datos_importaciones.num_guia_nac; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN datos_importaciones.num_guia_nac IS 'Numero de guia nacionalizacion';


--
-- TOC entry 3491 (class 0 OID 0)
-- Dependencies: 182
-- Name: COLUMN datos_importaciones.costo_adquisicion; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN datos_importaciones.costo_adquisicion IS 'Costo de la adquisicion';


--
-- TOC entry 3492 (class 0 OID 0)
-- Dependencies: 182
-- Name: COLUMN datos_importaciones.gastos_mon_extranjera; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN datos_importaciones.gastos_mon_extranjera IS 'Gastos en moneda extranjera';


--
-- TOC entry 3493 (class 0 OID 0)
-- Dependencies: 182
-- Name: COLUMN datos_importaciones.sys_divisa_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN datos_importaciones.sys_divisa_id IS 'Clave foranea a la tabla Sys_monedas';


--
-- TOC entry 3494 (class 0 OID 0)
-- Dependencies: 182
-- Name: COLUMN datos_importaciones.tasa_cambio; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN datos_importaciones.tasa_cambio IS 'Tasa de cambio al momento de la compra';


--
-- TOC entry 3495 (class 0 OID 0)
-- Dependencies: 182
-- Name: COLUMN datos_importaciones.otros_costros_imp_instalacion; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN datos_importaciones.otros_costros_imp_instalacion IS 'Otros gastos importacion';


--
-- TOC entry 3496 (class 0 OID 0)
-- Dependencies: 182
-- Name: COLUMN datos_importaciones.total_costo_adquisicion; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN datos_importaciones.total_costo_adquisicion IS 'Total de costo de la adquisicion';


--
-- TOC entry 3497 (class 0 OID 0)
-- Dependencies: 182
-- Name: COLUMN datos_importaciones.pais_origen_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN datos_importaciones.pais_origen_id IS 'Pais de origen de la importacion clave foranea a la tabla Sys_Paises';


--
-- TOC entry 3498 (class 0 OID 0)
-- Dependencies: 182
-- Name: COLUMN datos_importaciones.sys_status; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN datos_importaciones.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 3499 (class 0 OID 0)
-- Dependencies: 182
-- Name: COLUMN datos_importaciones.sys_creado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN datos_importaciones.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 3500 (class 0 OID 0)
-- Dependencies: 182
-- Name: COLUMN datos_importaciones.sys_actualizado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN datos_importaciones.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 3501 (class 0 OID 0)
-- Dependencies: 182
-- Name: COLUMN datos_importaciones.sys_finalizado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN datos_importaciones.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 183 (class 1259 OID 416787)
-- Name: datos_importacion_id_seq; Type: SEQUENCE; Schema: activos; Owner: eureka
--

CREATE SEQUENCE datos_importacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activos.datos_importacion_id_seq OWNER TO eureka;

--
-- TOC entry 3502 (class 0 OID 0)
-- Dependencies: 183
-- Name: datos_importacion_id_seq; Type: SEQUENCE OWNED BY; Schema: activos; Owner: eureka
--

ALTER SEQUENCE datos_importacion_id_seq OWNED BY datos_importaciones.id;


--
-- TOC entry 184 (class 1259 OID 416789)
-- Name: depreciaciones_amortizaciones; Type: TABLE; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE TABLE depreciaciones_amortizaciones (
    id integer NOT NULL,
    bien_id integer NOT NULL,
    costo_adquisicion_avaluo numeric(38,6) NOT NULL,
    fecha_adquisicion_avaluo date NOT NULL,
    vida_util integer NOT NULL,
    valor_residual numeric(38,6) NOT NULL,
    valor_depreciar numeric(38,6) NOT NULL,
    tasa_anual numeric(38,6) NOT NULL,
    unidades_estimadas integer NOT NULL,
    bs_unidad numeric(38,6) NOT NULL,
    unidades_producidas_periodo integer NOT NULL,
    unidades_consumidas integer NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone,
    sys_finalizado_el timestamp with time zone
);


ALTER TABLE activos.depreciaciones_amortizaciones OWNER TO eureka;

--
-- TOC entry 3503 (class 0 OID 0)
-- Dependencies: 184
-- Name: TABLE depreciaciones_amortizaciones; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON TABLE depreciaciones_amortizaciones IS 'Tabla que recoge todas las amortizaciones y depresiaciones de los activos';


--
-- TOC entry 3504 (class 0 OID 0)
-- Dependencies: 184
-- Name: COLUMN depreciaciones_amortizaciones.id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN depreciaciones_amortizaciones.id IS 'Clave foranea';


--
-- TOC entry 3505 (class 0 OID 0)
-- Dependencies: 184
-- Name: COLUMN depreciaciones_amortizaciones.bien_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN depreciaciones_amortizaciones.bien_id IS 'Clave foranea a la tabla Bienes';


--
-- TOC entry 3506 (class 0 OID 0)
-- Dependencies: 184
-- Name: COLUMN depreciaciones_amortizaciones.costo_adquisicion_avaluo; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN depreciaciones_amortizaciones.costo_adquisicion_avaluo IS 'Costro de adquisicion';


--
-- TOC entry 3507 (class 0 OID 0)
-- Dependencies: 184
-- Name: COLUMN depreciaciones_amortizaciones.fecha_adquisicion_avaluo; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN depreciaciones_amortizaciones.fecha_adquisicion_avaluo IS 'Fecha de adquisicion del avaluo';


--
-- TOC entry 3508 (class 0 OID 0)
-- Dependencies: 184
-- Name: COLUMN depreciaciones_amortizaciones.vida_util; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN depreciaciones_amortizaciones.vida_util IS 'Vida util, expresado en meses';


--
-- TOC entry 3509 (class 0 OID 0)
-- Dependencies: 184
-- Name: COLUMN depreciaciones_amortizaciones.sys_status; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN depreciaciones_amortizaciones.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 3510 (class 0 OID 0)
-- Dependencies: 184
-- Name: COLUMN depreciaciones_amortizaciones.sys_creado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN depreciaciones_amortizaciones.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 3511 (class 0 OID 0)
-- Dependencies: 184
-- Name: COLUMN depreciaciones_amortizaciones.sys_actualizado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN depreciaciones_amortizaciones.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 3512 (class 0 OID 0)
-- Dependencies: 184
-- Name: COLUMN depreciaciones_amortizaciones.sys_finalizado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN depreciaciones_amortizaciones.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 185 (class 1259 OID 416794)
-- Name: depresiaciones_amortizaciones_id_seq; Type: SEQUENCE; Schema: activos; Owner: eureka
--

CREATE SEQUENCE depresiaciones_amortizaciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activos.depresiaciones_amortizaciones_id_seq OWNER TO eureka;

--
-- TOC entry 3513 (class 0 OID 0)
-- Dependencies: 185
-- Name: depresiaciones_amortizaciones_id_seq; Type: SEQUENCE OWNED BY; Schema: activos; Owner: eureka
--

ALTER SEQUENCE depresiaciones_amortizaciones_id_seq OWNED BY depreciaciones_amortizaciones.id;


--
-- TOC entry 186 (class 1259 OID 416796)
-- Name: desincorporacion_activos; Type: TABLE; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE TABLE desincorporacion_activos (
    id integer NOT NULL,
    sys_motivo_id integer NOT NULL,
    fecha date NOT NULL,
    precio_venta numeric(38,6) DEFAULT 0 NOT NULL,
    valor_neto_libro numeric(8,6) NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone,
    sys_finalizado_el timestamp with time zone
);


ALTER TABLE activos.desincorporacion_activos OWNER TO eureka;

--
-- TOC entry 3514 (class 0 OID 0)
-- Dependencies: 186
-- Name: COLUMN desincorporacion_activos.id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN desincorporacion_activos.id IS 'Clave primaria';


--
-- TOC entry 3515 (class 0 OID 0)
-- Dependencies: 186
-- Name: COLUMN desincorporacion_activos.sys_motivo_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN desincorporacion_activos.sys_motivo_id IS 'Clave foranea a la tabla sys_motivos';


--
-- TOC entry 3516 (class 0 OID 0)
-- Dependencies: 186
-- Name: COLUMN desincorporacion_activos.sys_status; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN desincorporacion_activos.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 3517 (class 0 OID 0)
-- Dependencies: 186
-- Name: COLUMN desincorporacion_activos.sys_creado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN desincorporacion_activos.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 3518 (class 0 OID 0)
-- Dependencies: 186
-- Name: COLUMN desincorporacion_activos.sys_actualizado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN desincorporacion_activos.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 3519 (class 0 OID 0)
-- Dependencies: 186
-- Name: COLUMN desincorporacion_activos.sys_finalizado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN desincorporacion_activos.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 187 (class 1259 OID 416802)
-- Name: desincorporacion_activos_id_seq; Type: SEQUENCE; Schema: activos; Owner: eureka
--

CREATE SEQUENCE desincorporacion_activos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activos.desincorporacion_activos_id_seq OWNER TO eureka;

--
-- TOC entry 3520 (class 0 OID 0)
-- Dependencies: 187
-- Name: desincorporacion_activos_id_seq; Type: SEQUENCE OWNED BY; Schema: activos; Owner: eureka
--

ALTER SEQUENCE desincorporacion_activos_id_seq OWNED BY desincorporacion_activos.id;


--
-- TOC entry 188 (class 1259 OID 416804)
-- Name: deterioros; Type: TABLE; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE TABLE deterioros (
    id integer NOT NULL,
    bien_id integer NOT NULL,
    valor_razonable numeric(38,6) NOT NULL,
    costo_disposicion numeric(38,6) NOT NULL,
    valor_uso numeric(38,6) NOT NULL,
    acumulado_ejer_ant numeric(38,6),
    ejercicios_anteriores numeric(38,6),
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone,
    sys_finalizado_el timestamp with time zone
);


ALTER TABLE activos.deterioros OWNER TO eureka;

--
-- TOC entry 3521 (class 0 OID 0)
-- Dependencies: 188
-- Name: TABLE deterioros; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON TABLE deterioros IS 'Tabla donde se almacena el deterioro de los actvos';


--
-- TOC entry 3522 (class 0 OID 0)
-- Dependencies: 188
-- Name: COLUMN deterioros.id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN deterioros.id IS 'Clave primaria';


--
-- TOC entry 3523 (class 0 OID 0)
-- Dependencies: 188
-- Name: COLUMN deterioros.bien_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN deterioros.bien_id IS 'Clave foranea a la tabla Bienes';


--
-- TOC entry 3524 (class 0 OID 0)
-- Dependencies: 188
-- Name: COLUMN deterioros.valor_razonable; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN deterioros.valor_razonable IS 'Costo del valor razonable';


--
-- TOC entry 3525 (class 0 OID 0)
-- Dependencies: 188
-- Name: COLUMN deterioros.sys_status; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN deterioros.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 3526 (class 0 OID 0)
-- Dependencies: 188
-- Name: COLUMN deterioros.sys_creado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN deterioros.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 3527 (class 0 OID 0)
-- Dependencies: 188
-- Name: COLUMN deterioros.sys_actualizado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN deterioros.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 3528 (class 0 OID 0)
-- Dependencies: 188
-- Name: COLUMN deterioros.sys_finalizado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN deterioros.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 189 (class 1259 OID 416809)
-- Name: deterioros_id_seq; Type: SEQUENCE; Schema: activos; Owner: eureka
--

CREATE SEQUENCE deterioros_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activos.deterioros_id_seq OWNER TO eureka;

--
-- TOC entry 3529 (class 0 OID 0)
-- Dependencies: 189
-- Name: deterioros_id_seq; Type: SEQUENCE OWNED BY; Schema: activos; Owner: eureka
--

ALTER SEQUENCE deterioros_id_seq OWNED BY deterioros.id;


--
-- TOC entry 190 (class 1259 OID 416811)
-- Name: documentos_registrados; Type: TABLE; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE TABLE documentos_registrados (
    id integer NOT NULL,
    contratista_id integer NOT NULL,
    sys_tipo_documento_id integer NOT NULL,
    sys_tipo_registro_id integer NOT NULL,
    circunscripcion character varying(255) NOT NULL,
    num_registro_notaria character varying(255) NOT NULL,
    tomo character varying(100) NOT NULL,
    folio character varying(100) NOT NULL,
    fecha_registro date NOT NULL,
    valor_adquisicion numeric(38,6) NOT NULL,
    fecha_asamblea date,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone,
    sys_finalizado_el timestamp with time zone
);


ALTER TABLE activos.documentos_registrados OWNER TO eureka;

--
-- TOC entry 3530 (class 0 OID 0)
-- Dependencies: 190
-- Name: TABLE documentos_registrados; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON TABLE documentos_registrados IS 'Tabla que almacena los documentos registrados';


--
-- TOC entry 3531 (class 0 OID 0)
-- Dependencies: 190
-- Name: COLUMN documentos_registrados.id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN documentos_registrados.id IS 'Clave primaria';


--
-- TOC entry 3532 (class 0 OID 0)
-- Dependencies: 190
-- Name: COLUMN documentos_registrados.contratista_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN documentos_registrados.contratista_id IS 'Clave foranea a la tabla Contratistas';


--
-- TOC entry 3533 (class 0 OID 0)
-- Dependencies: 190
-- Name: COLUMN documentos_registrados.sys_tipo_documento_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN documentos_registrados.sys_tipo_documento_id IS 'Clave foranea a la tabla Tipo de documento';


--
-- TOC entry 3534 (class 0 OID 0)
-- Dependencies: 190
-- Name: COLUMN documentos_registrados.sys_tipo_registro_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN documentos_registrados.sys_tipo_registro_id IS 'Clave foranea a la tabla Tipo Registro';


--
-- TOC entry 3535 (class 0 OID 0)
-- Dependencies: 190
-- Name: COLUMN documentos_registrados.circunscripcion; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN documentos_registrados.circunscripcion IS 'Circunscripcion donde registro el documento';


--
-- TOC entry 3536 (class 0 OID 0)
-- Dependencies: 190
-- Name: COLUMN documentos_registrados.num_registro_notaria; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN documentos_registrados.num_registro_notaria IS 'Numero del documento registrado';


--
-- TOC entry 3537 (class 0 OID 0)
-- Dependencies: 190
-- Name: COLUMN documentos_registrados.tomo; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN documentos_registrados.tomo IS 'Tomo del documento registrado';


--
-- TOC entry 3538 (class 0 OID 0)
-- Dependencies: 190
-- Name: COLUMN documentos_registrados.folio; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN documentos_registrados.folio IS 'Folio del documento registrado';


--
-- TOC entry 3539 (class 0 OID 0)
-- Dependencies: 190
-- Name: COLUMN documentos_registrados.fecha_registro; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN documentos_registrados.fecha_registro IS 'Fecha del registro del documento';


--
-- TOC entry 3540 (class 0 OID 0)
-- Dependencies: 190
-- Name: COLUMN documentos_registrados.valor_adquisicion; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN documentos_registrados.valor_adquisicion IS 'Costo de adquisicion';


--
-- TOC entry 3541 (class 0 OID 0)
-- Dependencies: 190
-- Name: COLUMN documentos_registrados.fecha_asamblea; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN documentos_registrados.fecha_asamblea IS 'Fechade la asamblea en caso de ser un acta';


--
-- TOC entry 3542 (class 0 OID 0)
-- Dependencies: 190
-- Name: COLUMN documentos_registrados.sys_status; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN documentos_registrados.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 3543 (class 0 OID 0)
-- Dependencies: 190
-- Name: COLUMN documentos_registrados.sys_creado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN documentos_registrados.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 3544 (class 0 OID 0)
-- Dependencies: 190
-- Name: COLUMN documentos_registrados.sys_actualizado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN documentos_registrados.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 3545 (class 0 OID 0)
-- Dependencies: 190
-- Name: COLUMN documentos_registrados.sys_finalizado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN documentos_registrados.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 191 (class 1259 OID 416819)
-- Name: documentos_registrados_id_seq; Type: SEQUENCE; Schema: activos; Owner: eureka
--

CREATE SEQUENCE documentos_registrados_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activos.documentos_registrados_id_seq OWNER TO eureka;

--
-- TOC entry 3546 (class 0 OID 0)
-- Dependencies: 191
-- Name: documentos_registrados_id_seq; Type: SEQUENCE OWNED BY; Schema: activos; Owner: eureka
--

ALTER SEQUENCE documentos_registrados_id_seq OWNED BY documentos_registrados.id;


--
-- TOC entry 192 (class 1259 OID 416821)
-- Name: fabricaciones_muebles; Type: TABLE; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE TABLE fabricaciones_muebles (
    id integer NOT NULL,
    bien_id integer NOT NULL,
    cantidad numeric(38,6) NOT NULL,
    porcentaje_fabricacion numeric(38,6) NOT NULL,
    monto_ejecutado numeric(38,6) NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone,
    sys_finalizado_el timestamp with time zone
);


ALTER TABLE activos.fabricaciones_muebles OWNER TO eureka;

--
-- TOC entry 3547 (class 0 OID 0)
-- Dependencies: 192
-- Name: TABLE fabricaciones_muebles; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON TABLE fabricaciones_muebles IS 'Tabla que contiene los muebles en fabricacion';


--
-- TOC entry 3548 (class 0 OID 0)
-- Dependencies: 192
-- Name: COLUMN fabricaciones_muebles.id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN fabricaciones_muebles.id IS 'Clave primaria';


--
-- TOC entry 3549 (class 0 OID 0)
-- Dependencies: 192
-- Name: COLUMN fabricaciones_muebles.bien_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN fabricaciones_muebles.bien_id IS 'Clave foranea a la tabla Bienes';


--
-- TOC entry 3550 (class 0 OID 0)
-- Dependencies: 192
-- Name: COLUMN fabricaciones_muebles.sys_status; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN fabricaciones_muebles.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 3551 (class 0 OID 0)
-- Dependencies: 192
-- Name: COLUMN fabricaciones_muebles.sys_creado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN fabricaciones_muebles.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 3552 (class 0 OID 0)
-- Dependencies: 192
-- Name: COLUMN fabricaciones_muebles.sys_actualizado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN fabricaciones_muebles.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 3553 (class 0 OID 0)
-- Dependencies: 192
-- Name: COLUMN fabricaciones_muebles.sys_finalizado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN fabricaciones_muebles.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 193 (class 1259 OID 416826)
-- Name: fabricaciones_muebles_id_seq; Type: SEQUENCE; Schema: activos; Owner: eureka
--

CREATE SEQUENCE fabricaciones_muebles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activos.fabricaciones_muebles_id_seq OWNER TO eureka;

--
-- TOC entry 3554 (class 0 OID 0)
-- Dependencies: 193
-- Name: fabricaciones_muebles_id_seq; Type: SEQUENCE OWNED BY; Schema: activos; Owner: eureka
--

ALTER SEQUENCE fabricaciones_muebles_id_seq OWNED BY fabricaciones_muebles.id;


--
-- TOC entry 194 (class 1259 OID 416828)
-- Name: facturas; Type: TABLE; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE TABLE facturas (
    id integer NOT NULL,
    num_factura character varying(255) NOT NULL,
    proveedor_id integer NOT NULL,
    fecha_emision date NOT NULL,
    imprenta_id integer NOT NULL,
    fecha_emision_talonario date NOT NULL,
    comprador_id integer NOT NULL,
    base_imponible_gravable numeric(38,6) NOT NULL,
    exento numeric(38,6),
    iva numeric(38,6) NOT NULL,
    contratista_id integer NOT NULL,
    bien_id integer NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone,
    sys_finalizado_el timestamp with time zone
);


ALTER TABLE activos.facturas OWNER TO eureka;

--
-- TOC entry 3555 (class 0 OID 0)
-- Dependencies: 194
-- Name: TABLE facturas; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON TABLE facturas IS 'Tabla que almacena las facturas de bienes de los contratistas';


--
-- TOC entry 3556 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN facturas.id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN facturas.id IS 'Clave primaria';


--
-- TOC entry 3557 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN facturas.num_factura; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN facturas.num_factura IS 'Numero de la factura del bien.';


--
-- TOC entry 3558 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN facturas.proveedor_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN facturas.proveedor_id IS 'Clave foranea a la tabla personas_juridicas';


--
-- TOC entry 3559 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN facturas.fecha_emision; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN facturas.fecha_emision IS 'Fecha de imision de la factura';


--
-- TOC entry 3560 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN facturas.imprenta_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN facturas.imprenta_id IS 'Clave foranea a la tabla personas_juridicas';


--
-- TOC entry 3561 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN facturas.fecha_emision_talonario; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN facturas.fecha_emision_talonario IS 'Fecha de emision del talonario';


--
-- TOC entry 3562 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN facturas.comprador_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN facturas.comprador_id IS 'Clave foranea a la tabla personas_juridicas';


--
-- TOC entry 3563 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN facturas.base_imponible_gravable; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN facturas.base_imponible_gravable IS 'Base imponible gravable del impuesto';


--
-- TOC entry 3564 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN facturas.iva; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN facturas.iva IS 'Impuesto valor agregado';


--
-- TOC entry 3565 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN facturas.contratista_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN facturas.contratista_id IS 'Clave foranea a la tabla contratista';


--
-- TOC entry 3566 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN facturas.bien_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN facturas.bien_id IS 'Clave foranea a la tabla Bienes';


--
-- TOC entry 3567 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN facturas.sys_status; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN facturas.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 3568 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN facturas.sys_creado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN facturas.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 3569 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN facturas.sys_actualizado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN facturas.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 3570 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN facturas.sys_finalizado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN facturas.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 195 (class 1259 OID 416833)
-- Name: facturas_id_seq; Type: SEQUENCE; Schema: activos; Owner: eureka
--

CREATE SEQUENCE facturas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activos.facturas_id_seq OWNER TO eureka;

--
-- TOC entry 3571 (class 0 OID 0)
-- Dependencies: 195
-- Name: facturas_id_seq; Type: SEQUENCE OWNED BY; Schema: activos; Owner: eureka
--

ALTER SEQUENCE facturas_id_seq OWNED BY facturas.id;


--
-- TOC entry 196 (class 1259 OID 416835)
-- Name: inmuebles; Type: TABLE; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE TABLE inmuebles (
    id integer NOT NULL,
    bien_id integer NOT NULL,
    descripcion text,
    direccion_ubicacion character varying(255) NOT NULL,
    ficha_catastral character varying(255) NOT NULL,
    zonificacion character varying(255) NOT NULL,
    extension character varying(255) NOT NULL,
    titulo_supletorio character varying(255),
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone,
    sys_finalizado_el timestamp with time zone
);


ALTER TABLE activos.inmuebles OWNER TO eureka;

--
-- TOC entry 3572 (class 0 OID 0)
-- Dependencies: 196
-- Name: COLUMN inmuebles.id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN inmuebles.id IS 'Clave foranea';


--
-- TOC entry 3573 (class 0 OID 0)
-- Dependencies: 196
-- Name: COLUMN inmuebles.bien_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN inmuebles.bien_id IS 'Clave foranea a la tabla bienes';


--
-- TOC entry 3574 (class 0 OID 0)
-- Dependencies: 196
-- Name: COLUMN inmuebles.descripcion; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN inmuebles.descripcion IS 'Descripcion del inmueble';


--
-- TOC entry 3575 (class 0 OID 0)
-- Dependencies: 196
-- Name: COLUMN inmuebles.direccion_ubicacion; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN inmuebles.direccion_ubicacion IS 'Direccion de ubicacion del inmueble';


--
-- TOC entry 3576 (class 0 OID 0)
-- Dependencies: 196
-- Name: COLUMN inmuebles.ficha_catastral; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN inmuebles.ficha_catastral IS 'Ficha catastral del inmueble';


--
-- TOC entry 3577 (class 0 OID 0)
-- Dependencies: 196
-- Name: COLUMN inmuebles.zonificacion; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN inmuebles.zonificacion IS 'Zonificacion del inmueble';


--
-- TOC entry 3578 (class 0 OID 0)
-- Dependencies: 196
-- Name: COLUMN inmuebles.extension; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN inmuebles.extension IS 'extension del inmueble';


--
-- TOC entry 3579 (class 0 OID 0)
-- Dependencies: 196
-- Name: COLUMN inmuebles.sys_status; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN inmuebles.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 3580 (class 0 OID 0)
-- Dependencies: 196
-- Name: COLUMN inmuebles.sys_creado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN inmuebles.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 3581 (class 0 OID 0)
-- Dependencies: 196
-- Name: COLUMN inmuebles.sys_actualizado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN inmuebles.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 3582 (class 0 OID 0)
-- Dependencies: 196
-- Name: COLUMN inmuebles.sys_finalizado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN inmuebles.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 197 (class 1259 OID 416843)
-- Name: inmuebles_id_seq; Type: SEQUENCE; Schema: activos; Owner: eureka
--

CREATE SEQUENCE inmuebles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activos.inmuebles_id_seq OWNER TO eureka;

--
-- TOC entry 3583 (class 0 OID 0)
-- Dependencies: 197
-- Name: inmuebles_id_seq; Type: SEQUENCE OWNED BY; Schema: activos; Owner: eureka
--

ALTER SEQUENCE inmuebles_id_seq OWNED BY inmuebles.id;


--
-- TOC entry 198 (class 1259 OID 416845)
-- Name: licencias; Type: TABLE; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE TABLE licencias (
    id integer NOT NULL,
    activo_intangible_id integer NOT NULL,
    numero character varying(255),
    fecha_adquisicion date,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone,
    sys_finalizado_el timestamp with time zone
);


ALTER TABLE activos.licencias OWNER TO eureka;

--
-- TOC entry 3584 (class 0 OID 0)
-- Dependencies: 198
-- Name: TABLE licencias; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON TABLE licencias IS 'Tabla de licencias del contratista';


--
-- TOC entry 3585 (class 0 OID 0)
-- Dependencies: 198
-- Name: COLUMN licencias.id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN licencias.id IS 'Clave primaria';


--
-- TOC entry 3586 (class 0 OID 0)
-- Dependencies: 198
-- Name: COLUMN licencias.activo_intangible_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN licencias.activo_intangible_id IS 'Clave foranea a la tabla Activos intangibles';


--
-- TOC entry 3587 (class 0 OID 0)
-- Dependencies: 198
-- Name: COLUMN licencias.numero; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN licencias.numero IS 'Numero de la licencia';


--
-- TOC entry 3588 (class 0 OID 0)
-- Dependencies: 198
-- Name: COLUMN licencias.fecha_adquisicion; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN licencias.fecha_adquisicion IS 'Fecha de adquisicion de la licencia';


--
-- TOC entry 3589 (class 0 OID 0)
-- Dependencies: 198
-- Name: COLUMN licencias.sys_status; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN licencias.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 3590 (class 0 OID 0)
-- Dependencies: 198
-- Name: COLUMN licencias.sys_creado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN licencias.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 3591 (class 0 OID 0)
-- Dependencies: 198
-- Name: COLUMN licencias.sys_actualizado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN licencias.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 3592 (class 0 OID 0)
-- Dependencies: 198
-- Name: COLUMN licencias.sys_finalizado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN licencias.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 199 (class 1259 OID 416850)
-- Name: licencia_id_seq; Type: SEQUENCE; Schema: activos; Owner: eureka
--

CREATE SEQUENCE licencia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activos.licencia_id_seq OWNER TO eureka;

--
-- TOC entry 3593 (class 0 OID 0)
-- Dependencies: 199
-- Name: licencia_id_seq; Type: SEQUENCE OWNED BY; Schema: activos; Owner: eureka
--

ALTER SEQUENCE licencia_id_seq OWNED BY licencias.id;


--
-- TOC entry 200 (class 1259 OID 416852)
-- Name: mediciones; Type: TABLE; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE TABLE mediciones (
    id integer NOT NULL,
    bien_id integer NOT NULL,
    medicion_activo boolean DEFAULT true,
    sys_metodo_medicion_id integer NOT NULL,
    aplica_deterioro boolean DEFAULT false,
    vinculado_proceso_productivo boolean DEFAULT false,
    vinculado_proceso_ventas boolean DEFAULT false,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone,
    sys_finalizado_el timestamp with time zone
);


ALTER TABLE activos.mediciones OWNER TO eureka;

--
-- TOC entry 3594 (class 0 OID 0)
-- Dependencies: 200
-- Name: TABLE mediciones; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON TABLE mediciones IS 'Tabla de medicion';


--
-- TOC entry 3595 (class 0 OID 0)
-- Dependencies: 200
-- Name: COLUMN mediciones.id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN mediciones.id IS 'Clave primaria';


--
-- TOC entry 3596 (class 0 OID 0)
-- Dependencies: 200
-- Name: COLUMN mediciones.bien_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN mediciones.bien_id IS 'Clave foranea a la tabla Bienes';


--
-- TOC entry 3597 (class 0 OID 0)
-- Dependencies: 200
-- Name: COLUMN mediciones.sys_metodo_medicion_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN mediciones.sys_metodo_medicion_id IS 'Clave foranea a la tabla sys metodo medicion';


--
-- TOC entry 3598 (class 0 OID 0)
-- Dependencies: 200
-- Name: COLUMN mediciones.sys_status; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN mediciones.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 3599 (class 0 OID 0)
-- Dependencies: 200
-- Name: COLUMN mediciones.sys_creado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN mediciones.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 3600 (class 0 OID 0)
-- Dependencies: 200
-- Name: COLUMN mediciones.sys_actualizado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN mediciones.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 3601 (class 0 OID 0)
-- Dependencies: 200
-- Name: COLUMN mediciones.sys_finalizado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN mediciones.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 201 (class 1259 OID 416861)
-- Name: medicion_id_seq; Type: SEQUENCE; Schema: activos; Owner: eureka
--

CREATE SEQUENCE medicion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activos.medicion_id_seq OWNER TO eureka;

--
-- TOC entry 3602 (class 0 OID 0)
-- Dependencies: 201
-- Name: medicion_id_seq; Type: SEQUENCE OWNED BY; Schema: activos; Owner: eureka
--

ALTER SEQUENCE medicion_id_seq OWNED BY mediciones.id;


--
-- TOC entry 202 (class 1259 OID 416863)
-- Name: mejoras_propiedades; Type: TABLE; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE TABLE mejoras_propiedades (
    id integer NOT NULL,
    clasificacion character varying(255) NOT NULL,
    sys_tipo_bien_id integer NOT NULL,
    principio_contable_id integer NOT NULL,
    depreciacion boolean DEFAULT true,
    deterioro boolean DEFAULT true,
    bien_id integer NOT NULL,
    monto numeric(38,6) NOT NULL,
    fecha date NOT NULL,
    capitalizable boolean DEFAULT true NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone,
    sys_finalizado_el timestamp with time zone
);


ALTER TABLE activos.mejoras_propiedades OWNER TO eureka;

--
-- TOC entry 3603 (class 0 OID 0)
-- Dependencies: 202
-- Name: COLUMN mejoras_propiedades.id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN mejoras_propiedades.id IS 'Clave foranea';


--
-- TOC entry 3604 (class 0 OID 0)
-- Dependencies: 202
-- Name: COLUMN mejoras_propiedades.sys_tipo_bien_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN mejoras_propiedades.sys_tipo_bien_id IS 'Clave foranea a la tabla Sys_tipo_bien';


--
-- TOC entry 3605 (class 0 OID 0)
-- Dependencies: 202
-- Name: COLUMN mejoras_propiedades.principio_contable_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN mejoras_propiedades.principio_contable_id IS 'Clave foranea a la tabla Formas_organizacion';


--
-- TOC entry 3606 (class 0 OID 0)
-- Dependencies: 202
-- Name: COLUMN mejoras_propiedades.bien_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN mejoras_propiedades.bien_id IS 'Clave foranea a la tabla Bienes';


--
-- TOC entry 3607 (class 0 OID 0)
-- Dependencies: 202
-- Name: COLUMN mejoras_propiedades.sys_status; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN mejoras_propiedades.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 3608 (class 0 OID 0)
-- Dependencies: 202
-- Name: COLUMN mejoras_propiedades.sys_creado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN mejoras_propiedades.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 3609 (class 0 OID 0)
-- Dependencies: 202
-- Name: COLUMN mejoras_propiedades.sys_actualizado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN mejoras_propiedades.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 3610 (class 0 OID 0)
-- Dependencies: 202
-- Name: COLUMN mejoras_propiedades.sys_finalizado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN mejoras_propiedades.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 203 (class 1259 OID 416871)
-- Name: mejoras_propiedad_id_seq; Type: SEQUENCE; Schema: activos; Owner: eureka
--

CREATE SEQUENCE mejoras_propiedad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activos.mejoras_propiedad_id_seq OWNER TO eureka;

--
-- TOC entry 3611 (class 0 OID 0)
-- Dependencies: 203
-- Name: mejoras_propiedad_id_seq; Type: SEQUENCE OWNED BY; Schema: activos; Owner: eureka
--

ALTER SEQUENCE mejoras_propiedad_id_seq OWNED BY mejoras_propiedades.id;


--
-- TOC entry 204 (class 1259 OID 416873)
-- Name: muebles; Type: TABLE; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE TABLE muebles (
    id integer NOT NULL,
    bien_id integer NOT NULL,
    marca character varying(255) NOT NULL,
    modelo character varying(255) NOT NULL,
    serial character varying(255) NOT NULL,
    cantidad integer NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone,
    sys_finalizado_el timestamp with time zone
);


ALTER TABLE activos.muebles OWNER TO eureka;

--
-- TOC entry 3612 (class 0 OID 0)
-- Dependencies: 204
-- Name: TABLE muebles; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON TABLE muebles IS 'Tabla que almacena todos los muebles de los contratistas';


--
-- TOC entry 3613 (class 0 OID 0)
-- Dependencies: 204
-- Name: COLUMN muebles.id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN muebles.id IS 'Clave primaria';


--
-- TOC entry 3614 (class 0 OID 0)
-- Dependencies: 204
-- Name: COLUMN muebles.bien_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN muebles.bien_id IS 'Clave foranea a la tabla Bienes';


--
-- TOC entry 3615 (class 0 OID 0)
-- Dependencies: 204
-- Name: COLUMN muebles.marca; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN muebles.marca IS 'Marca del inmueble';


--
-- TOC entry 3616 (class 0 OID 0)
-- Dependencies: 204
-- Name: COLUMN muebles.modelo; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN muebles.modelo IS 'Modelo del inmueble';


--
-- TOC entry 3617 (class 0 OID 0)
-- Dependencies: 204
-- Name: COLUMN muebles.serial; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN muebles.serial IS 'Serial del inmueble';


--
-- TOC entry 3618 (class 0 OID 0)
-- Dependencies: 204
-- Name: COLUMN muebles.cantidad; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN muebles.cantidad IS 'Cantidad';


--
-- TOC entry 3619 (class 0 OID 0)
-- Dependencies: 204
-- Name: COLUMN muebles.sys_status; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN muebles.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 3620 (class 0 OID 0)
-- Dependencies: 204
-- Name: COLUMN muebles.sys_creado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN muebles.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 3621 (class 0 OID 0)
-- Dependencies: 204
-- Name: COLUMN muebles.sys_actualizado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN muebles.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 3622 (class 0 OID 0)
-- Dependencies: 204
-- Name: COLUMN muebles.sys_finalizado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN muebles.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 205 (class 1259 OID 416881)
-- Name: muebles_id_seq; Type: SEQUENCE; Schema: activos; Owner: eureka
--

CREATE SEQUENCE muebles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activos.muebles_id_seq OWNER TO eureka;

--
-- TOC entry 3623 (class 0 OID 0)
-- Dependencies: 205
-- Name: muebles_id_seq; Type: SEQUENCE OWNED BY; Schema: activos; Owner: eureka
--

ALTER SEQUENCE muebles_id_seq OWNED BY muebles.id;


--
-- TOC entry 206 (class 1259 OID 416883)
-- Name: sys_clasificaciones_bienes_id_seq; Type: SEQUENCE; Schema: activos; Owner: eureka
--

CREATE SEQUENCE sys_clasificaciones_bienes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activos.sys_clasificaciones_bienes_id_seq OWNER TO eureka;

--
-- TOC entry 207 (class 1259 OID 416885)
-- Name: sys_clasificaciones_bienes; Type: TABLE; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE TABLE sys_clasificaciones_bienes (
    id integer DEFAULT nextval('sys_clasificaciones_bienes_id_seq'::regclass) NOT NULL,
    nombre character varying(255) NOT NULL,
    descripcion character varying(255),
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone,
    sys_finalizado_el timestamp with time zone
);


ALTER TABLE activos.sys_clasificaciones_bienes OWNER TO eureka;

--
-- TOC entry 3624 (class 0 OID 0)
-- Dependencies: 207
-- Name: TABLE sys_clasificaciones_bienes; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON TABLE sys_clasificaciones_bienes IS 'Tabla que contiene las clasificaciones de un bien';


--
-- TOC entry 3625 (class 0 OID 0)
-- Dependencies: 207
-- Name: COLUMN sys_clasificaciones_bienes.id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_clasificaciones_bienes.id IS 'Clave foranea';


--
-- TOC entry 3626 (class 0 OID 0)
-- Dependencies: 207
-- Name: COLUMN sys_clasificaciones_bienes.nombre; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_clasificaciones_bienes.nombre IS 'Nombre de la clasificacion';


--
-- TOC entry 3627 (class 0 OID 0)
-- Dependencies: 207
-- Name: COLUMN sys_clasificaciones_bienes.descripcion; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_clasificaciones_bienes.descripcion IS 'Informacion adicional';


--
-- TOC entry 3628 (class 0 OID 0)
-- Dependencies: 207
-- Name: COLUMN sys_clasificaciones_bienes.sys_status; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_clasificaciones_bienes.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 3629 (class 0 OID 0)
-- Dependencies: 207
-- Name: COLUMN sys_clasificaciones_bienes.sys_creado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_clasificaciones_bienes.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 3630 (class 0 OID 0)
-- Dependencies: 207
-- Name: COLUMN sys_clasificaciones_bienes.sys_actualizado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_clasificaciones_bienes.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 3631 (class 0 OID 0)
-- Dependencies: 207
-- Name: COLUMN sys_clasificaciones_bienes.sys_finalizado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_clasificaciones_bienes.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 208 (class 1259 OID 416894)
-- Name: sys_formas_org; Type: TABLE; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE TABLE sys_formas_org (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    descripcion text,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone,
    sys_finalizado_el timestamp with time zone
);


ALTER TABLE activos.sys_formas_org OWNER TO eureka;

--
-- TOC entry 3632 (class 0 OID 0)
-- Dependencies: 208
-- Name: TABLE sys_formas_org; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON TABLE sys_formas_org IS 'Tabla que almacena las formas de orgnizacion que pueden existir dentro del sistema';


--
-- TOC entry 3633 (class 0 OID 0)
-- Dependencies: 208
-- Name: COLUMN sys_formas_org.id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_formas_org.id IS 'Clave primaria';


--
-- TOC entry 3634 (class 0 OID 0)
-- Dependencies: 208
-- Name: COLUMN sys_formas_org.nombre; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_formas_org.nombre IS 'Nombre de la forma de organizacion';


--
-- TOC entry 3635 (class 0 OID 0)
-- Dependencies: 208
-- Name: COLUMN sys_formas_org.descripcion; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_formas_org.descripcion IS 'Descripcion adicional de la forma de organizacion';


--
-- TOC entry 3636 (class 0 OID 0)
-- Dependencies: 208
-- Name: COLUMN sys_formas_org.sys_status; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_formas_org.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 3637 (class 0 OID 0)
-- Dependencies: 208
-- Name: COLUMN sys_formas_org.sys_creado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_formas_org.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 3638 (class 0 OID 0)
-- Dependencies: 208
-- Name: COLUMN sys_formas_org.sys_actualizado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_formas_org.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 3639 (class 0 OID 0)
-- Dependencies: 208
-- Name: COLUMN sys_formas_org.sys_finalizado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_formas_org.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 209 (class 1259 OID 416902)
-- Name: sys_formas_org_id_seq; Type: SEQUENCE; Schema: activos; Owner: eureka
--

CREATE SEQUENCE sys_formas_org_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activos.sys_formas_org_id_seq OWNER TO eureka;

--
-- TOC entry 3640 (class 0 OID 0)
-- Dependencies: 209
-- Name: sys_formas_org_id_seq; Type: SEQUENCE OWNED BY; Schema: activos; Owner: eureka
--

ALTER SEQUENCE sys_formas_org_id_seq OWNED BY sys_formas_org.id;


--
-- TOC entry 210 (class 1259 OID 416904)
-- Name: sys_gremios; Type: TABLE; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE TABLE sys_gremios (
    id integer NOT NULL,
    persona_juridica_id integer NOT NULL,
    direccion text,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone,
    sys_finalizado_el timestamp with time zone
);


ALTER TABLE activos.sys_gremios OWNER TO eureka;

--
-- TOC entry 3641 (class 0 OID 0)
-- Dependencies: 210
-- Name: TABLE sys_gremios; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON TABLE sys_gremios IS 'Tabla donde almacena todos los gremios disponibles en el sistema';


--
-- TOC entry 3642 (class 0 OID 0)
-- Dependencies: 210
-- Name: COLUMN sys_gremios.id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_gremios.id IS 'Clave primaria';


--
-- TOC entry 3643 (class 0 OID 0)
-- Dependencies: 210
-- Name: COLUMN sys_gremios.persona_juridica_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_gremios.persona_juridica_id IS 'Clave foranea a la tabla Personas Juridicas';


--
-- TOC entry 3644 (class 0 OID 0)
-- Dependencies: 210
-- Name: COLUMN sys_gremios.direccion; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_gremios.direccion IS 'Informacion complementaria';


--
-- TOC entry 3645 (class 0 OID 0)
-- Dependencies: 210
-- Name: COLUMN sys_gremios.sys_status; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_gremios.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 3646 (class 0 OID 0)
-- Dependencies: 210
-- Name: COLUMN sys_gremios.sys_creado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_gremios.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 3647 (class 0 OID 0)
-- Dependencies: 210
-- Name: COLUMN sys_gremios.sys_actualizado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_gremios.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 3648 (class 0 OID 0)
-- Dependencies: 210
-- Name: COLUMN sys_gremios.sys_finalizado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_gremios.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 211 (class 1259 OID 416912)
-- Name: sys_gremios_id_seq; Type: SEQUENCE; Schema: activos; Owner: eureka
--

CREATE SEQUENCE sys_gremios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activos.sys_gremios_id_seq OWNER TO eureka;

--
-- TOC entry 3649 (class 0 OID 0)
-- Dependencies: 211
-- Name: sys_gremios_id_seq; Type: SEQUENCE OWNED BY; Schema: activos; Owner: eureka
--

ALTER SEQUENCE sys_gremios_id_seq OWNED BY sys_gremios.id;


--
-- TOC entry 212 (class 1259 OID 416914)
-- Name: sys_metodos_medicion; Type: TABLE; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE TABLE sys_metodos_medicion (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    descripcion character varying(255),
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone,
    sys_finalizado_el timestamp with time zone
);


ALTER TABLE activos.sys_metodos_medicion OWNER TO eureka;

--
-- TOC entry 3650 (class 0 OID 0)
-- Dependencies: 212
-- Name: TABLE sys_metodos_medicion; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON TABLE sys_metodos_medicion IS 'Tabla que almacena los metodos de medicion del sistema';


--
-- TOC entry 3651 (class 0 OID 0)
-- Dependencies: 212
-- Name: COLUMN sys_metodos_medicion.id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_metodos_medicion.id IS 'Clave primaria';


--
-- TOC entry 3652 (class 0 OID 0)
-- Dependencies: 212
-- Name: COLUMN sys_metodos_medicion.nombre; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_metodos_medicion.nombre IS 'Nombre del metodo de medicion';


--
-- TOC entry 3653 (class 0 OID 0)
-- Dependencies: 212
-- Name: COLUMN sys_metodos_medicion.descripcion; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_metodos_medicion.descripcion IS 'Informacion adicional';


--
-- TOC entry 3654 (class 0 OID 0)
-- Dependencies: 212
-- Name: COLUMN sys_metodos_medicion.sys_status; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_metodos_medicion.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 3655 (class 0 OID 0)
-- Dependencies: 212
-- Name: COLUMN sys_metodos_medicion.sys_creado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_metodos_medicion.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 3656 (class 0 OID 0)
-- Dependencies: 212
-- Name: COLUMN sys_metodos_medicion.sys_actualizado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_metodos_medicion.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 3657 (class 0 OID 0)
-- Dependencies: 212
-- Name: COLUMN sys_metodos_medicion.sys_finalizado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_metodos_medicion.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 213 (class 1259 OID 416922)
-- Name: sys_metodo_medicion_id_seq; Type: SEQUENCE; Schema: activos; Owner: eureka
--

CREATE SEQUENCE sys_metodo_medicion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activos.sys_metodo_medicion_id_seq OWNER TO eureka;

--
-- TOC entry 3658 (class 0 OID 0)
-- Dependencies: 213
-- Name: sys_metodo_medicion_id_seq; Type: SEQUENCE OWNED BY; Schema: activos; Owner: eureka
--

ALTER SEQUENCE sys_metodo_medicion_id_seq OWNED BY sys_metodos_medicion.id;


--
-- TOC entry 214 (class 1259 OID 416924)
-- Name: sys_motivos; Type: TABLE; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE TABLE sys_motivos (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    descripcion character varying(255),
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone,
    sys_finalizado_el timestamp with time zone
);


ALTER TABLE activos.sys_motivos OWNER TO eureka;

--
-- TOC entry 3659 (class 0 OID 0)
-- Dependencies: 214
-- Name: TABLE sys_motivos; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON TABLE sys_motivos IS 'Tabla donde se almacenan todos los posibles motivos del sistema';


--
-- TOC entry 3660 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN sys_motivos.id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_motivos.id IS 'Clave primaria';


--
-- TOC entry 3661 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN sys_motivos.nombre; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_motivos.nombre IS 'Nombre del motivo';


--
-- TOC entry 3662 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN sys_motivos.descripcion; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_motivos.descripcion IS 'Informacion complementaria';


--
-- TOC entry 3663 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN sys_motivos.sys_status; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_motivos.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 3664 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN sys_motivos.sys_creado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_motivos.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 3665 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN sys_motivos.sys_actualizado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_motivos.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 3666 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN sys_motivos.sys_finalizado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_motivos.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 215 (class 1259 OID 416932)
-- Name: sys_motivios_id_seq; Type: SEQUENCE; Schema: activos; Owner: eureka
--

CREATE SEQUENCE sys_motivios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activos.sys_motivios_id_seq OWNER TO eureka;

--
-- TOC entry 3667 (class 0 OID 0)
-- Dependencies: 215
-- Name: sys_motivios_id_seq; Type: SEQUENCE OWNED BY; Schema: activos; Owner: eureka
--

ALTER SEQUENCE sys_motivios_id_seq OWNED BY sys_motivos.id;


--
-- TOC entry 216 (class 1259 OID 416934)
-- Name: sys_tipos_bienes; Type: TABLE; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE TABLE sys_tipos_bienes (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    descripcion character varying(255),
    sys_clasificacion_bien_id integer NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone,
    sys_finalizado_el timestamp with time zone
);


ALTER TABLE activos.sys_tipos_bienes OWNER TO eureka;

--
-- TOC entry 3668 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN sys_tipos_bienes.id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_tipos_bienes.id IS 'Clave primaria';


--
-- TOC entry 3669 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN sys_tipos_bienes.nombre; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_tipos_bienes.nombre IS 'Nombre del tipo de bien.';


--
-- TOC entry 3670 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN sys_tipos_bienes.descripcion; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_tipos_bienes.descripcion IS 'Informacion adicional';


--
-- TOC entry 3671 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN sys_tipos_bienes.sys_clasificacion_bien_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_tipos_bienes.sys_clasificacion_bien_id IS 'Clave foranea a la tabla Sys_Clasificacion_bien_id';


--
-- TOC entry 3672 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN sys_tipos_bienes.sys_status; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_tipos_bienes.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 3673 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN sys_tipos_bienes.sys_creado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_tipos_bienes.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 3674 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN sys_tipos_bienes.sys_actualizado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_tipos_bienes.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 3675 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN sys_tipos_bienes.sys_finalizado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_tipos_bienes.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 217 (class 1259 OID 416942)
-- Name: sys_tipo_bien_id_seq; Type: SEQUENCE; Schema: activos; Owner: eureka
--

CREATE SEQUENCE sys_tipo_bien_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activos.sys_tipo_bien_id_seq OWNER TO eureka;

--
-- TOC entry 3676 (class 0 OID 0)
-- Dependencies: 217
-- Name: sys_tipo_bien_id_seq; Type: SEQUENCE OWNED BY; Schema: activos; Owner: eureka
--

ALTER SEQUENCE sys_tipo_bien_id_seq OWNED BY sys_tipos_bienes.id;


--
-- TOC entry 218 (class 1259 OID 416944)
-- Name: sys_tipos_documentos_id_seq; Type: SEQUENCE; Schema: activos; Owner: eureka
--

CREATE SEQUENCE sys_tipos_documentos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activos.sys_tipos_documentos_id_seq OWNER TO eureka;

--
-- TOC entry 219 (class 1259 OID 416946)
-- Name: sys_tipos_documentos; Type: TABLE; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE TABLE sys_tipos_documentos (
    id integer DEFAULT nextval('sys_tipos_documentos_id_seq'::regclass) NOT NULL,
    nombre character varying(255) NOT NULL,
    estado boolean DEFAULT true NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone,
    sys_finalizado_el timestamp with time zone
);


ALTER TABLE activos.sys_tipos_documentos OWNER TO eureka;

--
-- TOC entry 3677 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN sys_tipos_documentos.id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_tipos_documentos.id IS 'Clave foranea';


--
-- TOC entry 3678 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN sys_tipos_documentos.nombre; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_tipos_documentos.nombre IS 'Nombre del documento ';


--
-- TOC entry 3679 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN sys_tipos_documentos.estado; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_tipos_documentos.estado IS 'Si el documento se encuentra activo o no.';


--
-- TOC entry 3680 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN sys_tipos_documentos.sys_status; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_tipos_documentos.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 3681 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN sys_tipos_documentos.sys_creado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_tipos_documentos.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 3682 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN sys_tipos_documentos.sys_actualizado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_tipos_documentos.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 3683 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN sys_tipos_documentos.sys_finalizado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_tipos_documentos.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 220 (class 1259 OID 416953)
-- Name: sys_tipos_registros; Type: TABLE; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE TABLE sys_tipos_registros (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone,
    sys_finalizado_el timestamp with time zone
);


ALTER TABLE activos.sys_tipos_registros OWNER TO eureka;

--
-- TOC entry 3684 (class 0 OID 0)
-- Dependencies: 220
-- Name: TABLE sys_tipos_registros; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON TABLE sys_tipos_registros IS 'Tabla que almacena todos los tipos de registros en el sistema';


--
-- TOC entry 3685 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN sys_tipos_registros.id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_tipos_registros.id IS 'Clave primaria';


--
-- TOC entry 3686 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN sys_tipos_registros.nombre; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_tipos_registros.nombre IS 'Nombre del registro';


--
-- TOC entry 3687 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN sys_tipos_registros.sys_status; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_tipos_registros.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 3688 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN sys_tipos_registros.sys_creado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_tipos_registros.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 3689 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN sys_tipos_registros.sys_actualizado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_tipos_registros.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 3690 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN sys_tipos_registros.sys_finalizado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN sys_tipos_registros.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 221 (class 1259 OID 416958)
-- Name: sys_tipos_registros_id_seq; Type: SEQUENCE; Schema: activos; Owner: eureka
--

CREATE SEQUENCE sys_tipos_registros_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activos.sys_tipos_registros_id_seq OWNER TO eureka;

--
-- TOC entry 3691 (class 0 OID 0)
-- Dependencies: 221
-- Name: sys_tipos_registros_id_seq; Type: SEQUENCE OWNED BY; Schema: activos; Owner: eureka
--

ALTER SEQUENCE sys_tipos_registros_id_seq OWNED BY sys_tipos_registros.id;


--
-- TOC entry 222 (class 1259 OID 416960)
-- Name: vehiculos; Type: TABLE; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE TABLE vehiculos (
    id integer NOT NULL,
    mueble_id integer NOT NULL,
    anho integer NOT NULL,
    uso integer NOT NULL,
    num_certificado character varying(255) NOT NULL,
    placa character varying(15) NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone,
    sys_finalizado_el timestamp with time zone
);


ALTER TABLE activos.vehiculos OWNER TO eureka;

--
-- TOC entry 3692 (class 0 OID 0)
-- Dependencies: 222
-- Name: TABLE vehiculos; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON TABLE vehiculos IS 'Tabla que almacena un tipo de mueble';


--
-- TOC entry 3693 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN vehiculos.id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN vehiculos.id IS 'Clave primaria';


--
-- TOC entry 3694 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN vehiculos.mueble_id; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN vehiculos.mueble_id IS 'Clave foranea a la tabla Muebles';


--
-- TOC entry 3695 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN vehiculos.anho; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN vehiculos.anho IS 'Año';


--
-- TOC entry 3696 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN vehiculos.uso; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN vehiculos.uso IS 'Uso del vehiculo, expresado en meses';


--
-- TOC entry 3697 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN vehiculos.num_certificado; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN vehiculos.num_certificado IS 'Numero de certificado';


--
-- TOC entry 3698 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN vehiculos.placa; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN vehiculos.placa IS 'Numero de placa del vehiculo';


--
-- TOC entry 3699 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN vehiculos.sys_status; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN vehiculos.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 3700 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN vehiculos.sys_creado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN vehiculos.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 3701 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN vehiculos.sys_actualizado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN vehiculos.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 3702 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN vehiculos.sys_finalizado_el; Type: COMMENT; Schema: activos; Owner: eureka
--

COMMENT ON COLUMN vehiculos.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 223 (class 1259 OID 416965)
-- Name: vehiculos_id_seq; Type: SEQUENCE; Schema: activos; Owner: eureka
--

CREATE SEQUENCE vehiculos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activos.vehiculos_id_seq OWNER TO eureka;

--
-- TOC entry 3703 (class 0 OID 0)
-- Dependencies: 223
-- Name: vehiculos_id_seq; Type: SEQUENCE OWNED BY; Schema: activos; Owner: eureka
--

ALTER SEQUENCE vehiculos_id_seq OWNED BY vehiculos.id;


SET search_path = public, pg_catalog;

--
-- TOC entry 224 (class 1259 OID 416967)
-- Name: acciones; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE acciones (
    id integer NOT NULL,
    tipo_accion tipo_sus_pag,
    numero_principal integer,
    numero_comun integer,
    numero_preferencial integer,
    valor_principal numeric(38,6),
    valor_comun numeric(38,6),
    valor_preferencial numeric(38,6),
    capital_id integer NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone DEFAULT now(),
    sys_finalizado_el timestamp with time zone DEFAULT now()
);


ALTER TABLE public.acciones OWNER TO eureka;

--
-- TOC entry 3704 (class 0 OID 0)
-- Dependencies: 224
-- Name: TABLE acciones; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE acciones IS 'Tabla donde se almacenan las acciones sucritas o pagadas.';


--
-- TOC entry 3705 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN acciones.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN acciones.id IS 'Clave primaria';


--
-- TOC entry 3706 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN acciones.tipo_accion; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN acciones.tipo_accion IS 'Tipo de accion si es suscrito o pagado';


--
-- TOC entry 3707 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN acciones.numero_principal; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN acciones.numero_principal IS 'Numero de acciones principal en caso de ser un dato de la primera acta constitutiva';


--
-- TOC entry 3708 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN acciones.numero_comun; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN acciones.numero_comun IS 'Numero de acciones comunes en caso de existir un aumento de capital';


--
-- TOC entry 3709 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN acciones.numero_preferencial; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN acciones.numero_preferencial IS 'Numero de acciones preferenciales en caso de existir un aumento de capital';


--
-- TOC entry 3710 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN acciones.valor_principal; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN acciones.valor_principal IS 'Valor de las acciones principales';


--
-- TOC entry 3711 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN acciones.valor_comun; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN acciones.valor_comun IS 'Valor de las acciones comunes';


--
-- TOC entry 3712 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN acciones.valor_preferencial; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN acciones.valor_preferencial IS 'Valor de las acciones preferenciales';


--
-- TOC entry 3713 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN acciones.capital_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN acciones.capital_id IS 'CLave foranea a la tabla capitales';


--
-- TOC entry 3714 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN acciones.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN acciones.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 3715 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN acciones.sys_creado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN acciones.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 3716 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN acciones.sys_actualizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN acciones.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 3717 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN acciones.sys_finalizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN acciones.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 225 (class 1259 OID 416974)
-- Name: acciones_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE acciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.acciones_id_seq OWNER TO eureka;

--
-- TOC entry 3718 (class 0 OID 0)
-- Dependencies: 225
-- Name: acciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE acciones_id_seq OWNED BY acciones.id;


--
-- TOC entry 226 (class 1259 OID 416976)
-- Name: accionistas_otros; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE accionistas_otros (
    id integer NOT NULL,
    contratista_id integer NOT NULL,
    natural_juridica_id integer NOT NULL,
    porcentaje_accionario numeric(38,2) NOT NULL,
    valor_compra numeric(38,6) NOT NULL,
    fecha date NOT NULL,
    obligacion character varying(100) NOT NULL,
    accionista boolean NOT NULL,
    junta_directiva boolean NOT NULL,
    rep_legal boolean NOT NULL,
    cargo character varying(255),
    documento_registrado_id integer NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone DEFAULT now(),
    sys_finalizado_el timestamp with time zone DEFAULT now()
);


ALTER TABLE public.accionistas_otros OWNER TO eureka;

--
-- TOC entry 3719 (class 0 OID 0)
-- Dependencies: 226
-- Name: TABLE accionistas_otros; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE accionistas_otros IS 'Tabla donde se almacenan los accionistas, junta directivas, representantes legales de las contratistas';


--
-- TOC entry 3720 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN accionistas_otros.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN accionistas_otros.id IS 'Clave primaria';


--
-- TOC entry 3721 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN accionistas_otros.contratista_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN accionistas_otros.contratista_id IS 'Clave foranea a la tabla contratista';


--
-- TOC entry 3722 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN accionistas_otros.natural_juridica_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN accionistas_otros.natural_juridica_id IS 'Clave foranea a la tabla naturales_juridicos';


--
-- TOC entry 3723 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN accionistas_otros.porcentaje_accionario; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN accionistas_otros.porcentaje_accionario IS 'Porcentaje de acciones que tiene el accionista';


--
-- TOC entry 3724 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN accionistas_otros.valor_compra; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN accionistas_otros.valor_compra IS 'Precio de la accion al momento de su compra';


--
-- TOC entry 3725 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN accionistas_otros.fecha; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN accionistas_otros.fecha IS 'Fecha del momento que se compro la accion';


--
-- TOC entry 3726 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN accionistas_otros.obligacion; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN accionistas_otros.obligacion IS 'Tipo de firma separada / conjunta del contratista  registrado';


--
-- TOC entry 3727 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN accionistas_otros.accionista; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN accionistas_otros.accionista IS 'Si es o no es accionista';


--
-- TOC entry 3728 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN accionistas_otros.junta_directiva; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN accionistas_otros.junta_directiva IS 'Boolean si es parte de la junta directiva';


--
-- TOC entry 3729 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN accionistas_otros.rep_legal; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN accionistas_otros.rep_legal IS 'Representante legal';


--
-- TOC entry 3730 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN accionistas_otros.cargo; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN accionistas_otros.cargo IS 'El cargo de ser parte de la junta directiva';


--
-- TOC entry 3731 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN accionistas_otros.documento_registrado_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN accionistas_otros.documento_registrado_id IS 'Clave foranea a la tabla documentos_registrados del esquema activos';


--
-- TOC entry 3732 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN accionistas_otros.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN accionistas_otros.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 3733 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN accionistas_otros.sys_creado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN accionistas_otros.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 3734 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN accionistas_otros.sys_actualizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN accionistas_otros.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 3735 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN accionistas_otros.sys_finalizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN accionistas_otros.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 227 (class 1259 OID 416983)
-- Name: accionistas_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE accionistas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accionistas_id_seq OWNER TO eureka;

--
-- TOC entry 3736 (class 0 OID 0)
-- Dependencies: 227
-- Name: accionistas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE accionistas_id_seq OWNED BY accionistas_otros.id;


--
-- TOC entry 228 (class 1259 OID 416985)
-- Name: actas_constitutivas; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE actas_constitutivas (
    id integer NOT NULL,
    contratista_id integer NOT NULL,
    documento_registrado_id integer NOT NULL,
    capital_id integer NOT NULL,
    denominacion_comercial_id integer NOT NULL,
    duracion_empresa_id integer NOT NULL,
    objeto_social_id integer NOT NULL,
    razon_social_id integer NOT NULL,
    domicilio_id integer NOT NULL,
    accionista_otro integer NOT NULL,
    comisario_auditor_id integer NOT NULL,
    cierre_ejercicio_id integer NOT NULL,
    fecha_modificacion date NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone DEFAULT now(),
    sys_finalizado_el timestamp with time zone DEFAULT now()
);


ALTER TABLE public.actas_constitutivas OWNER TO eureka;

--
-- TOC entry 3737 (class 0 OID 0)
-- Dependencies: 228
-- Name: TABLE actas_constitutivas; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE actas_constitutivas IS 'Tabla donde se almacenan el acta constitutiva de la contratista.';


--
-- TOC entry 3738 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN actas_constitutivas.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN actas_constitutivas.id IS 'Clave primaria';


--
-- TOC entry 3739 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN actas_constitutivas.contratista_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN actas_constitutivas.contratista_id IS 'Clave foranea tabla contratistas';


--
-- TOC entry 3740 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN actas_constitutivas.documento_registrado_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN actas_constitutivas.documento_registrado_id IS 'Clave foranea a ala tabla documento registrado en el esquema activo';


--
-- TOC entry 3741 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN actas_constitutivas.capital_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN actas_constitutivas.capital_id IS 'Clave foranea a la tabla capitales';


--
-- TOC entry 3742 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN actas_constitutivas.denominacion_comercial_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN actas_constitutivas.denominacion_comercial_id IS 'Clave foranea a la tabla denominaciones_comerciales';


--
-- TOC entry 3743 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN actas_constitutivas.duracion_empresa_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN actas_constitutivas.duracion_empresa_id IS 'Clave foranea a la tabla duraciones_empresas';


--
-- TOC entry 3744 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN actas_constitutivas.objeto_social_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN actas_constitutivas.objeto_social_id IS 'Clave foranea a la tabla objetos_sociales';


--
-- TOC entry 3745 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN actas_constitutivas.razon_social_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN actas_constitutivas.razon_social_id IS 'Clave foranea a la tabla razones_sociales';


--
-- TOC entry 3746 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN actas_constitutivas.domicilio_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN actas_constitutivas.domicilio_id IS 'clave foranea a ala tabla domicilios';


--
-- TOC entry 3747 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN actas_constitutivas.accionista_otro; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN actas_constitutivas.accionista_otro IS 'Clave foraneaa a la tabla accionistas_otros';


--
-- TOC entry 3748 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN actas_constitutivas.comisario_auditor_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN actas_constitutivas.comisario_auditor_id IS 'Clave foranea a la tabla comisarios_auditores';


--
-- TOC entry 3749 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN actas_constitutivas.cierre_ejercicio_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN actas_constitutivas.cierre_ejercicio_id IS 'Clave foranea a la tabla cierre ejercicios';


--
-- TOC entry 3750 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN actas_constitutivas.fecha_modificacion; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN actas_constitutivas.fecha_modificacion IS 'Fecha de modificacion';


--
-- TOC entry 3751 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN actas_constitutivas.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN actas_constitutivas.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 3752 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN actas_constitutivas.sys_creado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN actas_constitutivas.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 3753 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN actas_constitutivas.sys_actualizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN actas_constitutivas.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 3754 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN actas_constitutivas.sys_finalizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN actas_constitutivas.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 229 (class 1259 OID 416992)
-- Name: actas_constitutivas_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE actas_constitutivas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.actas_constitutivas_id_seq OWNER TO eureka;

--
-- TOC entry 3755 (class 0 OID 0)
-- Dependencies: 229
-- Name: actas_constitutivas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE actas_constitutivas_id_seq OWNED BY actas_constitutivas.id;


--
-- TOC entry 230 (class 1259 OID 416994)
-- Name: actividades_economicas; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE actividades_economicas (
    id integer NOT NULL,
    ppal_caev_id integer NOT NULL,
    comp1_caev_id integer NOT NULL,
    comp2_caev_id integer NOT NULL,
    contratista_id integer NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone,
    sys_finalizado_el timestamp with time zone
);


ALTER TABLE public.actividades_economicas OWNER TO eureka;

--
-- TOC entry 3756 (class 0 OID 0)
-- Dependencies: 230
-- Name: TABLE actividades_economicas; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE actividades_economicas IS 'Tabla donde se almacenan todas las actividades economicas del contratista ';


--
-- TOC entry 3757 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN actividades_economicas.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN actividades_economicas.id IS 'Clave primaria';


--
-- TOC entry 3758 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN actividades_economicas.ppal_caev_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN actividades_economicas.ppal_caev_id IS 'Clave foranea sobre la actividad comercial principal';


--
-- TOC entry 3759 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN actividades_economicas.comp1_caev_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN actividades_economicas.comp1_caev_id IS 'Codigo de la actividad economica complementaria 1';


--
-- TOC entry 3760 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN actividades_economicas.comp2_caev_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN actividades_economicas.comp2_caev_id IS 'Codigo de la actividad economica complementaria 2';


--
-- TOC entry 3761 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN actividades_economicas.contratista_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN actividades_economicas.contratista_id IS 'Clave foranea a la tabla contratista';


--
-- TOC entry 3762 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN actividades_economicas.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN actividades_economicas.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 3763 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN actividades_economicas.sys_creado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN actividades_economicas.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 3764 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN actividades_economicas.sys_actualizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN actividades_economicas.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 3765 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN actividades_economicas.sys_finalizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN actividades_economicas.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 231 (class 1259 OID 416999)
-- Name: actividades_economicas_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE actividades_economicas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.actividades_economicas_id_seq OWNER TO eureka;

--
-- TOC entry 3766 (class 0 OID 0)
-- Dependencies: 231
-- Name: actividades_economicas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE actividades_economicas_id_seq OWNED BY actividades_economicas.id;


--
-- TOC entry 232 (class 1259 OID 417001)
-- Name: auth_assignment; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE auth_assignment (
    item_name character varying(64) NOT NULL,
    user_id integer NOT NULL,
    created_at integer
);


ALTER TABLE public.auth_assignment OWNER TO eureka;

--
-- TOC entry 233 (class 1259 OID 417004)
-- Name: auth_item; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE auth_item (
    name character varying(64) NOT NULL,
    type integer NOT NULL,
    description text,
    rule_name character varying(64),
    data text,
    created_at integer,
    updated_at integer,
    group_code character varying(64)
);


ALTER TABLE public.auth_item OWNER TO eureka;

--
-- TOC entry 234 (class 1259 OID 417010)
-- Name: auth_item_child; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE auth_item_child (
    parent character varying(64) NOT NULL,
    child character varying(64) NOT NULL
);


ALTER TABLE public.auth_item_child OWNER TO eureka;

--
-- TOC entry 235 (class 1259 OID 417013)
-- Name: auth_item_group; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE auth_item_group (
    code character varying(64) NOT NULL,
    name character varying(255) NOT NULL,
    created_at integer,
    updated_at integer
);


ALTER TABLE public.auth_item_group OWNER TO eureka;

--
-- TOC entry 236 (class 1259 OID 417016)
-- Name: auth_rule; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE auth_rule (
    name character varying(64) NOT NULL,
    data text,
    created_at integer,
    updated_at integer
);


ALTER TABLE public.auth_rule OWNER TO eureka;

--
-- TOC entry 237 (class 1259 OID 417022)
-- Name: bancos_contratistas; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE bancos_contratistas (
    id integer NOT NULL,
    banco_id integer NOT NULL,
    contratista_id integer NOT NULL,
    num_cuenta interval NOT NULL,
    tipo_moneda tipo_moneda NOT NULL,
    tipo_cuenta tipo_cuenta_banco NOT NULL,
    estatus_cuenta tipo_estatus_banco NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone DEFAULT now(),
    sys_finalizado_el timestamp with time zone DEFAULT now()
);


ALTER TABLE public.bancos_contratistas OWNER TO eureka;

--
-- TOC entry 3767 (class 0 OID 0)
-- Dependencies: 237
-- Name: TABLE bancos_contratistas; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE bancos_contratistas IS 'Tabla relacion donde se almacenan los bancos que tiene un contratista';


--
-- TOC entry 3768 (class 0 OID 0)
-- Dependencies: 237
-- Name: COLUMN bancos_contratistas.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN bancos_contratistas.id IS 'Clave primaria';


--
-- TOC entry 3769 (class 0 OID 0)
-- Dependencies: 237
-- Name: COLUMN bancos_contratistas.banco_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN bancos_contratistas.banco_id IS 'Clave foranea a la tabla bancos';


--
-- TOC entry 3770 (class 0 OID 0)
-- Dependencies: 237
-- Name: COLUMN bancos_contratistas.contratista_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN bancos_contratistas.contratista_id IS 'Clave foranea a tabla contratistas';


--
-- TOC entry 3771 (class 0 OID 0)
-- Dependencies: 237
-- Name: COLUMN bancos_contratistas.num_cuenta; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN bancos_contratistas.num_cuenta IS 'Numero de cuenta del contratista';


--
-- TOC entry 3772 (class 0 OID 0)
-- Dependencies: 237
-- Name: COLUMN bancos_contratistas.tipo_moneda; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN bancos_contratistas.tipo_moneda IS 'Tipo de moneda puede ser Bolivares, dolares, euros';


--
-- TOC entry 3773 (class 0 OID 0)
-- Dependencies: 237
-- Name: COLUMN bancos_contratistas.tipo_cuenta; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN bancos_contratistas.tipo_cuenta IS 'Tipo cuenta banco pueda ser Cuenta corriente, cuenta corriente con intereses / remunerada, cuenta de ahorros, cuenta en moneda extranjera';


--
-- TOC entry 3774 (class 0 OID 0)
-- Dependencies: 237
-- Name: COLUMN bancos_contratistas.estatus_cuenta; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN bancos_contratistas.estatus_cuenta IS 'Tipo de estatus puede ser Activa o Inactiva';


--
-- TOC entry 3775 (class 0 OID 0)
-- Dependencies: 237
-- Name: COLUMN bancos_contratistas.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN bancos_contratistas.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 3776 (class 0 OID 0)
-- Dependencies: 237
-- Name: COLUMN bancos_contratistas.sys_creado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN bancos_contratistas.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 3777 (class 0 OID 0)
-- Dependencies: 237
-- Name: COLUMN bancos_contratistas.sys_actualizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN bancos_contratistas.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 3778 (class 0 OID 0)
-- Dependencies: 237
-- Name: COLUMN bancos_contratistas.sys_finalizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN bancos_contratistas.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 238 (class 1259 OID 417029)
-- Name: bancos_contratistas_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE bancos_contratistas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bancos_contratistas_id_seq OWNER TO eureka;

--
-- TOC entry 3779 (class 0 OID 0)
-- Dependencies: 238
-- Name: bancos_contratistas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE bancos_contratistas_id_seq OWNED BY bancos_contratistas.id;


--
-- TOC entry 239 (class 1259 OID 417031)
-- Name: capitales; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE capitales (
    id integer NOT NULL,
    tipo_capital tipo_capital,
    accion boolean NOT NULL,
    certificado boolean NOT NULL,
    suplementario boolean NOT NULL,
    efectivo boolean NOT NULL,
    propiedad boolean NOT NULL,
    inventario boolean NOT NULL,
    biologico boolean NOT NULL,
    intangible boolean NOT NULL,
    pagar_accionista boolean NOT NULL,
    decreto boolean NOT NULL,
    capital_social numeric(38,6) NOT NULL,
    contratista_id integer NOT NULL,
    documento_registrado_id integer NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone DEFAULT now(),
    sys_finalizado_el timestamp with time zone DEFAULT now()
);


ALTER TABLE public.capitales OWNER TO eureka;

--
-- TOC entry 3780 (class 0 OID 0)
-- Dependencies: 239
-- Name: TABLE capitales; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE capitales IS 'Tabla donde se almacenan el acta constitutiva de la contratista.';


--
-- TOC entry 3781 (class 0 OID 0)
-- Dependencies: 239
-- Name: COLUMN capitales.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales.id IS 'Clave primaria';


--
-- TOC entry 3782 (class 0 OID 0)
-- Dependencies: 239
-- Name: COLUMN capitales.tipo_capital; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales.tipo_capital IS 'Tipo de capital puede ser principal, pago, aumento, disminucion, correccion mometaria.';


--
-- TOC entry 3783 (class 0 OID 0)
-- Dependencies: 239
-- Name: COLUMN capitales.accion; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales.accion IS 'Si existen datos en la tabla de acciones';


--
-- TOC entry 3784 (class 0 OID 0)
-- Dependencies: 239
-- Name: COLUMN capitales.certificado; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales.certificado IS 'Si existen datos en la tabla de certificados';


--
-- TOC entry 3785 (class 0 OID 0)
-- Dependencies: 239
-- Name: COLUMN capitales.suplementario; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales.suplementario IS 'Si existen datos en la tabla de suplementarios';


--
-- TOC entry 3786 (class 0 OID 0)
-- Dependencies: 239
-- Name: COLUMN capitales.efectivo; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales.efectivo IS 'Si existen datos en la tabla de capitales_efectivos';


--
-- TOC entry 3787 (class 0 OID 0)
-- Dependencies: 239
-- Name: COLUMN capitales.propiedad; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales.propiedad IS 'Si existen datos en la tabla de capitales_propiedades';


--
-- TOC entry 3788 (class 0 OID 0)
-- Dependencies: 239
-- Name: COLUMN capitales.inventario; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales.inventario IS 'Si existen datos en la tabla de capitales_inventarios';


--
-- TOC entry 3789 (class 0 OID 0)
-- Dependencies: 239
-- Name: COLUMN capitales.biologico; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales.biologico IS 'Si existen datos en la tabla de capitales_biologicos';


--
-- TOC entry 3790 (class 0 OID 0)
-- Dependencies: 239
-- Name: COLUMN capitales.intangible; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales.intangible IS 'Si existen datos en la tabla de capitales_intangibles';


--
-- TOC entry 3791 (class 0 OID 0)
-- Dependencies: 239
-- Name: COLUMN capitales.pagar_accionista; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales.pagar_accionista IS 'Si existen datos en la tabla de capitales_pagar_accionistas';


--
-- TOC entry 3792 (class 0 OID 0)
-- Dependencies: 239
-- Name: COLUMN capitales.decreto; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales.decreto IS 'Si existen datos en la tabla de capitales_decretos';


--
-- TOC entry 3793 (class 0 OID 0)
-- Dependencies: 239
-- Name: COLUMN capitales.capital_social; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales.capital_social IS 'Monto total del capital social';


--
-- TOC entry 3794 (class 0 OID 0)
-- Dependencies: 239
-- Name: COLUMN capitales.contratista_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales.contratista_id IS 'Clave foranea a la tabla  contratistas';


--
-- TOC entry 3795 (class 0 OID 0)
-- Dependencies: 239
-- Name: COLUMN capitales.documento_registrado_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales.documento_registrado_id IS 'Clave foranea a la tabla documentos registrados  en el esquema activos';


--
-- TOC entry 3796 (class 0 OID 0)
-- Dependencies: 239
-- Name: COLUMN capitales.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 3797 (class 0 OID 0)
-- Dependencies: 239
-- Name: COLUMN capitales.sys_creado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 3798 (class 0 OID 0)
-- Dependencies: 239
-- Name: COLUMN capitales.sys_actualizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 3799 (class 0 OID 0)
-- Dependencies: 239
-- Name: COLUMN capitales.sys_finalizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 240 (class 1259 OID 417038)
-- Name: capitales_decretos; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE capitales_decretos (
    id integer NOT NULL,
    numero_accion double precision NOT NULL,
    valor_accion double precision NOT NULL,
    saldo_cierre double precision NOT NULL,
    fecha_aumento date NOT NULL,
    monto_aumento double precision NOT NULL,
    capital_id integer NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone DEFAULT now(),
    sys_finalizado_el timestamp with time zone DEFAULT now()
);


ALTER TABLE public.capitales_decretos OWNER TO eureka;

--
-- TOC entry 3800 (class 0 OID 0)
-- Dependencies: 240
-- Name: TABLE capitales_decretos; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE capitales_decretos IS 'Tabla donde se almacena los decretos de  dividiendo acciones en caso de existir en la modificación estatutaria.';


--
-- TOC entry 3801 (class 0 OID 0)
-- Dependencies: 240
-- Name: COLUMN capitales_decretos.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales_decretos.id IS 'Clave primaria';


--
-- TOC entry 3802 (class 0 OID 0)
-- Dependencies: 240
-- Name: COLUMN capitales_decretos.numero_accion; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales_decretos.numero_accion IS 'Numero de acciones';


--
-- TOC entry 3803 (class 0 OID 0)
-- Dependencies: 240
-- Name: COLUMN capitales_decretos.valor_accion; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales_decretos.valor_accion IS 'Valor de la accion';


--
-- TOC entry 3804 (class 0 OID 0)
-- Dependencies: 240
-- Name: COLUMN capitales_decretos.saldo_cierre; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales_decretos.saldo_cierre IS 'Saldo al cierre anterior a valores ajustados';


--
-- TOC entry 3805 (class 0 OID 0)
-- Dependencies: 240
-- Name: COLUMN capitales_decretos.fecha_aumento; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales_decretos.fecha_aumento IS 'Fecha del aumento';


--
-- TOC entry 3806 (class 0 OID 0)
-- Dependencies: 240
-- Name: COLUMN capitales_decretos.monto_aumento; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales_decretos.monto_aumento IS 'Monto aumento';


--
-- TOC entry 3807 (class 0 OID 0)
-- Dependencies: 240
-- Name: COLUMN capitales_decretos.capital_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales_decretos.capital_id IS 'Clave foranea a la tabla capitales';


--
-- TOC entry 3808 (class 0 OID 0)
-- Dependencies: 240
-- Name: COLUMN capitales_decretos.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales_decretos.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 3809 (class 0 OID 0)
-- Dependencies: 240
-- Name: COLUMN capitales_decretos.sys_creado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales_decretos.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 3810 (class 0 OID 0)
-- Dependencies: 240
-- Name: COLUMN capitales_decretos.sys_actualizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales_decretos.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 3811 (class 0 OID 0)
-- Dependencies: 240
-- Name: COLUMN capitales_decretos.sys_finalizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales_decretos.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 241 (class 1259 OID 417045)
-- Name: capitales_efectivos; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE capitales_efectivos (
    id integer NOT NULL,
    numero_transaccion character varying(255) NOT NULL,
    monto double precision NOT NULL,
    fecha date NOT NULL,
    sys_banco_id integer NOT NULL,
    cuenta_contratista_id integer NOT NULL,
    capital_id integer NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone DEFAULT now(),
    sys_finalizado_el timestamp with time zone DEFAULT now()
);


ALTER TABLE public.capitales_efectivos OWNER TO eureka;

--
-- TOC entry 3812 (class 0 OID 0)
-- Dependencies: 241
-- Name: TABLE capitales_efectivos; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE capitales_efectivos IS 'Tabla donde se almacenan el origen del capital efectivo en caso de existir de la contratista.';


--
-- TOC entry 3813 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN capitales_efectivos.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales_efectivos.id IS 'Clave primaria';


--
-- TOC entry 3814 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN capitales_efectivos.numero_transaccion; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales_efectivos.numero_transaccion IS 'Numero de la transaccion';


--
-- TOC entry 3815 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN capitales_efectivos.monto; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales_efectivos.monto IS 'Monto de la transaccion';


--
-- TOC entry 3816 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN capitales_efectivos.fecha; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales_efectivos.fecha IS 'Fecha transaccion';


--
-- TOC entry 3817 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN capitales_efectivos.sys_banco_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales_efectivos.sys_banco_id IS 'Clave foranea tabla sys_bancos';


--
-- TOC entry 3818 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN capitales_efectivos.cuenta_contratista_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales_efectivos.cuenta_contratista_id IS 'Clave foranea con la tabla bancos_constratistas';


--
-- TOC entry 3819 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN capitales_efectivos.capital_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales_efectivos.capital_id IS 'Clave foranea a la tabla capitales';


--
-- TOC entry 3820 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN capitales_efectivos.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales_efectivos.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 3821 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN capitales_efectivos.sys_creado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales_efectivos.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 3822 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN capitales_efectivos.sys_actualizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales_efectivos.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 3823 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN capitales_efectivos.sys_finalizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales_efectivos.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 242 (class 1259 OID 417052)
-- Name: capitales_efectivos_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE capitales_efectivos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.capitales_efectivos_id_seq OWNER TO eureka;

--
-- TOC entry 3824 (class 0 OID 0)
-- Dependencies: 242
-- Name: capitales_efectivos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE capitales_efectivos_id_seq OWNED BY capitales_efectivos.id;


--
-- TOC entry 243 (class 1259 OID 417054)
-- Name: capitales_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE capitales_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.capitales_id_seq OWNER TO eureka;

--
-- TOC entry 3825 (class 0 OID 0)
-- Dependencies: 243
-- Name: capitales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE capitales_id_seq OWNED BY capitales.id;


--
-- TOC entry 244 (class 1259 OID 417056)
-- Name: capitales_mercancias; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE capitales_mercancias (
    id integer NOT NULL,
    monto double precision NOT NULL,
    codigo_producto_id integer NOT NULL,
    fecha date NOT NULL,
    capital_id integer NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone DEFAULT now(),
    sys_finalizado_el timestamp with time zone DEFAULT now()
);


ALTER TABLE public.capitales_mercancias OWNER TO eureka;

--
-- TOC entry 3826 (class 0 OID 0)
-- Dependencies: 244
-- Name: TABLE capitales_mercancias; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE capitales_mercancias IS 'Tabla donde se almacenan el origen del capital como inventario de mercancia en caso de existir de la contratista.';


--
-- TOC entry 3827 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN capitales_mercancias.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales_mercancias.id IS 'Clave primaria';


--
-- TOC entry 3828 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN capitales_mercancias.monto; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales_mercancias.monto IS 'Monto de la factura';


--
-- TOC entry 3829 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN capitales_mercancias.codigo_producto_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales_mercancias.codigo_producto_id IS 'CLave foranea a la tabla codigos_productos';


--
-- TOC entry 3830 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN capitales_mercancias.fecha; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales_mercancias.fecha IS 'Fecha';


--
-- TOC entry 3831 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN capitales_mercancias.capital_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales_mercancias.capital_id IS 'Clave foranea ala tabla capitales';


--
-- TOC entry 3832 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN capitales_mercancias.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales_mercancias.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 3833 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN capitales_mercancias.sys_creado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales_mercancias.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 3834 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN capitales_mercancias.sys_actualizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales_mercancias.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 3835 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN capitales_mercancias.sys_finalizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales_mercancias.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 245 (class 1259 OID 417063)
-- Name: capitales_mercancias_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE capitales_mercancias_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.capitales_mercancias_id_seq OWNER TO eureka;

--
-- TOC entry 3836 (class 0 OID 0)
-- Dependencies: 245
-- Name: capitales_mercancias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE capitales_mercancias_id_seq OWNED BY capitales_mercancias.id;


--
-- TOC entry 246 (class 1259 OID 417065)
-- Name: capitales_pagar_accionistas; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE capitales_pagar_accionistas (
    id integer NOT NULL,
    saldo_cierre double precision NOT NULL,
    fecha_corte date NOT NULL,
    saldo_corte double precision NOT NULL,
    monto_aumento double precision NOT NULL,
    saldo_aumento double precision NOT NULL,
    capital_id integer NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone DEFAULT now(),
    sys_finalizado_el timestamp with time zone DEFAULT now()
);


ALTER TABLE public.capitales_pagar_accionistas OWNER TO eureka;

--
-- TOC entry 3837 (class 0 OID 0)
-- Dependencies: 246
-- Name: TABLE capitales_pagar_accionistas; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE capitales_pagar_accionistas IS 'Tabla donde se almacena las cuentas x pagar a los accionistas en caso de existir en la modificación estatutaria.';


--
-- TOC entry 3838 (class 0 OID 0)
-- Dependencies: 246
-- Name: COLUMN capitales_pagar_accionistas.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales_pagar_accionistas.id IS 'Clave primaria';


--
-- TOC entry 3839 (class 0 OID 0)
-- Dependencies: 246
-- Name: COLUMN capitales_pagar_accionistas.saldo_cierre; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales_pagar_accionistas.saldo_cierre IS 'Saldo al cierre del ejercicio anterior';


--
-- TOC entry 3840 (class 0 OID 0)
-- Dependencies: 246
-- Name: COLUMN capitales_pagar_accionistas.fecha_corte; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales_pagar_accionistas.fecha_corte IS 'Fecha corte del ejercicio anterior';


--
-- TOC entry 3841 (class 0 OID 0)
-- Dependencies: 246
-- Name: COLUMN capitales_pagar_accionistas.saldo_corte; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales_pagar_accionistas.saldo_corte IS 'Saldo al corte del ejercicio anterior';


--
-- TOC entry 3842 (class 0 OID 0)
-- Dependencies: 246
-- Name: COLUMN capitales_pagar_accionistas.monto_aumento; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales_pagar_accionistas.monto_aumento IS 'Monto aumento';


--
-- TOC entry 3843 (class 0 OID 0)
-- Dependencies: 246
-- Name: COLUMN capitales_pagar_accionistas.saldo_aumento; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales_pagar_accionistas.saldo_aumento IS 'saldo despues del aumento';


--
-- TOC entry 3844 (class 0 OID 0)
-- Dependencies: 246
-- Name: COLUMN capitales_pagar_accionistas.capital_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales_pagar_accionistas.capital_id IS 'Clave foranea a la tabla capitales';


--
-- TOC entry 3845 (class 0 OID 0)
-- Dependencies: 246
-- Name: COLUMN capitales_pagar_accionistas.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales_pagar_accionistas.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 3846 (class 0 OID 0)
-- Dependencies: 246
-- Name: COLUMN capitales_pagar_accionistas.sys_creado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales_pagar_accionistas.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 3847 (class 0 OID 0)
-- Dependencies: 246
-- Name: COLUMN capitales_pagar_accionistas.sys_actualizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales_pagar_accionistas.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 3848 (class 0 OID 0)
-- Dependencies: 246
-- Name: COLUMN capitales_pagar_accionistas.sys_finalizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales_pagar_accionistas.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 247 (class 1259 OID 417072)
-- Name: capitales_propiedades; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE capitales_propiedades (
    id integer NOT NULL,
    monto numeric(38,6) NOT NULL,
    capital_id integer NOT NULL,
    factura_id integer NOT NULL,
    documento_registrado_id integer NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone DEFAULT now(),
    sys_finalizado_el timestamp with time zone DEFAULT now()
);


ALTER TABLE public.capitales_propiedades OWNER TO eureka;

--
-- TOC entry 3849 (class 0 OID 0)
-- Dependencies: 247
-- Name: TABLE capitales_propiedades; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE capitales_propiedades IS 'Tabla donde se almacenan el origen del capital con propiedades, plantas o equipos en caso de existir de la contratista.';


--
-- TOC entry 3850 (class 0 OID 0)
-- Dependencies: 247
-- Name: COLUMN capitales_propiedades.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales_propiedades.id IS 'Clave primaria';


--
-- TOC entry 3851 (class 0 OID 0)
-- Dependencies: 247
-- Name: COLUMN capitales_propiedades.monto; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales_propiedades.monto IS 'Monto de la factura';


--
-- TOC entry 3852 (class 0 OID 0)
-- Dependencies: 247
-- Name: COLUMN capitales_propiedades.capital_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales_propiedades.capital_id IS 'CLave foranea a la tabla capitales';


--
-- TOC entry 3853 (class 0 OID 0)
-- Dependencies: 247
-- Name: COLUMN capitales_propiedades.factura_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales_propiedades.factura_id IS 'Clave foranea a la tabla facturas en el esquma activo';


--
-- TOC entry 3854 (class 0 OID 0)
-- Dependencies: 247
-- Name: COLUMN capitales_propiedades.documento_registrado_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales_propiedades.documento_registrado_id IS 'CKave fornea a la tabla documentos registrados del esquema activos';


--
-- TOC entry 3855 (class 0 OID 0)
-- Dependencies: 247
-- Name: COLUMN capitales_propiedades.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales_propiedades.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 3856 (class 0 OID 0)
-- Dependencies: 247
-- Name: COLUMN capitales_propiedades.sys_creado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales_propiedades.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 3857 (class 0 OID 0)
-- Dependencies: 247
-- Name: COLUMN capitales_propiedades.sys_actualizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales_propiedades.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 3858 (class 0 OID 0)
-- Dependencies: 247
-- Name: COLUMN capitales_propiedades.sys_finalizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN capitales_propiedades.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 248 (class 1259 OID 417079)
-- Name: capitales_propiedades_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE capitales_propiedades_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.capitales_propiedades_id_seq OWNER TO eureka;

--
-- TOC entry 3859 (class 0 OID 0)
-- Dependencies: 248
-- Name: capitales_propiedades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE capitales_propiedades_id_seq OWNED BY capitales_propiedades.id;


--
-- TOC entry 249 (class 1259 OID 417081)
-- Name: certificaciones_aportes; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE certificaciones_aportes (
    id integer NOT NULL,
    capital_id integer NOT NULL,
    persona_natural_id integer,
    colegiatura character varying(255),
    tipo_profesion tipo_profesion NOT NULL,
    fecha_informe date NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone DEFAULT now(),
    sys_finalizado_el timestamp with time zone DEFAULT now()
);


ALTER TABLE public.certificaciones_aportes OWNER TO eureka;

--
-- TOC entry 3860 (class 0 OID 0)
-- Dependencies: 249
-- Name: TABLE certificaciones_aportes; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE certificaciones_aportes IS 'Tabla donde se almacenan los certificados suplementariossucritas o pagadas.';


--
-- TOC entry 3861 (class 0 OID 0)
-- Dependencies: 249
-- Name: COLUMN certificaciones_aportes.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN certificaciones_aportes.id IS 'Clave primaria';


--
-- TOC entry 3862 (class 0 OID 0)
-- Dependencies: 249
-- Name: COLUMN certificaciones_aportes.capital_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN certificaciones_aportes.capital_id IS 'CLave foranea a la tabla capitales';


--
-- TOC entry 3863 (class 0 OID 0)
-- Dependencies: 249
-- Name: COLUMN certificaciones_aportes.persona_natural_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN certificaciones_aportes.persona_natural_id IS 'Clave foranea a la tabla personas_naturales';


--
-- TOC entry 3864 (class 0 OID 0)
-- Dependencies: 249
-- Name: COLUMN certificaciones_aportes.colegiatura; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN certificaciones_aportes.colegiatura IS 'Numero de colegiatura';


--
-- TOC entry 3865 (class 0 OID 0)
-- Dependencies: 249
-- Name: COLUMN certificaciones_aportes.tipo_profesion; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN certificaciones_aportes.tipo_profesion IS 'Tipo de profesion pued ser contador publico, administrador, economista';


--
-- TOC entry 3866 (class 0 OID 0)
-- Dependencies: 249
-- Name: COLUMN certificaciones_aportes.fecha_informe; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN certificaciones_aportes.fecha_informe IS 'Fecha del informe';


--
-- TOC entry 3867 (class 0 OID 0)
-- Dependencies: 249
-- Name: COLUMN certificaciones_aportes.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN certificaciones_aportes.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 3868 (class 0 OID 0)
-- Dependencies: 249
-- Name: COLUMN certificaciones_aportes.sys_creado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN certificaciones_aportes.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 3869 (class 0 OID 0)
-- Dependencies: 249
-- Name: COLUMN certificaciones_aportes.sys_actualizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN certificaciones_aportes.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 3870 (class 0 OID 0)
-- Dependencies: 249
-- Name: COLUMN certificaciones_aportes.sys_finalizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN certificaciones_aportes.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 250 (class 1259 OID 417088)
-- Name: certificados; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE certificados (
    id integer NOT NULL,
    tipo_certificado tipo_sus_pag,
    capital_id integer NOT NULL,
    numero_asociacion integer,
    numero_aportacion integer,
    numero_rotativo integer,
    numero_inversion integer,
    valor_asociacion numeric(38,6),
    valor_aportacion numeric(38,6),
    valor_rotativo numeric(38,6),
    valor_inversion numeric(38,6),
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone DEFAULT now(),
    sys_finalizado_el timestamp with time zone DEFAULT now()
);


ALTER TABLE public.certificados OWNER TO eureka;

--
-- TOC entry 3871 (class 0 OID 0)
-- Dependencies: 250
-- Name: TABLE certificados; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE certificados IS 'Tabla donde se almacenan los certificados sucritas o pagadas.';


--
-- TOC entry 3872 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN certificados.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN certificados.id IS 'Clave primaria';


--
-- TOC entry 3873 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN certificados.tipo_certificado; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN certificados.tipo_certificado IS 'Tipo de accion si es suscrito o pagado';


--
-- TOC entry 3874 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN certificados.capital_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN certificados.capital_id IS 'CLave foranea a la tabla capitales';


--
-- TOC entry 3875 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN certificados.numero_asociacion; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN certificados.numero_asociacion IS 'Numero de asociacion';


--
-- TOC entry 3876 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN certificados.numero_aportacion; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN certificados.numero_aportacion IS 'Numero de aportacion';


--
-- TOC entry 3877 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN certificados.numero_rotativo; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN certificados.numero_rotativo IS 'Numero de rotativo';


--
-- TOC entry 3878 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN certificados.numero_inversion; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN certificados.numero_inversion IS 'Numero de inversion';


--
-- TOC entry 3879 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN certificados.valor_asociacion; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN certificados.valor_asociacion IS 'Valor de asociacion';


--
-- TOC entry 3880 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN certificados.valor_aportacion; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN certificados.valor_aportacion IS 'Valor de la aportacion';


--
-- TOC entry 3881 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN certificados.valor_rotativo; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN certificados.valor_rotativo IS 'Numero de rotativo';


--
-- TOC entry 3882 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN certificados.valor_inversion; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN certificados.valor_inversion IS 'Numero de inversion';


--
-- TOC entry 3883 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN certificados.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN certificados.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 3884 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN certificados.sys_creado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN certificados.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 3885 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN certificados.sys_actualizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN certificados.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 3886 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN certificados.sys_finalizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN certificados.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 251 (class 1259 OID 417095)
-- Name: certificados_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE certificados_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.certificados_id_seq OWNER TO eureka;

--
-- TOC entry 3887 (class 0 OID 0)
-- Dependencies: 251
-- Name: certificados_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE certificados_id_seq OWNED BY certificados.id;


--
-- TOC entry 252 (class 1259 OID 417097)
-- Name: certificiones_aportes_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE certificiones_aportes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.certificiones_aportes_id_seq OWNER TO eureka;

--
-- TOC entry 3888 (class 0 OID 0)
-- Dependencies: 252
-- Name: certificiones_aportes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE certificiones_aportes_id_seq OWNED BY certificaciones_aportes.id;


--
-- TOC entry 253 (class 1259 OID 417099)
-- Name: cierres_ejercicios; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE cierres_ejercicios (
    id integer NOT NULL,
    contratista_id integer NOT NULL,
    documento_registrado_id integer NOT NULL,
    fecha_cierre date NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone DEFAULT now(),
    sys_finalizado_el timestamp with time zone DEFAULT now()
);


ALTER TABLE public.cierres_ejercicios OWNER TO eureka;

--
-- TOC entry 3889 (class 0 OID 0)
-- Dependencies: 253
-- Name: TABLE cierres_ejercicios; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE cierres_ejercicios IS 'Tabla donde se almacenan elobjeto social  de la contratista.';


--
-- TOC entry 3890 (class 0 OID 0)
-- Dependencies: 253
-- Name: COLUMN cierres_ejercicios.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN cierres_ejercicios.id IS 'Clave primaria';


--
-- TOC entry 3891 (class 0 OID 0)
-- Dependencies: 253
-- Name: COLUMN cierres_ejercicios.contratista_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN cierres_ejercicios.contratista_id IS 'Clave foranea a la tabla  contratistas';


--
-- TOC entry 3892 (class 0 OID 0)
-- Dependencies: 253
-- Name: COLUMN cierres_ejercicios.documento_registrado_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN cierres_ejercicios.documento_registrado_id IS 'Clave foranea a la tabla documentos registrados  en el esquema activos';


--
-- TOC entry 3893 (class 0 OID 0)
-- Dependencies: 253
-- Name: COLUMN cierres_ejercicios.fecha_cierre; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN cierres_ejercicios.fecha_cierre IS 'Fecha de cierre del ejercicio economico';


--
-- TOC entry 3894 (class 0 OID 0)
-- Dependencies: 253
-- Name: COLUMN cierres_ejercicios.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN cierres_ejercicios.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 3895 (class 0 OID 0)
-- Dependencies: 253
-- Name: COLUMN cierres_ejercicios.sys_creado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN cierres_ejercicios.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 3896 (class 0 OID 0)
-- Dependencies: 253
-- Name: COLUMN cierres_ejercicios.sys_actualizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN cierres_ejercicios.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 3897 (class 0 OID 0)
-- Dependencies: 253
-- Name: COLUMN cierres_ejercicios.sys_finalizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN cierres_ejercicios.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 254 (class 1259 OID 417106)
-- Name: cierres_ejercicios_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE cierres_ejercicios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cierres_ejercicios_id_seq OWNER TO eureka;

--
-- TOC entry 3898 (class 0 OID 0)
-- Dependencies: 254
-- Name: cierres_ejercicios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE cierres_ejercicios_id_seq OWNED BY cierres_ejercicios.id;


--
-- TOC entry 255 (class 1259 OID 417108)
-- Name: clientes; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE clientes (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    publico boolean DEFAULT false,
    contratista_id integer NOT NULL,
    natural_juridico_id integer NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone DEFAULT now(),
    sys_finalizado_el timestamp with time zone DEFAULT now()
);


ALTER TABLE public.clientes OWNER TO eureka;

--
-- TOC entry 3899 (class 0 OID 0)
-- Dependencies: 255
-- Name: COLUMN clientes.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN clientes.id IS 'Clave primaria';


--
-- TOC entry 3900 (class 0 OID 0)
-- Dependencies: 255
-- Name: COLUMN clientes.nombre; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN clientes.nombre IS 'Nombre del cliente';


--
-- TOC entry 3901 (class 0 OID 0)
-- Dependencies: 255
-- Name: COLUMN clientes.publico; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN clientes.publico IS 'Si el cliente es un ente publico o privado';


--
-- TOC entry 3902 (class 0 OID 0)
-- Dependencies: 255
-- Name: COLUMN clientes.contratista_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN clientes.contratista_id IS 'Relacion contra la tabla contratista';


--
-- TOC entry 3903 (class 0 OID 0)
-- Dependencies: 255
-- Name: COLUMN clientes.natural_juridico_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN clientes.natural_juridico_id IS 'Clave foranea a la tabla Naturales_Juridicos';


--
-- TOC entry 3904 (class 0 OID 0)
-- Dependencies: 255
-- Name: COLUMN clientes.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN clientes.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 3905 (class 0 OID 0)
-- Dependencies: 255
-- Name: COLUMN clientes.sys_creado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN clientes.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 3906 (class 0 OID 0)
-- Dependencies: 255
-- Name: COLUMN clientes.sys_actualizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN clientes.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 3907 (class 0 OID 0)
-- Dependencies: 255
-- Name: COLUMN clientes.sys_finalizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN clientes.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 256 (class 1259 OID 417116)
-- Name: clientes_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE clientes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clientes_id_seq OWNER TO eureka;

--
-- TOC entry 3908 (class 0 OID 0)
-- Dependencies: 256
-- Name: clientes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE clientes_id_seq OWNED BY clientes.id;


--
-- TOC entry 257 (class 1259 OID 417118)
-- Name: comisarios_auditores; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE comisarios_auditores (
    id integer NOT NULL,
    fecha_vencimiento date NOT NULL,
    declaracion_jurada boolean,
    tipo_profesion tipo_profesion NOT NULL,
    fecha_carta date NOT NULL,
    colegiatura character varying(255),
    documento_registrado_id integer NOT NULL,
    contratista_id integer NOT NULL,
    comisario boolean NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone DEFAULT now(),
    sys_finalizado_el timestamp with time zone DEFAULT now()
);


ALTER TABLE public.comisarios_auditores OWNER TO eureka;

--
-- TOC entry 3909 (class 0 OID 0)
-- Dependencies: 257
-- Name: TABLE comisarios_auditores; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE comisarios_auditores IS 'Tabla donde se almacena los comisarios de la contratista.';


--
-- TOC entry 3910 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN comisarios_auditores.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN comisarios_auditores.id IS 'Clave primaria';


--
-- TOC entry 3911 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN comisarios_auditores.fecha_vencimiento; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN comisarios_auditores.fecha_vencimiento IS 'Fecha de vencimiento';


--
-- TOC entry 3912 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN comisarios_auditores.declaracion_jurada; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN comisarios_auditores.declaracion_jurada IS 'Si acepto la declaracion jurada';


--
-- TOC entry 3913 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN comisarios_auditores.tipo_profesion; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN comisarios_auditores.tipo_profesion IS 'Tipo de profesion puede ser contador publico, ecnonomista o administrador';


--
-- TOC entry 3914 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN comisarios_auditores.fecha_carta; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN comisarios_auditores.fecha_carta IS 'Fecha de emision de la carta de aceptacion';


--
-- TOC entry 3915 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN comisarios_auditores.colegiatura; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN comisarios_auditores.colegiatura IS 'Numero de colegiatura encaso de ser contador publico';


--
-- TOC entry 3916 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN comisarios_auditores.documento_registrado_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN comisarios_auditores.documento_registrado_id IS 'Clave foranea a la tabala documentos_registrados en el esquema activos';


--
-- TOC entry 3917 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN comisarios_auditores.contratista_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN comisarios_auditores.contratista_id IS 'Clave foranea a la tabla contratistas';


--
-- TOC entry 3918 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN comisarios_auditores.comisario; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN comisarios_auditores.comisario IS 'Si es true es un comisario si es false es un contador auditor';


--
-- TOC entry 3919 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN comisarios_auditores.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN comisarios_auditores.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 3920 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN comisarios_auditores.sys_creado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN comisarios_auditores.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 3921 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN comisarios_auditores.sys_actualizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN comisarios_auditores.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 3922 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN comisarios_auditores.sys_finalizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN comisarios_auditores.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 258 (class 1259 OID 417125)
-- Name: comisarios_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE comisarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comisarios_id_seq OWNER TO eureka;

--
-- TOC entry 3923 (class 0 OID 0)
-- Dependencies: 258
-- Name: comisarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE comisarios_id_seq OWNED BY comisarios_auditores.id;


--
-- TOC entry 259 (class 1259 OID 417127)
-- Name: contratistas; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE contratistas (
    id integer NOT NULL,
    natural_juridica_id integer NOT NULL,
    estatus_contratista_id integer NOT NULL,
    sigla character varying(50),
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone DEFAULT now(),
    sys_finalizado_el timestamp with time zone DEFAULT now(),
    tipo_sector tipo_sector_mixto NOT NULL
);


ALTER TABLE public.contratistas OWNER TO eureka;

--
-- TOC entry 3924 (class 0 OID 0)
-- Dependencies: 259
-- Name: TABLE contratistas; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE contratistas IS 'Tabla donde se almacenan todas las empresas que contratan con el estado Venezolano';


--
-- TOC entry 3925 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN contratistas.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN contratistas.id IS 'Clave primaria';


--
-- TOC entry 3926 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN contratistas.natural_juridica_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN contratistas.natural_juridica_id IS 'Clave foranea a la tabla naturales_juridica';


--
-- TOC entry 3927 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN contratistas.estatus_contratista_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN contratistas.estatus_contratista_id IS 'Clave foranea a la tabla estatus_contratista';


--
-- TOC entry 3928 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN contratistas.sigla; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN contratistas.sigla IS 'Sigla de la contratista en caso de tener';


--
-- TOC entry 3929 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN contratistas.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN contratistas.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 3930 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN contratistas.sys_creado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN contratistas.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 3931 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN contratistas.sys_actualizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN contratistas.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 3932 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN contratistas.sys_finalizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN contratistas.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 3933 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN contratistas.tipo_sector; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN contratistas.tipo_sector IS 'Tipo sector puede ser publico privado o mixto';


--
-- TOC entry 260 (class 1259 OID 417134)
-- Name: contratistas_contactos; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE contratistas_contactos (
    id integer NOT NULL,
    contacto_id integer NOT NULL,
    contratista_id integer NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone,
    sys_finalizado_el timestamp with time zone
);


ALTER TABLE public.contratistas_contactos OWNER TO eureka;

--
-- TOC entry 3934 (class 0 OID 0)
-- Dependencies: 260
-- Name: TABLE contratistas_contactos; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE contratistas_contactos IS 'Tabla donde se almacenan todas las personnas de contacto de la contratista';


--
-- TOC entry 3935 (class 0 OID 0)
-- Dependencies: 260
-- Name: COLUMN contratistas_contactos.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN contratistas_contactos.id IS 'Clave primaria';


--
-- TOC entry 3936 (class 0 OID 0)
-- Dependencies: 260
-- Name: COLUMN contratistas_contactos.contacto_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN contratistas_contactos.contacto_id IS 'CLave foranea a la tabla de personas_naturales';


--
-- TOC entry 3937 (class 0 OID 0)
-- Dependencies: 260
-- Name: COLUMN contratistas_contactos.contratista_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN contratistas_contactos.contratista_id IS 'CLave foranea a la tabla de contratistas';


--
-- TOC entry 3938 (class 0 OID 0)
-- Dependencies: 260
-- Name: COLUMN contratistas_contactos.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN contratistas_contactos.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 3939 (class 0 OID 0)
-- Dependencies: 260
-- Name: COLUMN contratistas_contactos.sys_creado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN contratistas_contactos.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 3940 (class 0 OID 0)
-- Dependencies: 260
-- Name: COLUMN contratistas_contactos.sys_actualizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN contratistas_contactos.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 3941 (class 0 OID 0)
-- Dependencies: 260
-- Name: COLUMN contratistas_contactos.sys_finalizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN contratistas_contactos.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 261 (class 1259 OID 417139)
-- Name: contratistas_contactos_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE contratistas_contactos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contratistas_contactos_id_seq OWNER TO eureka;

--
-- TOC entry 3942 (class 0 OID 0)
-- Dependencies: 261
-- Name: contratistas_contactos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE contratistas_contactos_id_seq OWNED BY contratistas_contactos.id;


--
-- TOC entry 262 (class 1259 OID 417141)
-- Name: contratistas_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE contratistas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contratistas_id_seq OWNER TO eureka;

--
-- TOC entry 3943 (class 0 OID 0)
-- Dependencies: 262
-- Name: contratistas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE contratistas_id_seq OWNED BY contratistas.id;


--
-- TOC entry 263 (class 1259 OID 417143)
-- Name: contratos_facturas; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE contratos_facturas (
    id integer NOT NULL,
    relacion_contrato_id integer NOT NULL,
    orden_factura integer NOT NULL,
    monto numeric(38,6) NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone DEFAULT now(),
    sys_finalizado_el timestamp with time zone DEFAULT now()
);


ALTER TABLE public.contratos_facturas OWNER TO eureka;

--
-- TOC entry 3944 (class 0 OID 0)
-- Dependencies: 263
-- Name: TABLE contratos_facturas; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE contratos_facturas IS 'Tabla que almacena l¿el monto de las facturas relacionadas a los contratos realizados por la contratista';


--
-- TOC entry 3945 (class 0 OID 0)
-- Dependencies: 263
-- Name: COLUMN contratos_facturas.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN contratos_facturas.id IS 'Clave primaria';


--
-- TOC entry 3946 (class 0 OID 0)
-- Dependencies: 263
-- Name: COLUMN contratos_facturas.relacion_contrato_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN contratos_facturas.relacion_contrato_id IS 'Clave foranea a la tabla relaciones_contratos';


--
-- TOC entry 3947 (class 0 OID 0)
-- Dependencies: 263
-- Name: COLUMN contratos_facturas.orden_factura; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN contratos_facturas.orden_factura IS 'Numero de factura ejemplo 1 ,2 ,3 etc.';


--
-- TOC entry 3948 (class 0 OID 0)
-- Dependencies: 263
-- Name: COLUMN contratos_facturas.monto; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN contratos_facturas.monto IS 'Monto de la factura';


--
-- TOC entry 3949 (class 0 OID 0)
-- Dependencies: 263
-- Name: COLUMN contratos_facturas.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN contratos_facturas.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 3950 (class 0 OID 0)
-- Dependencies: 263
-- Name: COLUMN contratos_facturas.sys_creado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN contratos_facturas.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 3951 (class 0 OID 0)
-- Dependencies: 263
-- Name: COLUMN contratos_facturas.sys_actualizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN contratos_facturas.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 3952 (class 0 OID 0)
-- Dependencies: 263
-- Name: COLUMN contratos_facturas.sys_finalizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN contratos_facturas.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 264 (class 1259 OID 417150)
-- Name: contratos_facturas_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE contratos_facturas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contratos_facturas_id_seq OWNER TO eureka;

--
-- TOC entry 3953 (class 0 OID 0)
-- Dependencies: 264
-- Name: contratos_facturas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE contratos_facturas_id_seq OWNED BY contratos_facturas.id;


--
-- TOC entry 265 (class 1259 OID 417152)
-- Name: contratos_valuaciones; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE contratos_valuaciones (
    id integer NOT NULL,
    relacion_contrato_id integer NOT NULL,
    orden_valuacion integer NOT NULL,
    monto numeric(38,6) NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone DEFAULT now(),
    sys_finalizado_el timestamp with time zone DEFAULT now()
);


ALTER TABLE public.contratos_valuaciones OWNER TO eureka;

--
-- TOC entry 3954 (class 0 OID 0)
-- Dependencies: 265
-- Name: TABLE contratos_valuaciones; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE contratos_valuaciones IS 'Tabla que almacena l¿el monto de las facturas relacionadas a los contratos realizados por la contratista';


--
-- TOC entry 3955 (class 0 OID 0)
-- Dependencies: 265
-- Name: COLUMN contratos_valuaciones.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN contratos_valuaciones.id IS 'Clave primaria';


--
-- TOC entry 3956 (class 0 OID 0)
-- Dependencies: 265
-- Name: COLUMN contratos_valuaciones.relacion_contrato_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN contratos_valuaciones.relacion_contrato_id IS 'Clave foranea a la tabla relaciones_contratos';


--
-- TOC entry 3957 (class 0 OID 0)
-- Dependencies: 265
-- Name: COLUMN contratos_valuaciones.orden_valuacion; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN contratos_valuaciones.orden_valuacion IS 'Numero de valuacion ejemplo 1 ,2 ,3 etc.';


--
-- TOC entry 3958 (class 0 OID 0)
-- Dependencies: 265
-- Name: COLUMN contratos_valuaciones.monto; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN contratos_valuaciones.monto IS 'Monto de la valuacion';


--
-- TOC entry 3959 (class 0 OID 0)
-- Dependencies: 265
-- Name: COLUMN contratos_valuaciones.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN contratos_valuaciones.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 3960 (class 0 OID 0)
-- Dependencies: 265
-- Name: COLUMN contratos_valuaciones.sys_creado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN contratos_valuaciones.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 3961 (class 0 OID 0)
-- Dependencies: 265
-- Name: COLUMN contratos_valuaciones.sys_actualizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN contratos_valuaciones.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 3962 (class 0 OID 0)
-- Dependencies: 265
-- Name: COLUMN contratos_valuaciones.sys_finalizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN contratos_valuaciones.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 266 (class 1259 OID 417159)
-- Name: contratos_valuaciones_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE contratos_valuaciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contratos_valuaciones_id_seq OWNER TO eureka;

--
-- TOC entry 3963 (class 0 OID 0)
-- Dependencies: 266
-- Name: contratos_valuaciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE contratos_valuaciones_id_seq OWNED BY contratos_valuaciones.id;


--
-- TOC entry 267 (class 1259 OID 417161)
-- Name: cuentas_xpagar_accionistas_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE cuentas_xpagar_accionistas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cuentas_xpagar_accionistas_id_seq OWNER TO eureka;

--
-- TOC entry 3964 (class 0 OID 0)
-- Dependencies: 267
-- Name: cuentas_xpagar_accionistas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE cuentas_xpagar_accionistas_id_seq OWNED BY capitales_pagar_accionistas.id;


--
-- TOC entry 268 (class 1259 OID 417163)
-- Name: decretos_dividiendos_acciones_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE decretos_dividiendos_acciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.decretos_dividiendos_acciones_id_seq OWNER TO eureka;

--
-- TOC entry 3965 (class 0 OID 0)
-- Dependencies: 268
-- Name: decretos_dividiendos_acciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE decretos_dividiendos_acciones_id_seq OWNED BY capitales_decretos.id;


--
-- TOC entry 269 (class 1259 OID 417165)
-- Name: denominaciones_comerciales; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE denominaciones_comerciales (
    id integer NOT NULL,
    sys_denominacion_comercial_id integer NOT NULL,
    sys_subdenominacion_comercial_id integer,
    codigo_situr character varying(255),
    fin_lucro boolean,
    cooperativa_capital cooperativa_capital,
    cooperativa_distribuicion cooperativa_distribuicion,
    contratista_id integer NOT NULL,
    documento_registrado_id integer NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone DEFAULT now(),
    sys_finalizado_el timestamp with time zone DEFAULT now()
);


ALTER TABLE public.denominaciones_comerciales OWNER TO eureka;

--
-- TOC entry 3966 (class 0 OID 0)
-- Dependencies: 269
-- Name: TABLE denominaciones_comerciales; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE denominaciones_comerciales IS 'Tabla donde se almacenan las denominaciones comerciales de las contratistas';


--
-- TOC entry 3967 (class 0 OID 0)
-- Dependencies: 269
-- Name: COLUMN denominaciones_comerciales.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN denominaciones_comerciales.id IS 'Clave primaria';


--
-- TOC entry 3968 (class 0 OID 0)
-- Dependencies: 269
-- Name: COLUMN denominaciones_comerciales.sys_denominacion_comercial_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN denominaciones_comerciales.sys_denominacion_comercial_id IS 'Clave foranea a la tabala sys_denominaciones_comerciales';


--
-- TOC entry 3969 (class 0 OID 0)
-- Dependencies: 269
-- Name: COLUMN denominaciones_comerciales.sys_subdenominacion_comercial_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN denominaciones_comerciales.sys_subdenominacion_comercial_id IS 'Tabla que almacena las subdenomnaciones comerciales en base a la denominacion comercial';


--
-- TOC entry 3970 (class 0 OID 0)
-- Dependencies: 269
-- Name: COLUMN denominaciones_comerciales.codigo_situr; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN denominaciones_comerciales.codigo_situr IS 'En caso de que denominacion comercial sea organizacion socioproductiva';


--
-- TOC entry 3971 (class 0 OID 0)
-- Dependencies: 269
-- Name: COLUMN denominaciones_comerciales.fin_lucro; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN denominaciones_comerciales.fin_lucro IS 'En caso de que la denominacion comercial sea asociacion o sociedad civil';


--
-- TOC entry 3972 (class 0 OID 0)
-- Dependencies: 269
-- Name: COLUMN denominaciones_comerciales.cooperativa_capital; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN denominaciones_comerciales.cooperativa_capital IS 'En caso de que la denominacion comercial sea cooperativa';


--
-- TOC entry 3973 (class 0 OID 0)
-- Dependencies: 269
-- Name: COLUMN denominaciones_comerciales.cooperativa_distribuicion; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN denominaciones_comerciales.cooperativa_distribuicion IS 'En caso de que la denominacion comercial sea cooperativa';


--
-- TOC entry 3974 (class 0 OID 0)
-- Dependencies: 269
-- Name: COLUMN denominaciones_comerciales.contratista_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN denominaciones_comerciales.contratista_id IS 'Clave foranea ala tabla contratista';


--
-- TOC entry 3975 (class 0 OID 0)
-- Dependencies: 269
-- Name: COLUMN denominaciones_comerciales.documento_registrado_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN denominaciones_comerciales.documento_registrado_id IS 'Clave foranea a la tabla documentos_registrados en el esuqema activo';


--
-- TOC entry 3976 (class 0 OID 0)
-- Dependencies: 269
-- Name: COLUMN denominaciones_comerciales.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN denominaciones_comerciales.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 3977 (class 0 OID 0)
-- Dependencies: 269
-- Name: COLUMN denominaciones_comerciales.sys_creado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN denominaciones_comerciales.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 3978 (class 0 OID 0)
-- Dependencies: 269
-- Name: COLUMN denominaciones_comerciales.sys_actualizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN denominaciones_comerciales.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 3979 (class 0 OID 0)
-- Dependencies: 269
-- Name: COLUMN denominaciones_comerciales.sys_finalizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN denominaciones_comerciales.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 270 (class 1259 OID 417172)
-- Name: denominaciones_comerciales_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE denominaciones_comerciales_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.denominaciones_comerciales_id_seq OWNER TO eureka;

--
-- TOC entry 3980 (class 0 OID 0)
-- Dependencies: 270
-- Name: denominaciones_comerciales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE denominaciones_comerciales_id_seq OWNED BY denominaciones_comerciales.id;


--
-- TOC entry 271 (class 1259 OID 417174)
-- Name: direcciones; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE direcciones (
    id integer NOT NULL,
    zona character varying(255) NOT NULL,
    calle character varying(255) NOT NULL,
    casa character varying(255) NOT NULL,
    nivel character varying(50) NOT NULL,
    numero character varying(20) NOT NULL,
    referencia text,
    sys_estado_id integer NOT NULL,
    sys_municipio_id integer NOT NULL,
    sys_parroquia_id integer NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone DEFAULT now(),
    sys_finalizado_el timestamp with time zone DEFAULT now()
);


ALTER TABLE public.direcciones OWNER TO eureka;

--
-- TOC entry 3981 (class 0 OID 0)
-- Dependencies: 271
-- Name: TABLE direcciones; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE direcciones IS 'Tabla donde se almacenan todas las direcciones que pueda pertenecer la contratista.';


--
-- TOC entry 3982 (class 0 OID 0)
-- Dependencies: 271
-- Name: COLUMN direcciones.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN direcciones.id IS 'Clave primaria';


--
-- TOC entry 3983 (class 0 OID 0)
-- Dependencies: 271
-- Name: COLUMN direcciones.zona; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN direcciones.zona IS 'Sector / Zona / Urbanización';


--
-- TOC entry 3984 (class 0 OID 0)
-- Dependencies: 271
-- Name: COLUMN direcciones.calle; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN direcciones.calle IS 'Avenida / Calle / Esquina';


--
-- TOC entry 3985 (class 0 OID 0)
-- Dependencies: 271
-- Name: COLUMN direcciones.casa; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN direcciones.casa IS 'Edificio / Casa / Centro Comercial';


--
-- TOC entry 3986 (class 0 OID 0)
-- Dependencies: 271
-- Name: COLUMN direcciones.nivel; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN direcciones.nivel IS 'Piso / Nivel';


--
-- TOC entry 3987 (class 0 OID 0)
-- Dependencies: 271
-- Name: COLUMN direcciones.numero; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN direcciones.numero IS 'Número de Casa / Local / Apartamento / Oficina';


--
-- TOC entry 3988 (class 0 OID 0)
-- Dependencies: 271
-- Name: COLUMN direcciones.referencia; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN direcciones.referencia IS 'Punto de referencia';


--
-- TOC entry 3989 (class 0 OID 0)
-- Dependencies: 271
-- Name: COLUMN direcciones.sys_estado_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN direcciones.sys_estado_id IS 'Clave foranea de la tbala sys_estados';


--
-- TOC entry 3990 (class 0 OID 0)
-- Dependencies: 271
-- Name: COLUMN direcciones.sys_municipio_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN direcciones.sys_municipio_id IS 'Clave foranea de la tbala sys_municipios';


--
-- TOC entry 3991 (class 0 OID 0)
-- Dependencies: 271
-- Name: COLUMN direcciones.sys_parroquia_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN direcciones.sys_parroquia_id IS 'Clave foranea de la tbala sys_parroquias';


--
-- TOC entry 3992 (class 0 OID 0)
-- Dependencies: 271
-- Name: COLUMN direcciones.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN direcciones.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 3993 (class 0 OID 0)
-- Dependencies: 271
-- Name: COLUMN direcciones.sys_creado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN direcciones.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 3994 (class 0 OID 0)
-- Dependencies: 271
-- Name: COLUMN direcciones.sys_actualizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN direcciones.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 3995 (class 0 OID 0)
-- Dependencies: 271
-- Name: COLUMN direcciones.sys_finalizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN direcciones.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 272 (class 1259 OID 417184)
-- Name: direcciones_sucursales_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE direcciones_sucursales_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.direcciones_sucursales_id_seq OWNER TO eureka;

--
-- TOC entry 3996 (class 0 OID 0)
-- Dependencies: 272
-- Name: direcciones_sucursales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE direcciones_sucursales_id_seq OWNED BY direcciones.id;


--
-- TOC entry 273 (class 1259 OID 417186)
-- Name: domicilios; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE domicilios (
    id integer NOT NULL,
    contratista_id integer NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone DEFAULT now(),
    sys_finalizado_el timestamp with time zone DEFAULT now(),
    direccion_id integer NOT NULL,
    documento_registrado_id integer,
    fiscal boolean NOT NULL
);


ALTER TABLE public.domicilios OWNER TO eureka;

--
-- TOC entry 3997 (class 0 OID 0)
-- Dependencies: 273
-- Name: TABLE domicilios; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE domicilios IS 'Tabla donde se almacenan los domicilios  de la contratista.';


--
-- TOC entry 3998 (class 0 OID 0)
-- Dependencies: 273
-- Name: COLUMN domicilios.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN domicilios.id IS 'Clave primaria';


--
-- TOC entry 3999 (class 0 OID 0)
-- Dependencies: 273
-- Name: COLUMN domicilios.contratista_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN domicilios.contratista_id IS 'Clave foranea a la tabla  contratistas';


--
-- TOC entry 4000 (class 0 OID 0)
-- Dependencies: 273
-- Name: COLUMN domicilios.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN domicilios.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 4001 (class 0 OID 0)
-- Dependencies: 273
-- Name: COLUMN domicilios.sys_creado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN domicilios.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 4002 (class 0 OID 0)
-- Dependencies: 273
-- Name: COLUMN domicilios.sys_actualizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN domicilios.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 4003 (class 0 OID 0)
-- Dependencies: 273
-- Name: COLUMN domicilios.sys_finalizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN domicilios.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 4004 (class 0 OID 0)
-- Dependencies: 273
-- Name: COLUMN domicilios.direccion_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN domicilios.direccion_id IS 'Clave foranea a la tabla de direcciones';


--
-- TOC entry 4005 (class 0 OID 0)
-- Dependencies: 273
-- Name: COLUMN domicilios.documento_registrado_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN domicilios.documento_registrado_id IS 'Clave foranea a la tabla documentos registrados  en el esquema activos';


--
-- TOC entry 4006 (class 0 OID 0)
-- Dependencies: 273
-- Name: COLUMN domicilios.fiscal; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN domicilios.fiscal IS 'Si es true es una direccion fiscal, si es false es una direccion principal';


--
-- TOC entry 274 (class 1259 OID 417193)
-- Name: domicilios_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE domicilios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.domicilios_id_seq OWNER TO eureka;

--
-- TOC entry 4007 (class 0 OID 0)
-- Dependencies: 274
-- Name: domicilios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE domicilios_id_seq OWNED BY domicilios.id;


--
-- TOC entry 275 (class 1259 OID 417195)
-- Name: duraciones_empresas; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE duraciones_empresas (
    id integer NOT NULL,
    contratista_id integer NOT NULL,
    documento_registrado_id integer NOT NULL,
    tiempo_prorroga integer NOT NULL,
    fecha_vencimiento date NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone DEFAULT now(),
    sys_finalizado_el timestamp with time zone DEFAULT now()
);


ALTER TABLE public.duraciones_empresas OWNER TO eureka;

--
-- TOC entry 4008 (class 0 OID 0)
-- Dependencies: 275
-- Name: TABLE duraciones_empresas; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE duraciones_empresas IS 'Tabla donde se almacenan la duracion de la contratista.';


--
-- TOC entry 4009 (class 0 OID 0)
-- Dependencies: 275
-- Name: COLUMN duraciones_empresas.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN duraciones_empresas.id IS 'Clave primaria';


--
-- TOC entry 4010 (class 0 OID 0)
-- Dependencies: 275
-- Name: COLUMN duraciones_empresas.contratista_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN duraciones_empresas.contratista_id IS 'Clave foranea a la tabla  contratistas';


--
-- TOC entry 4011 (class 0 OID 0)
-- Dependencies: 275
-- Name: COLUMN duraciones_empresas.documento_registrado_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN duraciones_empresas.documento_registrado_id IS 'Clave foranea a la tabla documentos registrados  en el esquema activos';


--
-- TOC entry 4012 (class 0 OID 0)
-- Dependencies: 275
-- Name: COLUMN duraciones_empresas.tiempo_prorroga; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN duraciones_empresas.tiempo_prorroga IS 'Tiempo de prorroga solicitado en caso de ser una modificacion';


--
-- TOC entry 4013 (class 0 OID 0)
-- Dependencies: 275
-- Name: COLUMN duraciones_empresas.fecha_vencimiento; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN duraciones_empresas.fecha_vencimiento IS 'Fecha vencimiento de la empresa';


--
-- TOC entry 4014 (class 0 OID 0)
-- Dependencies: 275
-- Name: COLUMN duraciones_empresas.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN duraciones_empresas.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 4015 (class 0 OID 0)
-- Dependencies: 275
-- Name: COLUMN duraciones_empresas.sys_creado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN duraciones_empresas.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 4016 (class 0 OID 0)
-- Dependencies: 275
-- Name: COLUMN duraciones_empresas.sys_actualizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN duraciones_empresas.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 4017 (class 0 OID 0)
-- Dependencies: 275
-- Name: COLUMN duraciones_empresas.sys_finalizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN duraciones_empresas.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 276 (class 1259 OID 417202)
-- Name: duraciones_emepresas_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE duraciones_emepresas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.duraciones_emepresas_id_seq OWNER TO eureka;

--
-- TOC entry 4018 (class 0 OID 0)
-- Dependencies: 276
-- Name: duraciones_emepresas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE duraciones_emepresas_id_seq OWNED BY duraciones_empresas.id;


--
-- TOC entry 277 (class 1259 OID 417204)
-- Name: empresas_relacionadas; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE empresas_relacionadas (
    id integer NOT NULL,
    tipo_relacion tipo_relacion_empresa NOT NULL,
    tipo_sector tipo_sector NOT NULL,
    sys_pais_id integer,
    fecha_inicio date,
    fecha_fin date,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone,
    sys_finalizado_el timestamp with time zone,
    persona_juridica_id integer NOT NULL,
    persona_contacto_id integer NOT NULL
);


ALTER TABLE public.empresas_relacionadas OWNER TO eureka;

--
-- TOC entry 4019 (class 0 OID 0)
-- Dependencies: 277
-- Name: TABLE empresas_relacionadas; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE empresas_relacionadas IS 'Tabla que almacena las empresas relacionadas con la contratista';


--
-- TOC entry 4020 (class 0 OID 0)
-- Dependencies: 277
-- Name: COLUMN empresas_relacionadas.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN empresas_relacionadas.id IS 'Clave primaria';


--
-- TOC entry 4021 (class 0 OID 0)
-- Dependencies: 277
-- Name: COLUMN empresas_relacionadas.tipo_relacion; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN empresas_relacionadas.tipo_relacion IS 'Tipo de relacion empresa puede ser accionista,inversion, cliente,  proveedor, convenio,filial / subsidiaria';


--
-- TOC entry 4022 (class 0 OID 0)
-- Dependencies: 277
-- Name: COLUMN empresas_relacionadas.tipo_sector; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN empresas_relacionadas.tipo_sector IS 'Tipo sector puede ser Publico o Privado';


--
-- TOC entry 4023 (class 0 OID 0)
-- Dependencies: 277
-- Name: COLUMN empresas_relacionadas.sys_pais_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN empresas_relacionadas.sys_pais_id IS 'Clave foranea a la tabla sys_paises en caso de ser extranjero';


--
-- TOC entry 4024 (class 0 OID 0)
-- Dependencies: 277
-- Name: COLUMN empresas_relacionadas.fecha_inicio; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN empresas_relacionadas.fecha_inicio IS 'Fecha de vigencia del inicio solo extranjeros';


--
-- TOC entry 4025 (class 0 OID 0)
-- Dependencies: 277
-- Name: COLUMN empresas_relacionadas.fecha_fin; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN empresas_relacionadas.fecha_fin IS 'Fecha vigencia fin solo extranjeros';


--
-- TOC entry 4026 (class 0 OID 0)
-- Dependencies: 277
-- Name: COLUMN empresas_relacionadas.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN empresas_relacionadas.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 4027 (class 0 OID 0)
-- Dependencies: 277
-- Name: COLUMN empresas_relacionadas.sys_creado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN empresas_relacionadas.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 4028 (class 0 OID 0)
-- Dependencies: 277
-- Name: COLUMN empresas_relacionadas.sys_actualizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN empresas_relacionadas.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 4029 (class 0 OID 0)
-- Dependencies: 277
-- Name: COLUMN empresas_relacionadas.sys_finalizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN empresas_relacionadas.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 4030 (class 0 OID 0)
-- Dependencies: 277
-- Name: COLUMN empresas_relacionadas.persona_juridica_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN empresas_relacionadas.persona_juridica_id IS 'Clave foranea a la tabla personas juridicas';


--
-- TOC entry 4031 (class 0 OID 0)
-- Dependencies: 277
-- Name: COLUMN empresas_relacionadas.persona_contacto_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN empresas_relacionadas.persona_contacto_id IS 'Clave foranea a personas_naturales';


--
-- TOC entry 278 (class 1259 OID 417209)
-- Name: empresas_relacionadas_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE empresas_relacionadas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.empresas_relacionadas_id_seq OWNER TO eureka;

--
-- TOC entry 4032 (class 0 OID 0)
-- Dependencies: 278
-- Name: empresas_relacionadas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE empresas_relacionadas_id_seq OWNED BY empresas_relacionadas.id;


--
-- TOC entry 279 (class 1259 OID 417211)
-- Name: estatus_contratistas; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE estatus_contratistas (
    id integer NOT NULL,
    descripcion text NOT NULL,
    informacion_adicional text,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone DEFAULT now(),
    sys_finalizado_el timestamp with time zone DEFAULT now()
);


ALTER TABLE public.estatus_contratistas OWNER TO eureka;

--
-- TOC entry 4033 (class 0 OID 0)
-- Dependencies: 279
-- Name: COLUMN estatus_contratistas.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN estatus_contratistas.id IS 'Clave primaria';


--
-- TOC entry 4034 (class 0 OID 0)
-- Dependencies: 279
-- Name: COLUMN estatus_contratistas.descripcion; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN estatus_contratistas.descripcion IS 'Descripcion del estado';


--
-- TOC entry 4035 (class 0 OID 0)
-- Dependencies: 279
-- Name: COLUMN estatus_contratistas.informacion_adicional; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN estatus_contratistas.informacion_adicional IS 'Informacion que complemente la descripcion';


--
-- TOC entry 4036 (class 0 OID 0)
-- Dependencies: 279
-- Name: COLUMN estatus_contratistas.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN estatus_contratistas.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 4037 (class 0 OID 0)
-- Dependencies: 279
-- Name: COLUMN estatus_contratistas.sys_creado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN estatus_contratistas.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 4038 (class 0 OID 0)
-- Dependencies: 279
-- Name: COLUMN estatus_contratistas.sys_actualizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN estatus_contratistas.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 4039 (class 0 OID 0)
-- Dependencies: 279
-- Name: COLUMN estatus_contratistas.sys_finalizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN estatus_contratistas.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 280 (class 1259 OID 417221)
-- Name: estatus_contratistas_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE estatus_contratistas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.estatus_contratistas_id_seq OWNER TO eureka;

--
-- TOC entry 4040 (class 0 OID 0)
-- Dependencies: 280
-- Name: estatus_contratistas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE estatus_contratistas_id_seq OWNED BY estatus_contratistas.id;


--
-- TOC entry 281 (class 1259 OID 417223)
-- Name: fondos_reservas; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE fondos_reservas (
    id integer NOT NULL,
    acta_constitutiva_id integer NOT NULL,
    nombre_fondo character varying(255) NOT NULL,
    porcentaje double precision NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone DEFAULT now(),
    sys_finalizado_el timestamp with time zone DEFAULT now()
);


ALTER TABLE public.fondos_reservas OWNER TO eureka;

--
-- TOC entry 4041 (class 0 OID 0)
-- Dependencies: 281
-- Name: TABLE fondos_reservas; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE fondos_reservas IS 'Tabla donde se almacenan los fondos reservas';


--
-- TOC entry 4042 (class 0 OID 0)
-- Dependencies: 281
-- Name: COLUMN fondos_reservas.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN fondos_reservas.id IS 'Clave primaria';


--
-- TOC entry 4043 (class 0 OID 0)
-- Dependencies: 281
-- Name: COLUMN fondos_reservas.acta_constitutiva_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN fondos_reservas.acta_constitutiva_id IS 'Clave foranea a la tabla actas_constitutivas';


--
-- TOC entry 4044 (class 0 OID 0)
-- Dependencies: 281
-- Name: COLUMN fondos_reservas.nombre_fondo; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN fondos_reservas.nombre_fondo IS 'Nombre del fondo o reserva';


--
-- TOC entry 4045 (class 0 OID 0)
-- Dependencies: 281
-- Name: COLUMN fondos_reservas.porcentaje; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN fondos_reservas.porcentaje IS 'Porcentaje asignado al fondo';


--
-- TOC entry 4046 (class 0 OID 0)
-- Dependencies: 281
-- Name: COLUMN fondos_reservas.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN fondos_reservas.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 4047 (class 0 OID 0)
-- Dependencies: 281
-- Name: COLUMN fondos_reservas.sys_creado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN fondos_reservas.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 4048 (class 0 OID 0)
-- Dependencies: 281
-- Name: COLUMN fondos_reservas.sys_actualizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN fondos_reservas.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 4049 (class 0 OID 0)
-- Dependencies: 281
-- Name: COLUMN fondos_reservas.sys_finalizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN fondos_reservas.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 282 (class 1259 OID 417230)
-- Name: fondos_reservas_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE fondos_reservas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fondos_reservas_id_seq OWNER TO eureka;

--
-- TOC entry 4050 (class 0 OID 0)
-- Dependencies: 282
-- Name: fondos_reservas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE fondos_reservas_id_seq OWNED BY fondos_reservas.id;


--
-- TOC entry 283 (class 1259 OID 417232)
-- Name: sys_inpc; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE sys_inpc (
    id integer NOT NULL,
    mes integer NOT NULL,
    indice numeric(38,6) NOT NULL,
    anho integer NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone DEFAULT now(),
    sys_finalizado_el timestamp with time zone DEFAULT now()
);


ALTER TABLE public.sys_inpc OWNER TO eureka;

--
-- TOC entry 4051 (class 0 OID 0)
-- Dependencies: 283
-- Name: TABLE sys_inpc; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE sys_inpc IS 'Indice nacional de precio al consumidor';


--
-- TOC entry 4052 (class 0 OID 0)
-- Dependencies: 283
-- Name: COLUMN sys_inpc.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_inpc.id IS 'Clave primaria';


--
-- TOC entry 4053 (class 0 OID 0)
-- Dependencies: 283
-- Name: COLUMN sys_inpc.mes; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_inpc.mes IS 'Mes del inpc';


--
-- TOC entry 4054 (class 0 OID 0)
-- Dependencies: 283
-- Name: COLUMN sys_inpc.indice; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_inpc.indice IS 'Valor del inpc del mes.';


--
-- TOC entry 4055 (class 0 OID 0)
-- Dependencies: 283
-- Name: COLUMN sys_inpc.anho; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_inpc.anho IS 'Año cargado del inpc';


--
-- TOC entry 4056 (class 0 OID 0)
-- Dependencies: 283
-- Name: COLUMN sys_inpc.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_inpc.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 4057 (class 0 OID 0)
-- Dependencies: 283
-- Name: COLUMN sys_inpc.sys_creado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_inpc.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 4058 (class 0 OID 0)
-- Dependencies: 283
-- Name: COLUMN sys_inpc.sys_actualizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_inpc.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 4059 (class 0 OID 0)
-- Dependencies: 283
-- Name: COLUMN sys_inpc.sys_finalizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_inpc.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 284 (class 1259 OID 417239)
-- Name: inpc_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE inpc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inpc_id_seq OWNER TO eureka;

--
-- TOC entry 4060 (class 0 OID 0)
-- Dependencies: 284
-- Name: inpc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE inpc_id_seq OWNED BY sys_inpc.id;


--
-- TOC entry 285 (class 1259 OID 417241)
-- Name: migration; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE migration (
    version character varying(180) NOT NULL,
    apply_time integer
);


ALTER TABLE public.migration OWNER TO eureka;

--
-- TOC entry 286 (class 1259 OID 417244)
-- Name: sys_naturales_juridicas; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE sys_naturales_juridicas (
    id integer NOT NULL,
    rif character varying(20) NOT NULL,
    juridica boolean NOT NULL,
    denominacion character varying(255) NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone DEFAULT now(),
    sys_finalizado_el timestamp with time zone DEFAULT now()
);


ALTER TABLE public.sys_naturales_juridicas OWNER TO eureka;

--
-- TOC entry 4061 (class 0 OID 0)
-- Dependencies: 286
-- Name: TABLE sys_naturales_juridicas; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE sys_naturales_juridicas IS 'Almacena todos los rif de las personas naturales y juridicas en el sistema ';


--
-- TOC entry 4062 (class 0 OID 0)
-- Dependencies: 286
-- Name: COLUMN sys_naturales_juridicas.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_naturales_juridicas.id IS 'Clave primaria';


--
-- TOC entry 4063 (class 0 OID 0)
-- Dependencies: 286
-- Name: COLUMN sys_naturales_juridicas.rif; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_naturales_juridicas.rif IS 'Rgistro de informacion fiscal';


--
-- TOC entry 4064 (class 0 OID 0)
-- Dependencies: 286
-- Name: COLUMN sys_naturales_juridicas.juridica; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_naturales_juridicas.juridica IS 'Si el rif pertenece a una figura juridica o natural';


--
-- TOC entry 4065 (class 0 OID 0)
-- Dependencies: 286
-- Name: COLUMN sys_naturales_juridicas.denominacion; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_naturales_juridicas.denominacion IS 'Nombre de la persona juridica o la concatenacion del nombre y apellido de una persona natural.';


--
-- TOC entry 4066 (class 0 OID 0)
-- Dependencies: 286
-- Name: COLUMN sys_naturales_juridicas.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_naturales_juridicas.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 4067 (class 0 OID 0)
-- Dependencies: 286
-- Name: COLUMN sys_naturales_juridicas.sys_creado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_naturales_juridicas.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 4068 (class 0 OID 0)
-- Dependencies: 286
-- Name: COLUMN sys_naturales_juridicas.sys_actualizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_naturales_juridicas.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 4069 (class 0 OID 0)
-- Dependencies: 286
-- Name: COLUMN sys_naturales_juridicas.sys_finalizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_naturales_juridicas.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 287 (class 1259 OID 417251)
-- Name: naturales_juridicas_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE naturales_juridicas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.naturales_juridicas_id_seq OWNER TO eureka;

--
-- TOC entry 4070 (class 0 OID 0)
-- Dependencies: 287
-- Name: naturales_juridicas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE naturales_juridicas_id_seq OWNED BY sys_naturales_juridicas.id;


--
-- TOC entry 288 (class 1259 OID 417253)
-- Name: nombres_cajas; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE nombres_cajas (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    contratistas_id integer NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone DEFAULT now(),
    sys_finalizado_el timestamp with time zone DEFAULT now(),
    tipo_caja tipo_moneda_enum NOT NULL
);


ALTER TABLE public.nombres_cajas OWNER TO eureka;

--
-- TOC entry 4071 (class 0 OID 0)
-- Dependencies: 288
-- Name: TABLE nombres_cajas; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE nombres_cajas IS 'Nombre de las cajas que tienen los contratistas';


--
-- TOC entry 4072 (class 0 OID 0)
-- Dependencies: 288
-- Name: COLUMN nombres_cajas.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN nombres_cajas.id IS 'Clave primaria';


--
-- TOC entry 4073 (class 0 OID 0)
-- Dependencies: 288
-- Name: COLUMN nombres_cajas.nombre; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN nombres_cajas.nombre IS 'Nombre de la caja';


--
-- TOC entry 4074 (class 0 OID 0)
-- Dependencies: 288
-- Name: COLUMN nombres_cajas.contratistas_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN nombres_cajas.contratistas_id IS 'Clave foranea a la tabla contratistas';


--
-- TOC entry 4075 (class 0 OID 0)
-- Dependencies: 288
-- Name: COLUMN nombres_cajas.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN nombres_cajas.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 4076 (class 0 OID 0)
-- Dependencies: 288
-- Name: COLUMN nombres_cajas.sys_creado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN nombres_cajas.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 4077 (class 0 OID 0)
-- Dependencies: 288
-- Name: COLUMN nombres_cajas.sys_actualizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN nombres_cajas.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 4078 (class 0 OID 0)
-- Dependencies: 288
-- Name: COLUMN nombres_cajas.sys_finalizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN nombres_cajas.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 4079 (class 0 OID 0)
-- Dependencies: 288
-- Name: COLUMN nombres_cajas.tipo_caja; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN nombres_cajas.tipo_caja IS 'Valor que indica si la caja fue creada para moneda nacional o extranjera';


--
-- TOC entry 289 (class 1259 OID 417260)
-- Name: nombres_cajas_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE nombres_cajas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nombres_cajas_id_seq OWNER TO eureka;

--
-- TOC entry 4080 (class 0 OID 0)
-- Dependencies: 289
-- Name: nombres_cajas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE nombres_cajas_id_seq OWNED BY nombres_cajas.id;


--
-- TOC entry 290 (class 1259 OID 417262)
-- Name: notas_revelatorias; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE notas_revelatorias (
    id integer NOT NULL,
    nota text NOT NULL,
    contratista_id integer NOT NULL,
    usuario_id integer NOT NULL,
    estado boolean DEFAULT true NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone DEFAULT now(),
    sys_finalizado_el timestamp with time zone DEFAULT now()
);


ALTER TABLE public.notas_revelatorias OWNER TO eureka;

--
-- TOC entry 4081 (class 0 OID 0)
-- Dependencies: 290
-- Name: TABLE notas_revelatorias; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE notas_revelatorias IS 'Tabla donde se alojan las notas revelatorias de los contratistas';


--
-- TOC entry 4082 (class 0 OID 0)
-- Dependencies: 290
-- Name: COLUMN notas_revelatorias.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN notas_revelatorias.id IS 'Clave foranea';


--
-- TOC entry 4083 (class 0 OID 0)
-- Dependencies: 290
-- Name: COLUMN notas_revelatorias.nota; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN notas_revelatorias.nota IS 'Nota creada por el usuario secundario del contratista';


--
-- TOC entry 4084 (class 0 OID 0)
-- Dependencies: 290
-- Name: COLUMN notas_revelatorias.contratista_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN notas_revelatorias.contratista_id IS 'Clave foranea a la tabla contratistas';


--
-- TOC entry 4085 (class 0 OID 0)
-- Dependencies: 290
-- Name: COLUMN notas_revelatorias.usuario_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN notas_revelatorias.usuario_id IS 'Clave foranea a la tabla de usuarios, haciendo referencia al usuario que creo la nota revelatoria';


--
-- TOC entry 4086 (class 0 OID 0)
-- Dependencies: 290
-- Name: COLUMN notas_revelatorias.estado; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN notas_revelatorias.estado IS 'Si la nota esta activa o no';


--
-- TOC entry 4087 (class 0 OID 0)
-- Dependencies: 290
-- Name: COLUMN notas_revelatorias.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN notas_revelatorias.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 4088 (class 0 OID 0)
-- Dependencies: 290
-- Name: COLUMN notas_revelatorias.sys_creado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN notas_revelatorias.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 4089 (class 0 OID 0)
-- Dependencies: 290
-- Name: COLUMN notas_revelatorias.sys_actualizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN notas_revelatorias.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 4090 (class 0 OID 0)
-- Dependencies: 290
-- Name: COLUMN notas_revelatorias.sys_finalizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN notas_revelatorias.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 291 (class 1259 OID 417273)
-- Name: notas_revelatorias_cuentas; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE notas_revelatorias_cuentas (
    id integer NOT NULL,
    nota_revelatoria_id integer NOT NULL,
    sys_cuenta_id integer NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone,
    sys_finalizado_el timestamp with time zone
);


ALTER TABLE public.notas_revelatorias_cuentas OWNER TO eureka;

--
-- TOC entry 4091 (class 0 OID 0)
-- Dependencies: 291
-- Name: TABLE notas_revelatorias_cuentas; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE notas_revelatorias_cuentas IS 'Tabla relación, donde se almacenan las notas revelatorias asociadas a la cuenta.';


--
-- TOC entry 4092 (class 0 OID 0)
-- Dependencies: 291
-- Name: COLUMN notas_revelatorias_cuentas.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN notas_revelatorias_cuentas.id IS 'Clave primaria';


--
-- TOC entry 4093 (class 0 OID 0)
-- Dependencies: 291
-- Name: COLUMN notas_revelatorias_cuentas.nota_revelatoria_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN notas_revelatorias_cuentas.nota_revelatoria_id IS 'Clave foránea a la tabla notas_revelatorias';


--
-- TOC entry 4094 (class 0 OID 0)
-- Dependencies: 291
-- Name: COLUMN notas_revelatorias_cuentas.sys_cuenta_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN notas_revelatorias_cuentas.sys_cuenta_id IS 'Clave foránea a la tabla sys_cuentas.';


--
-- TOC entry 4095 (class 0 OID 0)
-- Dependencies: 291
-- Name: COLUMN notas_revelatorias_cuentas.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN notas_revelatorias_cuentas.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 4096 (class 0 OID 0)
-- Dependencies: 291
-- Name: COLUMN notas_revelatorias_cuentas.sys_creado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN notas_revelatorias_cuentas.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 4097 (class 0 OID 0)
-- Dependencies: 291
-- Name: COLUMN notas_revelatorias_cuentas.sys_actualizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN notas_revelatorias_cuentas.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 4098 (class 0 OID 0)
-- Dependencies: 291
-- Name: COLUMN notas_revelatorias_cuentas.sys_finalizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN notas_revelatorias_cuentas.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 292 (class 1259 OID 417278)
-- Name: notas_revelatorias_cuentas_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE notas_revelatorias_cuentas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notas_revelatorias_cuentas_id_seq OWNER TO eureka;

--
-- TOC entry 4099 (class 0 OID 0)
-- Dependencies: 292
-- Name: notas_revelatorias_cuentas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE notas_revelatorias_cuentas_id_seq OWNED BY notas_revelatorias_cuentas.id;


--
-- TOC entry 293 (class 1259 OID 417280)
-- Name: notas_revelatorias_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE notas_revelatorias_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notas_revelatorias_id_seq OWNER TO eureka;

--
-- TOC entry 4100 (class 0 OID 0)
-- Dependencies: 293
-- Name: notas_revelatorias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE notas_revelatorias_id_seq OWNED BY notas_revelatorias.id;


--
-- TOC entry 294 (class 1259 OID 417282)
-- Name: objetos_autorizaciones; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE objetos_autorizaciones (
    id integer NOT NULL,
    objeto_empresa_id integer NOT NULL,
    domicilio_fabricante_id integer NOT NULL,
    productos text NOT NULL,
    marcas text NOT NULL,
    origen_producto_id integer NOT NULL,
    sello_firma boolean,
    idioma_redacion_id integer,
    documento_traducido boolean,
    numero_identificacion character varying(255),
    nombre_interprete character varying(255),
    fecha_emision date,
    fecha_vencimiento character varying(255),
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone DEFAULT now(),
    sys_finalizado_el timestamp with time zone DEFAULT now(),
    persona_juridica_id integer NOT NULL
);


ALTER TABLE public.objetos_autorizaciones OWNER TO eureka;

--
-- TOC entry 4101 (class 0 OID 0)
-- Dependencies: 294
-- Name: TABLE objetos_autorizaciones; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE objetos_autorizaciones IS 'Tabla donde se almacenan todos los objeto que pueda tener la contratista.';


--
-- TOC entry 4102 (class 0 OID 0)
-- Dependencies: 294
-- Name: COLUMN objetos_autorizaciones.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN objetos_autorizaciones.id IS 'Clave primaria';


--
-- TOC entry 4103 (class 0 OID 0)
-- Dependencies: 294
-- Name: COLUMN objetos_autorizaciones.objeto_empresa_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN objetos_autorizaciones.objeto_empresa_id IS 'Clave foranea a la tabla contratistas';


--
-- TOC entry 4104 (class 0 OID 0)
-- Dependencies: 294
-- Name: COLUMN objetos_autorizaciones.domicilio_fabricante_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN objetos_autorizaciones.domicilio_fabricante_id IS 'Clave foranea a la tabla sys_paises';


--
-- TOC entry 4105 (class 0 OID 0)
-- Dependencies: 294
-- Name: COLUMN objetos_autorizaciones.productos; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN objetos_autorizaciones.productos IS 'Nombre de los productos';


--
-- TOC entry 4106 (class 0 OID 0)
-- Dependencies: 294
-- Name: COLUMN objetos_autorizaciones.marcas; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN objetos_autorizaciones.marcas IS 'Nombre de las marcas';


--
-- TOC entry 4107 (class 0 OID 0)
-- Dependencies: 294
-- Name: COLUMN objetos_autorizaciones.origen_producto_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN objetos_autorizaciones.origen_producto_id IS 'Clave foranea a la tabla sys_paises representa el pais de origen del producto';


--
-- TOC entry 4108 (class 0 OID 0)
-- Dependencies: 294
-- Name: COLUMN objetos_autorizaciones.sello_firma; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN objetos_autorizaciones.sello_firma IS 'True si posee sello y firma del consulado';


--
-- TOC entry 4109 (class 0 OID 0)
-- Dependencies: 294
-- Name: COLUMN objetos_autorizaciones.idioma_redacion_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN objetos_autorizaciones.idioma_redacion_id IS 'Clave foranea a la tabal sys idiomas';


--
-- TOC entry 4110 (class 0 OID 0)
-- Dependencies: 294
-- Name: COLUMN objetos_autorizaciones.documento_traducido; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN objetos_autorizaciones.documento_traducido IS 'True si se encuentra traducido al castellano, false sino esta traducido';


--
-- TOC entry 4111 (class 0 OID 0)
-- Dependencies: 294
-- Name: COLUMN objetos_autorizaciones.numero_identificacion; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN objetos_autorizaciones.numero_identificacion IS 'Numero de documento de identificacion';


--
-- TOC entry 4112 (class 0 OID 0)
-- Dependencies: 294
-- Name: COLUMN objetos_autorizaciones.nombre_interprete; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN objetos_autorizaciones.nombre_interprete IS 'Nombre y apellido del interprete';


--
-- TOC entry 4113 (class 0 OID 0)
-- Dependencies: 294
-- Name: COLUMN objetos_autorizaciones.fecha_emision; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN objetos_autorizaciones.fecha_emision IS 'Fecha emision';


--
-- TOC entry 4114 (class 0 OID 0)
-- Dependencies: 294
-- Name: COLUMN objetos_autorizaciones.fecha_vencimiento; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN objetos_autorizaciones.fecha_vencimiento IS 'Fecha de vencimiento';


--
-- TOC entry 4115 (class 0 OID 0)
-- Dependencies: 294
-- Name: COLUMN objetos_autorizaciones.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN objetos_autorizaciones.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 4116 (class 0 OID 0)
-- Dependencies: 294
-- Name: COLUMN objetos_autorizaciones.sys_creado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN objetos_autorizaciones.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 4117 (class 0 OID 0)
-- Dependencies: 294
-- Name: COLUMN objetos_autorizaciones.sys_actualizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN objetos_autorizaciones.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 4118 (class 0 OID 0)
-- Dependencies: 294
-- Name: COLUMN objetos_autorizaciones.sys_finalizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN objetos_autorizaciones.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 4119 (class 0 OID 0)
-- Dependencies: 294
-- Name: COLUMN objetos_autorizaciones.persona_juridica_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN objetos_autorizaciones.persona_juridica_id IS 'CLave foranea a la tabla personas_juridicas';


--
-- TOC entry 295 (class 1259 OID 417292)
-- Name: objetos_autorizaciones_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE objetos_autorizaciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.objetos_autorizaciones_id_seq OWNER TO eureka;

--
-- TOC entry 4120 (class 0 OID 0)
-- Dependencies: 295
-- Name: objetos_autorizaciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE objetos_autorizaciones_id_seq OWNED BY objetos_autorizaciones.id;


--
-- TOC entry 296 (class 1259 OID 417294)
-- Name: objetos_empresas; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE objetos_empresas (
    id integer NOT NULL,
    nombre objeto_empresa NOT NULL,
    tipo_relacion boolean NOT NULL,
    autorizacion boolean NOT NULL,
    relacion_id integer NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone DEFAULT now(),
    sys_finalizado_el timestamp with time zone DEFAULT now()
);


ALTER TABLE public.objetos_empresas OWNER TO eureka;

--
-- TOC entry 4121 (class 0 OID 0)
-- Dependencies: 296
-- Name: TABLE objetos_empresas; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE objetos_empresas IS 'Tabla donde se almacenan todos los objeto que pueda tener la contratista.';


--
-- TOC entry 4122 (class 0 OID 0)
-- Dependencies: 296
-- Name: COLUMN objetos_empresas.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN objetos_empresas.id IS 'Clave primaria';


--
-- TOC entry 4123 (class 0 OID 0)
-- Dependencies: 296
-- Name: COLUMN objetos_empresas.nombre; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN objetos_empresas.nombre IS 'Nombre del objeto de la empresa';


--
-- TOC entry 4124 (class 0 OID 0)
-- Dependencies: 296
-- Name: COLUMN objetos_empresas.tipo_relacion; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN objetos_empresas.tipo_relacion IS 'Tipo de relacion si es true es con contratista, si es false con empresas_relacionadas';


--
-- TOC entry 4125 (class 0 OID 0)
-- Dependencies: 296
-- Name: COLUMN objetos_empresas.autorizacion; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN objetos_empresas.autorizacion IS 'Si tiene o no datos en la tabla objetos_autorizaciones';


--
-- TOC entry 4126 (class 0 OID 0)
-- Dependencies: 296
-- Name: COLUMN objetos_empresas.relacion_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN objetos_empresas.relacion_id IS 'Clave foranea a la tabla contratista o a la tabla empresas_relacionadas';


--
-- TOC entry 4127 (class 0 OID 0)
-- Dependencies: 296
-- Name: COLUMN objetos_empresas.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN objetos_empresas.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 4128 (class 0 OID 0)
-- Dependencies: 296
-- Name: COLUMN objetos_empresas.sys_creado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN objetos_empresas.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 4129 (class 0 OID 0)
-- Dependencies: 296
-- Name: COLUMN objetos_empresas.sys_actualizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN objetos_empresas.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 4130 (class 0 OID 0)
-- Dependencies: 296
-- Name: COLUMN objetos_empresas.sys_finalizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN objetos_empresas.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 297 (class 1259 OID 417301)
-- Name: objetos_empresas_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE objetos_empresas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.objetos_empresas_id_seq OWNER TO eureka;

--
-- TOC entry 4131 (class 0 OID 0)
-- Dependencies: 297
-- Name: objetos_empresas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE objetos_empresas_id_seq OWNED BY objetos_empresas.id;


--
-- TOC entry 298 (class 1259 OID 417303)
-- Name: objetos_sociales; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE objetos_sociales (
    id integer NOT NULL,
    contratista_id integer NOT NULL,
    documento_registrado_id integer NOT NULL,
    tipo_objeto tipo_objeto_social NOT NULL,
    descripcion text NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone DEFAULT now(),
    sys_finalizado_el timestamp with time zone DEFAULT now()
);


ALTER TABLE public.objetos_sociales OWNER TO eureka;

--
-- TOC entry 4132 (class 0 OID 0)
-- Dependencies: 298
-- Name: TABLE objetos_sociales; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE objetos_sociales IS 'Tabla donde se almacenan los objetos sociales  de la contratista.';


--
-- TOC entry 4133 (class 0 OID 0)
-- Dependencies: 298
-- Name: COLUMN objetos_sociales.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN objetos_sociales.id IS 'Clave primaria';


--
-- TOC entry 4134 (class 0 OID 0)
-- Dependencies: 298
-- Name: COLUMN objetos_sociales.contratista_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN objetos_sociales.contratista_id IS 'Clave foranea a la tabla  contratistas';


--
-- TOC entry 4135 (class 0 OID 0)
-- Dependencies: 298
-- Name: COLUMN objetos_sociales.documento_registrado_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN objetos_sociales.documento_registrado_id IS 'Clave foranea a la tabla documentos registrados  en el esquema activos';


--
-- TOC entry 4136 (class 0 OID 0)
-- Dependencies: 298
-- Name: COLUMN objetos_sociales.tipo_objeto; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN objetos_sociales.tipo_objeto IS 'Tipo de objeto social puede ser principal, ampliacion, modificacion total, modificacion parcial';


--
-- TOC entry 4137 (class 0 OID 0)
-- Dependencies: 298
-- Name: COLUMN objetos_sociales.descripcion; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN objetos_sociales.descripcion IS 'Descripcion del objeto social';


--
-- TOC entry 4138 (class 0 OID 0)
-- Dependencies: 298
-- Name: COLUMN objetos_sociales.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN objetos_sociales.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 4139 (class 0 OID 0)
-- Dependencies: 298
-- Name: COLUMN objetos_sociales.sys_creado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN objetos_sociales.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 4140 (class 0 OID 0)
-- Dependencies: 298
-- Name: COLUMN objetos_sociales.sys_actualizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN objetos_sociales.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 4141 (class 0 OID 0)
-- Dependencies: 298
-- Name: COLUMN objetos_sociales.sys_finalizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN objetos_sociales.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 299 (class 1259 OID 417313)
-- Name: objetos_sociales_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE objetos_sociales_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.objetos_sociales_id_seq OWNER TO eureka;

--
-- TOC entry 4142 (class 0 OID 0)
-- Dependencies: 299
-- Name: objetos_sociales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE objetos_sociales_id_seq OWNED BY objetos_sociales.id;


--
-- TOC entry 300 (class 1259 OID 417315)
-- Name: personas_juridicas; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE personas_juridicas (
    id integer NOT NULL,
    rif character varying(20),
    razon_social character varying(255),
    creado_por integer NOT NULL,
    numero_identitifacion character varying(255),
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone,
    sys_finalizado_el timestamp with time zone,
    tipo_nacionalidad tipo_nacionalidad
);


ALTER TABLE public.personas_juridicas OWNER TO eureka;

--
-- TOC entry 4143 (class 0 OID 0)
-- Dependencies: 300
-- Name: TABLE personas_juridicas; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE personas_juridicas IS 'Tabla para almacenar toda la figura juridica en el sistema';


--
-- TOC entry 4144 (class 0 OID 0)
-- Dependencies: 300
-- Name: COLUMN personas_juridicas.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN personas_juridicas.id IS 'Clave primaria';


--
-- TOC entry 4145 (class 0 OID 0)
-- Dependencies: 300
-- Name: COLUMN personas_juridicas.rif; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN personas_juridicas.rif IS 'Registro de informacion fiscal';


--
-- TOC entry 4146 (class 0 OID 0)
-- Dependencies: 300
-- Name: COLUMN personas_juridicas.razon_social; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN personas_juridicas.razon_social IS 'Nombre e la empresa registada';


--
-- TOC entry 4147 (class 0 OID 0)
-- Dependencies: 300
-- Name: COLUMN personas_juridicas.creado_por; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN personas_juridicas.creado_por IS 'Mantiene la referencia al usuario que realizo la insercion';


--
-- TOC entry 4148 (class 0 OID 0)
-- Dependencies: 300
-- Name: COLUMN personas_juridicas.numero_identitifacion; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN personas_juridicas.numero_identitifacion IS 'Numero de identificacion en caso de ser una empresa extranjera';


--
-- TOC entry 4149 (class 0 OID 0)
-- Dependencies: 300
-- Name: COLUMN personas_juridicas.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN personas_juridicas.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 4150 (class 0 OID 0)
-- Dependencies: 300
-- Name: COLUMN personas_juridicas.sys_creado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN personas_juridicas.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 4151 (class 0 OID 0)
-- Dependencies: 300
-- Name: COLUMN personas_juridicas.sys_actualizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN personas_juridicas.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 4152 (class 0 OID 0)
-- Dependencies: 300
-- Name: COLUMN personas_juridicas.sys_finalizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN personas_juridicas.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 4153 (class 0 OID 0)
-- Dependencies: 300
-- Name: COLUMN personas_juridicas.tipo_nacionalidad; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN personas_juridicas.tipo_nacionalidad IS 'Enum tipo nacionalidad puede ser Nacional o extranjera';


--
-- TOC entry 301 (class 1259 OID 417323)
-- Name: personas_juridicas_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE personas_juridicas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personas_juridicas_id_seq OWNER TO eureka;

--
-- TOC entry 4154 (class 0 OID 0)
-- Dependencies: 301
-- Name: personas_juridicas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE personas_juridicas_id_seq OWNED BY personas_juridicas.id;


--
-- TOC entry 302 (class 1259 OID 417325)
-- Name: personas_naturales; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE personas_naturales (
    id integer NOT NULL,
    primer_nombre character varying(255) NOT NULL,
    segundo_nombre character varying(255) NOT NULL,
    rif character varying(20),
    ci integer NOT NULL,
    creado_por integer NOT NULL,
    primer_apellido character varying(255) NOT NULL,
    segundo_apellido character varying(255) NOT NULL,
    telefono_local character varying(50) NOT NULL,
    telefono_celular character varying(50) NOT NULL,
    fax character varying(50),
    correo character varying(150) NOT NULL,
    pagina_web character varying(255),
    facebook character varying(255),
    twitter character varying(255),
    instagram character varying(255),
    sys_pais_id integer NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone DEFAULT now(),
    sys_finalizado_el timestamp with time zone DEFAULT now(),
    numero_identificacion character varying(255),
    nacionalidad tipo_nacionalidad NOT NULL
);


ALTER TABLE public.personas_naturales OWNER TO eureka;

--
-- TOC entry 4155 (class 0 OID 0)
-- Dependencies: 302
-- Name: TABLE personas_naturales; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE personas_naturales IS 'Personas naturales registradas en el sistema.';


--
-- TOC entry 4156 (class 0 OID 0)
-- Dependencies: 302
-- Name: COLUMN personas_naturales.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN personas_naturales.id IS 'Clave primaria';


--
-- TOC entry 4157 (class 0 OID 0)
-- Dependencies: 302
-- Name: COLUMN personas_naturales.primer_nombre; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN personas_naturales.primer_nombre IS 'Primer Nombre de la persona natural registrada';


--
-- TOC entry 4158 (class 0 OID 0)
-- Dependencies: 302
-- Name: COLUMN personas_naturales.segundo_nombre; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN personas_naturales.segundo_nombre IS 'Segundo Nombre de la persona natural registrada';


--
-- TOC entry 4159 (class 0 OID 0)
-- Dependencies: 302
-- Name: COLUMN personas_naturales.rif; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN personas_naturales.rif IS 'Rif de la persona natural registrada';


--
-- TOC entry 4160 (class 0 OID 0)
-- Dependencies: 302
-- Name: COLUMN personas_naturales.ci; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN personas_naturales.ci IS 'Cedula de identidad de la persona registrada';


--
-- TOC entry 4161 (class 0 OID 0)
-- Dependencies: 302
-- Name: COLUMN personas_naturales.creado_por; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN personas_naturales.creado_por IS 'Mantiene la referencia al usuario que realizo la insercion';


--
-- TOC entry 4162 (class 0 OID 0)
-- Dependencies: 302
-- Name: COLUMN personas_naturales.primer_apellido; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN personas_naturales.primer_apellido IS 'Primer apellido de la persona natural registrada';


--
-- TOC entry 4163 (class 0 OID 0)
-- Dependencies: 302
-- Name: COLUMN personas_naturales.segundo_apellido; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN personas_naturales.segundo_apellido IS 'Segundo Apellido de la persona natural registrada';


--
-- TOC entry 4164 (class 0 OID 0)
-- Dependencies: 302
-- Name: COLUMN personas_naturales.telefono_local; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN personas_naturales.telefono_local IS 'Telefono local de la persona natural registrada';


--
-- TOC entry 4165 (class 0 OID 0)
-- Dependencies: 302
-- Name: COLUMN personas_naturales.telefono_celular; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN personas_naturales.telefono_celular IS 'Telefono celular de la persona natural registrada';


--
-- TOC entry 4166 (class 0 OID 0)
-- Dependencies: 302
-- Name: COLUMN personas_naturales.fax; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN personas_naturales.fax IS 'Fax de la persona natural registrada';


--
-- TOC entry 4167 (class 0 OID 0)
-- Dependencies: 302
-- Name: COLUMN personas_naturales.correo; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN personas_naturales.correo IS 'Correo electronico de la persona natural registrada';


--
-- TOC entry 4168 (class 0 OID 0)
-- Dependencies: 302
-- Name: COLUMN personas_naturales.pagina_web; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN personas_naturales.pagina_web IS 'Pagina web de la persona natural registrada';


--
-- TOC entry 4169 (class 0 OID 0)
-- Dependencies: 302
-- Name: COLUMN personas_naturales.facebook; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN personas_naturales.facebook IS 'Red social Facebook de la persona natural registrada';


--
-- TOC entry 4170 (class 0 OID 0)
-- Dependencies: 302
-- Name: COLUMN personas_naturales.twitter; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN personas_naturales.twitter IS 'Red social twitter de la persona natural registrada';


--
-- TOC entry 4171 (class 0 OID 0)
-- Dependencies: 302
-- Name: COLUMN personas_naturales.instagram; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN personas_naturales.instagram IS 'Red social Instagram de la persona natural registrada';


--
-- TOC entry 4172 (class 0 OID 0)
-- Dependencies: 302
-- Name: COLUMN personas_naturales.sys_pais_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN personas_naturales.sys_pais_id IS 'Clave foranea de la tabla sys_paises';


--
-- TOC entry 4173 (class 0 OID 0)
-- Dependencies: 302
-- Name: COLUMN personas_naturales.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN personas_naturales.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 4174 (class 0 OID 0)
-- Dependencies: 302
-- Name: COLUMN personas_naturales.sys_creado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN personas_naturales.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 4175 (class 0 OID 0)
-- Dependencies: 302
-- Name: COLUMN personas_naturales.sys_actualizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN personas_naturales.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 4176 (class 0 OID 0)
-- Dependencies: 302
-- Name: COLUMN personas_naturales.sys_finalizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN personas_naturales.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 4177 (class 0 OID 0)
-- Dependencies: 302
-- Name: COLUMN personas_naturales.numero_identificacion; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN personas_naturales.numero_identificacion IS 'Numero de identificacion en caso de ser extranjero';


--
-- TOC entry 4178 (class 0 OID 0)
-- Dependencies: 302
-- Name: COLUMN personas_naturales.nacionalidad; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN personas_naturales.nacionalidad IS 'Tipo de nacionalidad puede ser Venezolana o extranjera';


--
-- TOC entry 303 (class 1259 OID 417335)
-- Name: personas_naturales_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE personas_naturales_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personas_naturales_id_seq OWNER TO eureka;

--
-- TOC entry 4179 (class 0 OID 0)
-- Dependencies: 303
-- Name: personas_naturales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE personas_naturales_id_seq OWNED BY personas_naturales.id;


--
-- TOC entry 304 (class 1259 OID 417337)
-- Name: polizas_contratadas; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE polizas_contratadas (
    id integer NOT NULL,
    sys_pais_id integer NOT NULL,
    tipo_nacionalidad tipo_nacionalidad NOT NULL,
    contratista_id integer NOT NULL,
    numero_identificacion character varying(255),
    numero_contrato character varying(255) NOT NULL,
    fecha_suscripcion date NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_finalizacion date NOT NULL,
    duracion integer NOT NULL,
    tipo_poliza tipo_poliza NOT NULL,
    bien_asegurado integer NOT NULL,
    monto_asegurado numeric(38,6) NOT NULL,
    monto_contrato numeric(38,6),
    aseguradora_id integer NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone,
    sys_finalizado_el timestamp with time zone
);


ALTER TABLE public.polizas_contratadas OWNER TO eureka;

--
-- TOC entry 4180 (class 0 OID 0)
-- Dependencies: 304
-- Name: TABLE polizas_contratadas; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE polizas_contratadas IS 'Tabla que almacena las polizas contratadas por la contratista';


--
-- TOC entry 4181 (class 0 OID 0)
-- Dependencies: 304
-- Name: COLUMN polizas_contratadas.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN polizas_contratadas.id IS 'Clave primaria';


--
-- TOC entry 4182 (class 0 OID 0)
-- Dependencies: 304
-- Name: COLUMN polizas_contratadas.sys_pais_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN polizas_contratadas.sys_pais_id IS 'Clave foranea a la tabla sys_paises';


--
-- TOC entry 4183 (class 0 OID 0)
-- Dependencies: 304
-- Name: COLUMN polizas_contratadas.tipo_nacionalidad; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN polizas_contratadas.tipo_nacionalidad IS 'Tipo nacionalidad puede ser NACIONAL O EXTRANJERA';


--
-- TOC entry 4184 (class 0 OID 0)
-- Dependencies: 304
-- Name: COLUMN polizas_contratadas.contratista_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN polizas_contratadas.contratista_id IS 'Clave foranea a la tabla contratistas';


--
-- TOC entry 4185 (class 0 OID 0)
-- Dependencies: 304
-- Name: COLUMN polizas_contratadas.numero_identificacion; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN polizas_contratadas.numero_identificacion IS 'Numero de identificacion solo para las empresas extranjeras';


--
-- TOC entry 4186 (class 0 OID 0)
-- Dependencies: 304
-- Name: COLUMN polizas_contratadas.numero_contrato; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN polizas_contratadas.numero_contrato IS 'Numero de contrato';


--
-- TOC entry 4187 (class 0 OID 0)
-- Dependencies: 304
-- Name: COLUMN polizas_contratadas.fecha_suscripcion; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN polizas_contratadas.fecha_suscripcion IS 'Fecha de la suscripcion';


--
-- TOC entry 4188 (class 0 OID 0)
-- Dependencies: 304
-- Name: COLUMN polizas_contratadas.fecha_inicio; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN polizas_contratadas.fecha_inicio IS 'Fecha de inicio';


--
-- TOC entry 4189 (class 0 OID 0)
-- Dependencies: 304
-- Name: COLUMN polizas_contratadas.fecha_finalizacion; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN polizas_contratadas.fecha_finalizacion IS 'Fecha finalizacion';


--
-- TOC entry 4190 (class 0 OID 0)
-- Dependencies: 304
-- Name: COLUMN polizas_contratadas.duracion; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN polizas_contratadas.duracion IS 'Duracion experesada en meses';


--
-- TOC entry 4191 (class 0 OID 0)
-- Dependencies: 304
-- Name: COLUMN polizas_contratadas.tipo_poliza; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN polizas_contratadas.tipo_poliza IS 'Tipo de poliza';


--
-- TOC entry 4192 (class 0 OID 0)
-- Dependencies: 304
-- Name: COLUMN polizas_contratadas.bien_asegurado; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN polizas_contratadas.bien_asegurado IS 'Clave foranea al bien';


--
-- TOC entry 4193 (class 0 OID 0)
-- Dependencies: 304
-- Name: COLUMN polizas_contratadas.monto_asegurado; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN polizas_contratadas.monto_asegurado IS 'Monto asegurado';


--
-- TOC entry 4194 (class 0 OID 0)
-- Dependencies: 304
-- Name: COLUMN polizas_contratadas.monto_contrato; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN polizas_contratadas.monto_contrato IS 'Monto del contrato';


--
-- TOC entry 4195 (class 0 OID 0)
-- Dependencies: 304
-- Name: COLUMN polizas_contratadas.aseguradora_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN polizas_contratadas.aseguradora_id IS 'Clave foranea a la tabla personas_juridicas';


--
-- TOC entry 4196 (class 0 OID 0)
-- Dependencies: 304
-- Name: COLUMN polizas_contratadas.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN polizas_contratadas.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 4197 (class 0 OID 0)
-- Dependencies: 304
-- Name: COLUMN polizas_contratadas.sys_creado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN polizas_contratadas.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 4198 (class 0 OID 0)
-- Dependencies: 304
-- Name: COLUMN polizas_contratadas.sys_actualizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN polizas_contratadas.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 4199 (class 0 OID 0)
-- Dependencies: 304
-- Name: COLUMN polizas_contratadas.sys_finalizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN polizas_contratadas.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 305 (class 1259 OID 417345)
-- Name: polizas_contratadas_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE polizas_contratadas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.polizas_contratadas_id_seq OWNER TO eureka;

--
-- TOC entry 4200 (class 0 OID 0)
-- Dependencies: 305
-- Name: polizas_contratadas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE polizas_contratadas_id_seq OWNED BY polizas_contratadas.id;


--
-- TOC entry 306 (class 1259 OID 417347)
-- Name: principios_contables; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE principios_contables (
    id integer NOT NULL,
    principio_contable principio_contable NOT NULL,
    codigo_sudeaseg character varying(255),
    contratista_id integer NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone,
    sys_finalizado_el timestamp with time zone
);


ALTER TABLE public.principios_contables OWNER TO eureka;

--
-- TOC entry 4201 (class 0 OID 0)
-- Dependencies: 306
-- Name: TABLE principios_contables; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE principios_contables IS 'Tabla donde se almacena el principio contable de la contratista';


--
-- TOC entry 4202 (class 0 OID 0)
-- Dependencies: 306
-- Name: COLUMN principios_contables.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN principios_contables.id IS 'Clave primaria';


--
-- TOC entry 4203 (class 0 OID 0)
-- Dependencies: 306
-- Name: COLUMN principios_contables.principio_contable; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN principios_contables.principio_contable IS 'Enum con el nombre del principio contable';


--
-- TOC entry 4204 (class 0 OID 0)
-- Dependencies: 306
-- Name: COLUMN principios_contables.codigo_sudeaseg; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN principios_contables.codigo_sudeaseg IS 'Codigo sudeaseg en caso de ser una empresa de seguro';


--
-- TOC entry 4205 (class 0 OID 0)
-- Dependencies: 306
-- Name: COLUMN principios_contables.contratista_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN principios_contables.contratista_id IS 'Clave foranea a la tabla contratistas';


--
-- TOC entry 4206 (class 0 OID 0)
-- Dependencies: 306
-- Name: COLUMN principios_contables.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN principios_contables.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 4207 (class 0 OID 0)
-- Dependencies: 306
-- Name: COLUMN principios_contables.sys_creado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN principios_contables.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 4208 (class 0 OID 0)
-- Dependencies: 306
-- Name: COLUMN principios_contables.sys_actualizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN principios_contables.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 4209 (class 0 OID 0)
-- Dependencies: 306
-- Name: COLUMN principios_contables.sys_finalizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN principios_contables.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 307 (class 1259 OID 417352)
-- Name: principios_contables_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE principios_contables_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.principios_contables_id_seq OWNER TO eureka;

--
-- TOC entry 4210 (class 0 OID 0)
-- Dependencies: 307
-- Name: principios_contables_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE principios_contables_id_seq OWNED BY principios_contables.id;


--
-- TOC entry 308 (class 1259 OID 417354)
-- Name: razones_sociales; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE razones_sociales (
    id integer NOT NULL,
    contratista_id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone DEFAULT now(),
    sys_finalizado_el timestamp with time zone DEFAULT now()
);


ALTER TABLE public.razones_sociales OWNER TO eureka;

--
-- TOC entry 4211 (class 0 OID 0)
-- Dependencies: 308
-- Name: TABLE razones_sociales; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE razones_sociales IS 'Tabla donde se almacena la razon social de las contratista';


--
-- TOC entry 4212 (class 0 OID 0)
-- Dependencies: 308
-- Name: COLUMN razones_sociales.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN razones_sociales.id IS 'Clave primaria';


--
-- TOC entry 4213 (class 0 OID 0)
-- Dependencies: 308
-- Name: COLUMN razones_sociales.contratista_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN razones_sociales.contratista_id IS 'Clave foranea a la tabla  contratistas';


--
-- TOC entry 4214 (class 0 OID 0)
-- Dependencies: 308
-- Name: COLUMN razones_sociales.nombre; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN razones_sociales.nombre IS 'Nombre o razon social';


--
-- TOC entry 4215 (class 0 OID 0)
-- Dependencies: 308
-- Name: COLUMN razones_sociales.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN razones_sociales.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 4216 (class 0 OID 0)
-- Dependencies: 308
-- Name: COLUMN razones_sociales.sys_creado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN razones_sociales.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 4217 (class 0 OID 0)
-- Dependencies: 308
-- Name: COLUMN razones_sociales.sys_actualizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN razones_sociales.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 4218 (class 0 OID 0)
-- Dependencies: 308
-- Name: COLUMN razones_sociales.sys_finalizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN razones_sociales.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 309 (class 1259 OID 417361)
-- Name: razon_social_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE razon_social_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.razon_social_id_seq OWNER TO eureka;

--
-- TOC entry 4219 (class 0 OID 0)
-- Dependencies: 309
-- Name: razon_social_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE razon_social_id_seq OWNED BY razones_sociales.id;


--
-- TOC entry 310 (class 1259 OID 417363)
-- Name: relaciones_contratos; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE relaciones_contratos (
    id integer NOT NULL,
    contratista_id integer NOT NULL,
    tipo_sector tipo_sector NOT NULL,
    tipo_contrato tipo_contrato NOT NULL,
    nombre_proyecto character varying(255) NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_fin date NOT NULL,
    monto_contrato numeric(38,6) NOT NULL,
    anticipo_recibido numeric(38,6),
    porcentaje_ejecucion double precision,
    evaluacion_ente character varying(255),
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone DEFAULT now(),
    sys_finalizado_el timestamp with time zone DEFAULT now(),
    natural_juridica_id integer NOT NULL
);


ALTER TABLE public.relaciones_contratos OWNER TO eureka;

--
-- TOC entry 4220 (class 0 OID 0)
-- Dependencies: 310
-- Name: TABLE relaciones_contratos; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE relaciones_contratos IS 'Tabla que almacena los contratos realizados por la contratista';


--
-- TOC entry 4221 (class 0 OID 0)
-- Dependencies: 310
-- Name: COLUMN relaciones_contratos.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN relaciones_contratos.id IS 'Clave primaria';


--
-- TOC entry 4222 (class 0 OID 0)
-- Dependencies: 310
-- Name: COLUMN relaciones_contratos.contratista_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN relaciones_contratos.contratista_id IS 'Clave foranea a la tabla contratistas';


--
-- TOC entry 4223 (class 0 OID 0)
-- Dependencies: 310
-- Name: COLUMN relaciones_contratos.tipo_sector; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN relaciones_contratos.tipo_sector IS 'Tipo sector puede ser Publico o Privado';


--
-- TOC entry 4224 (class 0 OID 0)
-- Dependencies: 310
-- Name: COLUMN relaciones_contratos.tipo_contrato; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN relaciones_contratos.tipo_contrato IS 'Tipo de contrato puede ser orbras, servicios, bienes';


--
-- TOC entry 4225 (class 0 OID 0)
-- Dependencies: 310
-- Name: COLUMN relaciones_contratos.nombre_proyecto; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN relaciones_contratos.nombre_proyecto IS 'Nombre del proyecto';


--
-- TOC entry 4226 (class 0 OID 0)
-- Dependencies: 310
-- Name: COLUMN relaciones_contratos.fecha_inicio; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN relaciones_contratos.fecha_inicio IS 'Fecha inicio';


--
-- TOC entry 4227 (class 0 OID 0)
-- Dependencies: 310
-- Name: COLUMN relaciones_contratos.fecha_fin; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN relaciones_contratos.fecha_fin IS 'Fecha de fin';


--
-- TOC entry 4228 (class 0 OID 0)
-- Dependencies: 310
-- Name: COLUMN relaciones_contratos.monto_contrato; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN relaciones_contratos.monto_contrato IS 'Monto del contrato';


--
-- TOC entry 4229 (class 0 OID 0)
-- Dependencies: 310
-- Name: COLUMN relaciones_contratos.anticipo_recibido; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN relaciones_contratos.anticipo_recibido IS 'Monto de bs de los antiticipos recibidos';


--
-- TOC entry 4230 (class 0 OID 0)
-- Dependencies: 310
-- Name: COLUMN relaciones_contratos.porcentaje_ejecucion; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN relaciones_contratos.porcentaje_ejecucion IS 'Porcentaje de ejecucion';


--
-- TOC entry 4231 (class 0 OID 0)
-- Dependencies: 310
-- Name: COLUMN relaciones_contratos.evaluacion_ente; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN relaciones_contratos.evaluacion_ente IS 'Evaluacion por el ente';


--
-- TOC entry 4232 (class 0 OID 0)
-- Dependencies: 310
-- Name: COLUMN relaciones_contratos.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN relaciones_contratos.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 4233 (class 0 OID 0)
-- Dependencies: 310
-- Name: COLUMN relaciones_contratos.sys_creado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN relaciones_contratos.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 4234 (class 0 OID 0)
-- Dependencies: 310
-- Name: COLUMN relaciones_contratos.sys_actualizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN relaciones_contratos.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 4235 (class 0 OID 0)
-- Dependencies: 310
-- Name: COLUMN relaciones_contratos.sys_finalizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN relaciones_contratos.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 4236 (class 0 OID 0)
-- Dependencies: 310
-- Name: COLUMN relaciones_contratos.natural_juridica_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN relaciones_contratos.natural_juridica_id IS 'Clave foranea a la tabla naturales_juridicas';


--
-- TOC entry 311 (class 1259 OID 417373)
-- Name: relaciones_contratos_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE relaciones_contratos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.relaciones_contratos_id_seq OWNER TO eureka;

--
-- TOC entry 4237 (class 0 OID 0)
-- Dependencies: 311
-- Name: relaciones_contratos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE relaciones_contratos_id_seq OWNED BY relaciones_contratos.id;


--
-- TOC entry 312 (class 1259 OID 417375)
-- Name: sucursales; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE sucursales (
    persona_natural_id integer NOT NULL,
    direccion_id integer NOT NULL,
    contratista_id integer NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone DEFAULT now(),
    sys_finalizado_el timestamp with time zone DEFAULT now(),
    id integer NOT NULL
);


ALTER TABLE public.sucursales OWNER TO eureka;

--
-- TOC entry 4238 (class 0 OID 0)
-- Dependencies: 312
-- Name: TABLE sucursales; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE sucursales IS 'Tabla donde se almacenan la información de las sucursales y personas de contactos en caso de existir de una contratista.';


--
-- TOC entry 4239 (class 0 OID 0)
-- Dependencies: 312
-- Name: COLUMN sucursales.persona_natural_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sucursales.persona_natural_id IS 'Clave foranea a la tabla personas_naturales';


--
-- TOC entry 4240 (class 0 OID 0)
-- Dependencies: 312
-- Name: COLUMN sucursales.direccion_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sucursales.direccion_id IS 'Clave foranea a la tabla direcciones_sucursales';


--
-- TOC entry 4241 (class 0 OID 0)
-- Dependencies: 312
-- Name: COLUMN sucursales.contratista_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sucursales.contratista_id IS 'Clave foranea a la tabla contratistas';


--
-- TOC entry 4242 (class 0 OID 0)
-- Dependencies: 312
-- Name: COLUMN sucursales.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sucursales.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 4243 (class 0 OID 0)
-- Dependencies: 312
-- Name: COLUMN sucursales.sys_creado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sucursales.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 4244 (class 0 OID 0)
-- Dependencies: 312
-- Name: COLUMN sucursales.sys_actualizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sucursales.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 4245 (class 0 OID 0)
-- Dependencies: 312
-- Name: COLUMN sucursales.sys_finalizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sucursales.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 4246 (class 0 OID 0)
-- Dependencies: 312
-- Name: COLUMN sucursales.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sucursales.id IS 'Clave primaria';


--
-- TOC entry 342 (class 1259 OID 418494)
-- Name: sucursales_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE sucursales_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sucursales_id_seq OWNER TO eureka;

--
-- TOC entry 4247 (class 0 OID 0)
-- Dependencies: 342
-- Name: sucursales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE sucursales_id_seq OWNED BY sucursales.id;


--
-- TOC entry 313 (class 1259 OID 417382)
-- Name: suplementarios; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE suplementarios (
    id integer NOT NULL,
    tipo_suplementario tipo_sus_pag,
    capital_id integer NOT NULL,
    numero integer,
    valor numeric(38,6),
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone DEFAULT now(),
    sys_finalizado_el timestamp with time zone DEFAULT now()
);


ALTER TABLE public.suplementarios OWNER TO eureka;

--
-- TOC entry 4248 (class 0 OID 0)
-- Dependencies: 313
-- Name: TABLE suplementarios; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE suplementarios IS 'Tabla donde se almacenan los certificados suplementariossucritas o pagadas.';


--
-- TOC entry 4249 (class 0 OID 0)
-- Dependencies: 313
-- Name: COLUMN suplementarios.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN suplementarios.id IS 'Clave primaria';


--
-- TOC entry 4250 (class 0 OID 0)
-- Dependencies: 313
-- Name: COLUMN suplementarios.tipo_suplementario; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN suplementarios.tipo_suplementario IS 'Tipo de accion si es suscrito o pagado';


--
-- TOC entry 4251 (class 0 OID 0)
-- Dependencies: 313
-- Name: COLUMN suplementarios.capital_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN suplementarios.capital_id IS 'CLave foranea a la tabla capitales';


--
-- TOC entry 4252 (class 0 OID 0)
-- Dependencies: 313
-- Name: COLUMN suplementarios.numero; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN suplementarios.numero IS 'Numero de certificados suplmentarios';


--
-- TOC entry 4253 (class 0 OID 0)
-- Dependencies: 313
-- Name: COLUMN suplementarios.valor; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN suplementarios.valor IS 'Valor del certificado suplementario';


--
-- TOC entry 4254 (class 0 OID 0)
-- Dependencies: 313
-- Name: COLUMN suplementarios.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN suplementarios.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 4255 (class 0 OID 0)
-- Dependencies: 313
-- Name: COLUMN suplementarios.sys_creado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN suplementarios.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 4256 (class 0 OID 0)
-- Dependencies: 313
-- Name: COLUMN suplementarios.sys_actualizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN suplementarios.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 4257 (class 0 OID 0)
-- Dependencies: 313
-- Name: COLUMN suplementarios.sys_finalizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN suplementarios.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 314 (class 1259 OID 417389)
-- Name: suplementarios_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE suplementarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.suplementarios_id_seq OWNER TO eureka;

--
-- TOC entry 4258 (class 0 OID 0)
-- Dependencies: 314
-- Name: suplementarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE suplementarios_id_seq OWNED BY suplementarios.id;


--
-- TOC entry 315 (class 1259 OID 417391)
-- Name: sys_bancos; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE sys_bancos (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    rif character varying(25),
    codigo_sudeban character varying(10) NOT NULL,
    codigo_swift character varying(10) NOT NULL,
    sys_pais_id integer NOT NULL,
    tipo_nacionalidad tipo_nacionalidad NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone DEFAULT now(),
    sys_finalizado_el timestamp with time zone DEFAULT now()
);


ALTER TABLE public.sys_bancos OWNER TO eureka;

--
-- TOC entry 4259 (class 0 OID 0)
-- Dependencies: 315
-- Name: TABLE sys_bancos; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE sys_bancos IS 'Tabla que almacena todos los bancos del sistema';


--
-- TOC entry 4260 (class 0 OID 0)
-- Dependencies: 315
-- Name: COLUMN sys_bancos.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_bancos.id IS 'Clave primaria';


--
-- TOC entry 4261 (class 0 OID 0)
-- Dependencies: 315
-- Name: COLUMN sys_bancos.nombre; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_bancos.nombre IS 'Nombre del banco';


--
-- TOC entry 4262 (class 0 OID 0)
-- Dependencies: 315
-- Name: COLUMN sys_bancos.rif; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_bancos.rif IS 'Rif del banco';


--
-- TOC entry 4263 (class 0 OID 0)
-- Dependencies: 315
-- Name: COLUMN sys_bancos.codigo_sudeban; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_bancos.codigo_sudeban IS 'Identificado numerico del banco';


--
-- TOC entry 4264 (class 0 OID 0)
-- Dependencies: 315
-- Name: COLUMN sys_bancos.codigo_swift; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_bancos.codigo_swift IS 'Codigo Swift';


--
-- TOC entry 4265 (class 0 OID 0)
-- Dependencies: 315
-- Name: COLUMN sys_bancos.sys_pais_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_bancos.sys_pais_id IS 'Clave foranea a la tabla sys_paises';


--
-- TOC entry 4266 (class 0 OID 0)
-- Dependencies: 315
-- Name: COLUMN sys_bancos.tipo_nacionalidad; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_bancos.tipo_nacionalidad IS 'Tip nacionalidad puede ser NACIONAL O EXTRANJERA';


--
-- TOC entry 4267 (class 0 OID 0)
-- Dependencies: 315
-- Name: COLUMN sys_bancos.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_bancos.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 4268 (class 0 OID 0)
-- Dependencies: 315
-- Name: COLUMN sys_bancos.sys_creado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_bancos.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 4269 (class 0 OID 0)
-- Dependencies: 315
-- Name: COLUMN sys_bancos.sys_actualizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_bancos.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 4270 (class 0 OID 0)
-- Dependencies: 315
-- Name: COLUMN sys_bancos.sys_finalizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_bancos.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 316 (class 1259 OID 417398)
-- Name: sys_bancos_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE sys_bancos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sys_bancos_id_seq OWNER TO eureka;

--
-- TOC entry 4271 (class 0 OID 0)
-- Dependencies: 316
-- Name: sys_bancos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE sys_bancos_id_seq OWNED BY sys_bancos.id;


--
-- TOC entry 317 (class 1259 OID 417400)
-- Name: sys_caev; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE sys_caev (
    id integer NOT NULL,
    grupo character varying(255) NOT NULL,
    denominacion text NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone DEFAULT now(),
    sys_finalizado_el timestamp with time zone DEFAULT now()
);


ALTER TABLE public.sys_caev OWNER TO eureka;

--
-- TOC entry 4272 (class 0 OID 0)
-- Dependencies: 317
-- Name: TABLE sys_caev; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE sys_caev IS 'Tabla que almacena los codigos caev a relacionar con las actividades ecnonomicas.';


--
-- TOC entry 4273 (class 0 OID 0)
-- Dependencies: 317
-- Name: COLUMN sys_caev.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_caev.id IS 'Clave primaria';


--
-- TOC entry 4274 (class 0 OID 0)
-- Dependencies: 317
-- Name: COLUMN sys_caev.grupo; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_caev.grupo IS 'codigo caev';


--
-- TOC entry 4275 (class 0 OID 0)
-- Dependencies: 317
-- Name: COLUMN sys_caev.denominacion; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_caev.denominacion IS 'Descrpcion del codigo caev';


--
-- TOC entry 4276 (class 0 OID 0)
-- Dependencies: 317
-- Name: COLUMN sys_caev.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_caev.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 4277 (class 0 OID 0)
-- Dependencies: 317
-- Name: COLUMN sys_caev.sys_creado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_caev.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 4278 (class 0 OID 0)
-- Dependencies: 317
-- Name: COLUMN sys_caev.sys_actualizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_caev.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 4279 (class 0 OID 0)
-- Dependencies: 317
-- Name: COLUMN sys_caev.sys_finalizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_caev.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 318 (class 1259 OID 417410)
-- Name: sys_caev_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE sys_caev_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sys_caev_id_seq OWNER TO eureka;

--
-- TOC entry 4280 (class 0 OID 0)
-- Dependencies: 318
-- Name: sys_caev_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE sys_caev_id_seq OWNED BY sys_caev.id;


--
-- TOC entry 319 (class 1259 OID 417412)
-- Name: sys_ciudades; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE sys_ciudades (
    id integer NOT NULL,
    sys_estado_id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    codigo_postal character varying(255) NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone DEFAULT now(),
    sys_finalizado_el timestamp with time zone DEFAULT now()
);


ALTER TABLE public.sys_ciudades OWNER TO eureka;

--
-- TOC entry 4281 (class 0 OID 0)
-- Dependencies: 319
-- Name: TABLE sys_ciudades; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE sys_ciudades IS 'Tabla que almacena las ciudades del sistema referenciando a los estados';


--
-- TOC entry 4282 (class 0 OID 0)
-- Dependencies: 319
-- Name: COLUMN sys_ciudades.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_ciudades.id IS 'Clave foranea';


--
-- TOC entry 4283 (class 0 OID 0)
-- Dependencies: 319
-- Name: COLUMN sys_ciudades.sys_estado_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_ciudades.sys_estado_id IS 'Clave foranea a latabla Sys_estados';


--
-- TOC entry 4284 (class 0 OID 0)
-- Dependencies: 319
-- Name: COLUMN sys_ciudades.nombre; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_ciudades.nombre IS 'Nombre de la ciudad';


--
-- TOC entry 4285 (class 0 OID 0)
-- Dependencies: 319
-- Name: COLUMN sys_ciudades.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_ciudades.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 4286 (class 0 OID 0)
-- Dependencies: 319
-- Name: COLUMN sys_ciudades.sys_creado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_ciudades.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 4287 (class 0 OID 0)
-- Dependencies: 319
-- Name: COLUMN sys_ciudades.sys_actualizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_ciudades.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 4288 (class 0 OID 0)
-- Dependencies: 319
-- Name: COLUMN sys_ciudades.sys_finalizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_ciudades.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 320 (class 1259 OID 417422)
-- Name: sys_ciudades_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE sys_ciudades_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sys_ciudades_id_seq OWNER TO eureka;

--
-- TOC entry 4289 (class 0 OID 0)
-- Dependencies: 320
-- Name: sys_ciudades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE sys_ciudades_id_seq OWNED BY sys_ciudades.id;


--
-- TOC entry 321 (class 1259 OID 417424)
-- Name: sys_cuentas; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE sys_cuentas (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    modelos character varying(255)[] NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone,
    sys_finalizado_el timestamp with time zone
);


ALTER TABLE public.sys_cuentas OWNER TO eureka;

--
-- TOC entry 4290 (class 0 OID 0)
-- Dependencies: 321
-- Name: TABLE sys_cuentas; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE sys_cuentas IS 'Tabla que contiene el universo de cuentas a cargar en el sistema';


--
-- TOC entry 4291 (class 0 OID 0)
-- Dependencies: 321
-- Name: COLUMN sys_cuentas.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_cuentas.id IS 'Clave primaria.';


--
-- TOC entry 4292 (class 0 OID 0)
-- Dependencies: 321
-- Name: COLUMN sys_cuentas.nombre; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_cuentas.nombre IS 'Nombre de la cuenta.';


--
-- TOC entry 4293 (class 0 OID 0)
-- Dependencies: 321
-- Name: COLUMN sys_cuentas.modelos; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_cuentas.modelos IS 'Enum de los modelos relacionados a la cuenta.';


--
-- TOC entry 4294 (class 0 OID 0)
-- Dependencies: 321
-- Name: COLUMN sys_cuentas.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_cuentas.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 4295 (class 0 OID 0)
-- Dependencies: 321
-- Name: COLUMN sys_cuentas.sys_creado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_cuentas.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 4296 (class 0 OID 0)
-- Dependencies: 321
-- Name: COLUMN sys_cuentas.sys_actualizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_cuentas.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 4297 (class 0 OID 0)
-- Dependencies: 321
-- Name: COLUMN sys_cuentas.sys_finalizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_cuentas.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 322 (class 1259 OID 417432)
-- Name: sys_cuentas_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE sys_cuentas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sys_cuentas_id_seq OWNER TO eureka;

--
-- TOC entry 4298 (class 0 OID 0)
-- Dependencies: 322
-- Name: sys_cuentas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE sys_cuentas_id_seq OWNED BY sys_cuentas.id;


--
-- TOC entry 323 (class 1259 OID 417434)
-- Name: sys_denominaciones_comerciales; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE sys_denominaciones_comerciales (
    id integer NOT NULL,
    nombre character varying(255),
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone DEFAULT now(),
    sys_finalizado_el timestamp with time zone DEFAULT now()
);


ALTER TABLE public.sys_denominaciones_comerciales OWNER TO eureka;

--
-- TOC entry 4299 (class 0 OID 0)
-- Dependencies: 323
-- Name: TABLE sys_denominaciones_comerciales; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE sys_denominaciones_comerciales IS 'Tabla donde se almacenan la información de las denominaciones comerciales.';


--
-- TOC entry 4300 (class 0 OID 0)
-- Dependencies: 323
-- Name: COLUMN sys_denominaciones_comerciales.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_denominaciones_comerciales.id IS 'Clave primaria';


--
-- TOC entry 4301 (class 0 OID 0)
-- Dependencies: 323
-- Name: COLUMN sys_denominaciones_comerciales.nombre; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_denominaciones_comerciales.nombre IS 'Nombre de la denominacion';


--
-- TOC entry 4302 (class 0 OID 0)
-- Dependencies: 323
-- Name: COLUMN sys_denominaciones_comerciales.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_denominaciones_comerciales.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 4303 (class 0 OID 0)
-- Dependencies: 323
-- Name: COLUMN sys_denominaciones_comerciales.sys_creado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_denominaciones_comerciales.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 4304 (class 0 OID 0)
-- Dependencies: 323
-- Name: COLUMN sys_denominaciones_comerciales.sys_actualizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_denominaciones_comerciales.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 4305 (class 0 OID 0)
-- Dependencies: 323
-- Name: COLUMN sys_denominaciones_comerciales.sys_finalizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_denominaciones_comerciales.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 324 (class 1259 OID 417441)
-- Name: sys_divisas; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE sys_divisas (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    codigo character varying(20) NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone DEFAULT now(),
    sys_finalizado_el timestamp with time zone DEFAULT now()
);


ALTER TABLE public.sys_divisas OWNER TO eureka;

--
-- TOC entry 4306 (class 0 OID 0)
-- Dependencies: 324
-- Name: TABLE sys_divisas; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE sys_divisas IS 'Tabla donde se alojan todos los posibles tipos de divisas y sus cambios.';


--
-- TOC entry 4307 (class 0 OID 0)
-- Dependencies: 324
-- Name: COLUMN sys_divisas.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_divisas.id IS 'Clave foranea';


--
-- TOC entry 4308 (class 0 OID 0)
-- Dependencies: 324
-- Name: COLUMN sys_divisas.nombre; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_divisas.nombre IS 'Nombre de la moneda';


--
-- TOC entry 4309 (class 0 OID 0)
-- Dependencies: 324
-- Name: COLUMN sys_divisas.codigo; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_divisas.codigo IS 'Abreviacion de la moneda.';


--
-- TOC entry 4310 (class 0 OID 0)
-- Dependencies: 324
-- Name: COLUMN sys_divisas.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_divisas.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 4311 (class 0 OID 0)
-- Dependencies: 324
-- Name: COLUMN sys_divisas.sys_creado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_divisas.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 4312 (class 0 OID 0)
-- Dependencies: 324
-- Name: COLUMN sys_divisas.sys_actualizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_divisas.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 4313 (class 0 OID 0)
-- Dependencies: 324
-- Name: COLUMN sys_divisas.sys_finalizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_divisas.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 325 (class 1259 OID 417448)
-- Name: sys_estados; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE sys_estados (
    id integer NOT NULL,
    sys_pais_id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone DEFAULT now(),
    sys_finalizado_el timestamp with time zone DEFAULT now()
);


ALTER TABLE public.sys_estados OWNER TO eureka;

--
-- TOC entry 4314 (class 0 OID 0)
-- Dependencies: 325
-- Name: TABLE sys_estados; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE sys_estados IS 'Tabla donde se almacenan los estados relacionados con su pais';


--
-- TOC entry 4315 (class 0 OID 0)
-- Dependencies: 325
-- Name: COLUMN sys_estados.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_estados.id IS 'Clave foranea';


--
-- TOC entry 4316 (class 0 OID 0)
-- Dependencies: 325
-- Name: COLUMN sys_estados.sys_pais_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_estados.sys_pais_id IS 'Clave foranea a la tabla Sys_Paises';


--
-- TOC entry 4317 (class 0 OID 0)
-- Dependencies: 325
-- Name: COLUMN sys_estados.nombre; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_estados.nombre IS 'Nombre del estado';


--
-- TOC entry 4318 (class 0 OID 0)
-- Dependencies: 325
-- Name: COLUMN sys_estados.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_estados.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 4319 (class 0 OID 0)
-- Dependencies: 325
-- Name: COLUMN sys_estados.sys_creado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_estados.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 4320 (class 0 OID 0)
-- Dependencies: 325
-- Name: COLUMN sys_estados.sys_actualizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_estados.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 4321 (class 0 OID 0)
-- Dependencies: 325
-- Name: COLUMN sys_estados.sys_finalizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_estados.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 326 (class 1259 OID 417455)
-- Name: sys_estados_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE sys_estados_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sys_estados_id_seq OWNER TO eureka;

--
-- TOC entry 4322 (class 0 OID 0)
-- Dependencies: 326
-- Name: sys_estados_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE sys_estados_id_seq OWNED BY sys_estados.id;


--
-- TOC entry 327 (class 1259 OID 417457)
-- Name: sys_monedas_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE sys_monedas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sys_monedas_id_seq OWNER TO eureka;

--
-- TOC entry 4323 (class 0 OID 0)
-- Dependencies: 327
-- Name: sys_monedas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE sys_monedas_id_seq OWNED BY sys_divisas.id;


--
-- TOC entry 328 (class 1259 OID 417459)
-- Name: sys_municipios; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE sys_municipios (
    id integer NOT NULL,
    sys_estado_id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone DEFAULT now(),
    sys_finalizado_el timestamp with time zone DEFAULT now()
);


ALTER TABLE public.sys_municipios OWNER TO eureka;

--
-- TOC entry 4324 (class 0 OID 0)
-- Dependencies: 328
-- Name: TABLE sys_municipios; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE sys_municipios IS 'Tabla donde se almacenan los estados relacionados con su pais';


--
-- TOC entry 4325 (class 0 OID 0)
-- Dependencies: 328
-- Name: COLUMN sys_municipios.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_municipios.id IS 'Clave foranea';


--
-- TOC entry 4326 (class 0 OID 0)
-- Dependencies: 328
-- Name: COLUMN sys_municipios.sys_estado_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_municipios.sys_estado_id IS 'Clave foranea a la tabla Sys_Estados';


--
-- TOC entry 4327 (class 0 OID 0)
-- Dependencies: 328
-- Name: COLUMN sys_municipios.nombre; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_municipios.nombre IS 'Nombre del estado';


--
-- TOC entry 4328 (class 0 OID 0)
-- Dependencies: 328
-- Name: COLUMN sys_municipios.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_municipios.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 4329 (class 0 OID 0)
-- Dependencies: 328
-- Name: COLUMN sys_municipios.sys_creado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_municipios.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 4330 (class 0 OID 0)
-- Dependencies: 328
-- Name: COLUMN sys_municipios.sys_actualizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_municipios.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 4331 (class 0 OID 0)
-- Dependencies: 328
-- Name: COLUMN sys_municipios.sys_finalizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_municipios.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 329 (class 1259 OID 417466)
-- Name: sys_municipios_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE sys_municipios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sys_municipios_id_seq OWNER TO eureka;

--
-- TOC entry 4332 (class 0 OID 0)
-- Dependencies: 329
-- Name: sys_municipios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE sys_municipios_id_seq OWNED BY sys_municipios.id;


--
-- TOC entry 330 (class 1259 OID 417468)
-- Name: sys_paises; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE sys_paises (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone DEFAULT now(),
    sys_finalizado_el timestamp with time zone DEFAULT now()
);


ALTER TABLE public.sys_paises OWNER TO eureka;

--
-- TOC entry 4333 (class 0 OID 0)
-- Dependencies: 330
-- Name: COLUMN sys_paises.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_paises.id IS 'Clave primaria';


--
-- TOC entry 4334 (class 0 OID 0)
-- Dependencies: 330
-- Name: COLUMN sys_paises.nombre; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_paises.nombre IS 'Nombre del pais';


--
-- TOC entry 4335 (class 0 OID 0)
-- Dependencies: 330
-- Name: COLUMN sys_paises.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_paises.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 4336 (class 0 OID 0)
-- Dependencies: 330
-- Name: COLUMN sys_paises.sys_creado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_paises.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 4337 (class 0 OID 0)
-- Dependencies: 330
-- Name: COLUMN sys_paises.sys_actualizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_paises.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 4338 (class 0 OID 0)
-- Dependencies: 330
-- Name: COLUMN sys_paises.sys_finalizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_paises.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 331 (class 1259 OID 417475)
-- Name: sys_paises_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE sys_paises_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sys_paises_id_seq OWNER TO eureka;

--
-- TOC entry 4339 (class 0 OID 0)
-- Dependencies: 331
-- Name: sys_paises_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE sys_paises_id_seq OWNED BY sys_paises.id;


--
-- TOC entry 332 (class 1259 OID 417477)
-- Name: sys_parroquias; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE sys_parroquias (
    id integer NOT NULL,
    sys_municipio_id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone DEFAULT now(),
    sys_finalizado_el timestamp with time zone DEFAULT now()
);


ALTER TABLE public.sys_parroquias OWNER TO eureka;

--
-- TOC entry 4340 (class 0 OID 0)
-- Dependencies: 332
-- Name: TABLE sys_parroquias; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE sys_parroquias IS 'Tabla donde se almacenan las parroquias relacionados con su municipio';


--
-- TOC entry 4341 (class 0 OID 0)
-- Dependencies: 332
-- Name: COLUMN sys_parroquias.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_parroquias.id IS 'Clave foranea';


--
-- TOC entry 4342 (class 0 OID 0)
-- Dependencies: 332
-- Name: COLUMN sys_parroquias.sys_municipio_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_parroquias.sys_municipio_id IS 'Clave foranea a la tabla Sys_Municipios';


--
-- TOC entry 4343 (class 0 OID 0)
-- Dependencies: 332
-- Name: COLUMN sys_parroquias.nombre; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_parroquias.nombre IS 'Nombre del estado';


--
-- TOC entry 4344 (class 0 OID 0)
-- Dependencies: 332
-- Name: COLUMN sys_parroquias.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_parroquias.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 4345 (class 0 OID 0)
-- Dependencies: 332
-- Name: COLUMN sys_parroquias.sys_creado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_parroquias.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 4346 (class 0 OID 0)
-- Dependencies: 332
-- Name: COLUMN sys_parroquias.sys_actualizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_parroquias.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 4347 (class 0 OID 0)
-- Dependencies: 332
-- Name: COLUMN sys_parroquias.sys_finalizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_parroquias.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 333 (class 1259 OID 417484)
-- Name: sys_parroquias_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE sys_parroquias_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sys_parroquias_id_seq OWNER TO eureka;

--
-- TOC entry 4348 (class 0 OID 0)
-- Dependencies: 333
-- Name: sys_parroquias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE sys_parroquias_id_seq OWNED BY sys_parroquias.id;


--
-- TOC entry 334 (class 1259 OID 417486)
-- Name: sys_subdenominaciones_comerciales; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE sys_subdenominaciones_comerciales (
    id integer NOT NULL,
    nombre character varying(255),
    sys_denominacion_comercial_id integer NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone DEFAULT now(),
    sys_finalizado_el timestamp with time zone DEFAULT now()
);


ALTER TABLE public.sys_subdenominaciones_comerciales OWNER TO eureka;

--
-- TOC entry 4349 (class 0 OID 0)
-- Dependencies: 334
-- Name: TABLE sys_subdenominaciones_comerciales; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE sys_subdenominaciones_comerciales IS 'Tabla donde se almacenan los hijos de la tabla sys_denominaciones_comerciales';


--
-- TOC entry 4350 (class 0 OID 0)
-- Dependencies: 334
-- Name: COLUMN sys_subdenominaciones_comerciales.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_subdenominaciones_comerciales.id IS 'Clave primaria';


--
-- TOC entry 4351 (class 0 OID 0)
-- Dependencies: 334
-- Name: COLUMN sys_subdenominaciones_comerciales.nombre; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_subdenominaciones_comerciales.nombre IS 'Nombre de la subdenominacion comercial';


--
-- TOC entry 4352 (class 0 OID 0)
-- Dependencies: 334
-- Name: COLUMN sys_subdenominaciones_comerciales.sys_denominacion_comercial_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_subdenominaciones_comerciales.sys_denominacion_comercial_id IS 'Clave foranea a la tabla sys_denominaciones comerciales';


--
-- TOC entry 4353 (class 0 OID 0)
-- Dependencies: 334
-- Name: COLUMN sys_subdenominaciones_comerciales.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_subdenominaciones_comerciales.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 4354 (class 0 OID 0)
-- Dependencies: 334
-- Name: COLUMN sys_subdenominaciones_comerciales.sys_creado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_subdenominaciones_comerciales.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 4355 (class 0 OID 0)
-- Dependencies: 334
-- Name: COLUMN sys_subdenominaciones_comerciales.sys_actualizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_subdenominaciones_comerciales.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 4356 (class 0 OID 0)
-- Dependencies: 334
-- Name: COLUMN sys_subdenominaciones_comerciales.sys_finalizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_subdenominaciones_comerciales.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 335 (class 1259 OID 417493)
-- Name: sys_subdenominaciones_comerciales_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE sys_subdenominaciones_comerciales_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sys_subdenominaciones_comerciales_id_seq OWNER TO eureka;

--
-- TOC entry 4357 (class 0 OID 0)
-- Dependencies: 335
-- Name: sys_subdenominaciones_comerciales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE sys_subdenominaciones_comerciales_id_seq OWNED BY sys_subdenominaciones_comerciales.id;


--
-- TOC entry 336 (class 1259 OID 417495)
-- Name: sys_tasas_divisas; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE sys_tasas_divisas (
    id integer NOT NULL,
    sys_divisa_id integer NOT NULL,
    tasa numeric(38,6) NOT NULL,
    sys_status boolean DEFAULT true NOT NULL,
    sys_creado_el timestamp with time zone DEFAULT now(),
    sys_actualizado_el timestamp with time zone DEFAULT now(),
    sys_finalizado_el timestamp with time zone DEFAULT now()
);


ALTER TABLE public.sys_tasas_divisas OWNER TO eureka;

--
-- TOC entry 4358 (class 0 OID 0)
-- Dependencies: 336
-- Name: TABLE sys_tasas_divisas; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON TABLE sys_tasas_divisas IS 'Tabla que almacena todos los historicos de cambios de una divisa';


--
-- TOC entry 4359 (class 0 OID 0)
-- Dependencies: 336
-- Name: COLUMN sys_tasas_divisas.id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_tasas_divisas.id IS 'Clave primaria';


--
-- TOC entry 4360 (class 0 OID 0)
-- Dependencies: 336
-- Name: COLUMN sys_tasas_divisas.sys_divisa_id; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_tasas_divisas.sys_divisa_id IS 'Clave foranea a la tabla Sys_Divisa_id';


--
-- TOC entry 4361 (class 0 OID 0)
-- Dependencies: 336
-- Name: COLUMN sys_tasas_divisas.tasa; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_tasas_divisas.tasa IS 'Costo de la divisa';


--
-- TOC entry 4362 (class 0 OID 0)
-- Dependencies: 336
-- Name: COLUMN sys_tasas_divisas.sys_status; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_tasas_divisas.sys_status IS 'Estatus interno del sistema';


--
-- TOC entry 4363 (class 0 OID 0)
-- Dependencies: 336
-- Name: COLUMN sys_tasas_divisas.sys_creado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_tasas_divisas.sys_creado_el IS 'Fecha de creación del registro.';


--
-- TOC entry 4364 (class 0 OID 0)
-- Dependencies: 336
-- Name: COLUMN sys_tasas_divisas.sys_actualizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_tasas_divisas.sys_actualizado_el IS 'Fecha de última actualización del registro.';


--
-- TOC entry 4365 (class 0 OID 0)
-- Dependencies: 336
-- Name: COLUMN sys_tasas_divisas.sys_finalizado_el; Type: COMMENT; Schema: public; Owner: eureka
--

COMMENT ON COLUMN sys_tasas_divisas.sys_finalizado_el IS 'Fecha de "eliminado" el registro.';


--
-- TOC entry 337 (class 1259 OID 417502)
-- Name: sys_tasas_divisas_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE sys_tasas_divisas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sys_tasas_divisas_id_seq OWNER TO eureka;

--
-- TOC entry 4366 (class 0 OID 0)
-- Dependencies: 337
-- Name: sys_tasas_divisas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE sys_tasas_divisas_id_seq OWNED BY sys_tasas_divisas.id;


--
-- TOC entry 338 (class 1259 OID 417504)
-- Name: user; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE "user" (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    auth_key character varying(32) NOT NULL,
    password_hash character varying(255) NOT NULL,
    confirmation_token character varying(255),
    status integer DEFAULT 1 NOT NULL,
    superadmin smallint DEFAULT 0,
    created_at integer NOT NULL,
    updated_at integer NOT NULL,
    registration_ip character varying(15),
    bind_to_ip character varying(255),
    email character varying(128),
    email_confirmed smallint DEFAULT 0 NOT NULL
);


ALTER TABLE public."user" OWNER TO eureka;

--
-- TOC entry 339 (class 1259 OID 417513)
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO eureka;

--
-- TOC entry 4367 (class 0 OID 0)
-- Dependencies: 339
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE user_id_seq OWNED BY "user".id;


--
-- TOC entry 340 (class 1259 OID 417515)
-- Name: user_visit_log; Type: TABLE; Schema: public; Owner: eureka; Tablespace: 
--

CREATE TABLE user_visit_log (
    id integer NOT NULL,
    token character varying(255) NOT NULL,
    ip character varying(15) NOT NULL,
    language character(2) NOT NULL,
    user_agent character varying(255) NOT NULL,
    user_id integer,
    visit_time integer NOT NULL,
    browser character varying(30),
    os character varying(20)
);


ALTER TABLE public.user_visit_log OWNER TO eureka;

--
-- TOC entry 341 (class 1259 OID 417521)
-- Name: user_visit_log_id_seq; Type: SEQUENCE; Schema: public; Owner: eureka
--

CREATE SEQUENCE user_visit_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_visit_log_id_seq OWNER TO eureka;

--
-- TOC entry 4368 (class 0 OID 0)
-- Dependencies: 341
-- Name: user_visit_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eureka
--

ALTER SEQUENCE user_visit_log_id_seq OWNED BY user_visit_log.id;


SET search_path = activos, pg_catalog;

--
-- TOC entry 2427 (class 2604 OID 417523)
-- Name: id; Type: DEFAULT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY activos_biologicos ALTER COLUMN id SET DEFAULT nextval('activos_biologicos_id_seq'::regclass);


--
-- TOC entry 2430 (class 2604 OID 417524)
-- Name: id; Type: DEFAULT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY activos_intangibles ALTER COLUMN id SET DEFAULT nextval('activos_intangibles_id_seq'::regclass);


--
-- TOC entry 2433 (class 2604 OID 417525)
-- Name: id; Type: DEFAULT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY avaluos ALTER COLUMN id SET DEFAULT nextval('avaluos_id_seq'::regclass);


--
-- TOC entry 2439 (class 2604 OID 417526)
-- Name: id; Type: DEFAULT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY bienes ALTER COLUMN id SET DEFAULT nextval('bienes_id_seq'::regclass);


--
-- TOC entry 2442 (class 2604 OID 417527)
-- Name: id; Type: DEFAULT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY construcciones_inmuebles ALTER COLUMN id SET DEFAULT nextval('construcciones_inmuebles_id_seq'::regclass);


--
-- TOC entry 2445 (class 2604 OID 417528)
-- Name: id; Type: DEFAULT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY datos_importaciones ALTER COLUMN id SET DEFAULT nextval('datos_importacion_id_seq'::regclass);


--
-- TOC entry 2448 (class 2604 OID 417529)
-- Name: id; Type: DEFAULT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY depreciaciones_amortizaciones ALTER COLUMN id SET DEFAULT nextval('depresiaciones_amortizaciones_id_seq'::regclass);


--
-- TOC entry 2452 (class 2604 OID 417530)
-- Name: id; Type: DEFAULT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY desincorporacion_activos ALTER COLUMN id SET DEFAULT nextval('desincorporacion_activos_id_seq'::regclass);


--
-- TOC entry 2455 (class 2604 OID 417531)
-- Name: id; Type: DEFAULT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY deterioros ALTER COLUMN id SET DEFAULT nextval('deterioros_id_seq'::regclass);


--
-- TOC entry 2458 (class 2604 OID 417532)
-- Name: id; Type: DEFAULT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY documentos_registrados ALTER COLUMN id SET DEFAULT nextval('documentos_registrados_id_seq'::regclass);


--
-- TOC entry 2461 (class 2604 OID 417533)
-- Name: id; Type: DEFAULT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY fabricaciones_muebles ALTER COLUMN id SET DEFAULT nextval('fabricaciones_muebles_id_seq'::regclass);


--
-- TOC entry 2464 (class 2604 OID 417534)
-- Name: id; Type: DEFAULT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY facturas ALTER COLUMN id SET DEFAULT nextval('facturas_id_seq'::regclass);


--
-- TOC entry 2467 (class 2604 OID 417535)
-- Name: id; Type: DEFAULT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY inmuebles ALTER COLUMN id SET DEFAULT nextval('inmuebles_id_seq'::regclass);


--
-- TOC entry 2470 (class 2604 OID 417536)
-- Name: id; Type: DEFAULT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY licencias ALTER COLUMN id SET DEFAULT nextval('licencia_id_seq'::regclass);


--
-- TOC entry 2477 (class 2604 OID 417537)
-- Name: id; Type: DEFAULT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY mediciones ALTER COLUMN id SET DEFAULT nextval('medicion_id_seq'::regclass);


--
-- TOC entry 2483 (class 2604 OID 417538)
-- Name: id; Type: DEFAULT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY mejoras_propiedades ALTER COLUMN id SET DEFAULT nextval('mejoras_propiedad_id_seq'::regclass);


--
-- TOC entry 2486 (class 2604 OID 417539)
-- Name: id; Type: DEFAULT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY muebles ALTER COLUMN id SET DEFAULT nextval('muebles_id_seq'::regclass);


--
-- TOC entry 2492 (class 2604 OID 417540)
-- Name: id; Type: DEFAULT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY sys_formas_org ALTER COLUMN id SET DEFAULT nextval('sys_formas_org_id_seq'::regclass);


--
-- TOC entry 2495 (class 2604 OID 417541)
-- Name: id; Type: DEFAULT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY sys_gremios ALTER COLUMN id SET DEFAULT nextval('sys_gremios_id_seq'::regclass);


--
-- TOC entry 2498 (class 2604 OID 417542)
-- Name: id; Type: DEFAULT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY sys_metodos_medicion ALTER COLUMN id SET DEFAULT nextval('sys_metodo_medicion_id_seq'::regclass);


--
-- TOC entry 2501 (class 2604 OID 417543)
-- Name: id; Type: DEFAULT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY sys_motivos ALTER COLUMN id SET DEFAULT nextval('sys_motivios_id_seq'::regclass);


--
-- TOC entry 2504 (class 2604 OID 417544)
-- Name: id; Type: DEFAULT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY sys_tipos_bienes ALTER COLUMN id SET DEFAULT nextval('sys_tipo_bien_id_seq'::regclass);


--
-- TOC entry 2511 (class 2604 OID 417545)
-- Name: id; Type: DEFAULT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY sys_tipos_registros ALTER COLUMN id SET DEFAULT nextval('sys_tipos_registros_id_seq'::regclass);


--
-- TOC entry 2514 (class 2604 OID 417546)
-- Name: id; Type: DEFAULT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY vehiculos ALTER COLUMN id SET DEFAULT nextval('vehiculos_id_seq'::regclass);


SET search_path = public, pg_catalog;

--
-- TOC entry 2519 (class 2604 OID 417547)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY acciones ALTER COLUMN id SET DEFAULT nextval('acciones_id_seq'::regclass);


--
-- TOC entry 2524 (class 2604 OID 417548)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY accionistas_otros ALTER COLUMN id SET DEFAULT nextval('accionistas_id_seq'::regclass);


--
-- TOC entry 2529 (class 2604 OID 417549)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY actas_constitutivas ALTER COLUMN id SET DEFAULT nextval('actas_constitutivas_id_seq'::regclass);


--
-- TOC entry 2532 (class 2604 OID 417550)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY actividades_economicas ALTER COLUMN id SET DEFAULT nextval('actividades_economicas_id_seq'::regclass);


--
-- TOC entry 2537 (class 2604 OID 417551)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY bancos_contratistas ALTER COLUMN id SET DEFAULT nextval('bancos_contratistas_id_seq'::regclass);


--
-- TOC entry 2542 (class 2604 OID 417552)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY capitales ALTER COLUMN id SET DEFAULT nextval('capitales_id_seq'::regclass);


--
-- TOC entry 2547 (class 2604 OID 417553)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY capitales_decretos ALTER COLUMN id SET DEFAULT nextval('decretos_dividiendos_acciones_id_seq'::regclass);


--
-- TOC entry 2552 (class 2604 OID 417554)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY capitales_efectivos ALTER COLUMN id SET DEFAULT nextval('capitales_efectivos_id_seq'::regclass);


--
-- TOC entry 2557 (class 2604 OID 417555)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY capitales_mercancias ALTER COLUMN id SET DEFAULT nextval('capitales_mercancias_id_seq'::regclass);


--
-- TOC entry 2562 (class 2604 OID 417556)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY capitales_pagar_accionistas ALTER COLUMN id SET DEFAULT nextval('cuentas_xpagar_accionistas_id_seq'::regclass);


--
-- TOC entry 2567 (class 2604 OID 417557)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY capitales_propiedades ALTER COLUMN id SET DEFAULT nextval('capitales_propiedades_id_seq'::regclass);


--
-- TOC entry 2572 (class 2604 OID 417558)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY certificaciones_aportes ALTER COLUMN id SET DEFAULT nextval('certificiones_aportes_id_seq'::regclass);


--
-- TOC entry 2577 (class 2604 OID 417559)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY certificados ALTER COLUMN id SET DEFAULT nextval('certificados_id_seq'::regclass);


--
-- TOC entry 2582 (class 2604 OID 417560)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY cierres_ejercicios ALTER COLUMN id SET DEFAULT nextval('cierres_ejercicios_id_seq'::regclass);


--
-- TOC entry 2588 (class 2604 OID 417561)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY clientes ALTER COLUMN id SET DEFAULT nextval('clientes_id_seq'::regclass);


--
-- TOC entry 2593 (class 2604 OID 417562)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY comisarios_auditores ALTER COLUMN id SET DEFAULT nextval('comisarios_id_seq'::regclass);


--
-- TOC entry 2598 (class 2604 OID 417563)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY contratistas ALTER COLUMN id SET DEFAULT nextval('contratistas_id_seq'::regclass);


--
-- TOC entry 2601 (class 2604 OID 417564)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY contratistas_contactos ALTER COLUMN id SET DEFAULT nextval('contratistas_contactos_id_seq'::regclass);


--
-- TOC entry 2606 (class 2604 OID 417565)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY contratos_facturas ALTER COLUMN id SET DEFAULT nextval('contratos_facturas_id_seq'::regclass);


--
-- TOC entry 2611 (class 2604 OID 417566)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY contratos_valuaciones ALTER COLUMN id SET DEFAULT nextval('contratos_valuaciones_id_seq'::regclass);


--
-- TOC entry 2616 (class 2604 OID 417567)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY denominaciones_comerciales ALTER COLUMN id SET DEFAULT nextval('denominaciones_comerciales_id_seq'::regclass);


--
-- TOC entry 2621 (class 2604 OID 417568)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY direcciones ALTER COLUMN id SET DEFAULT nextval('direcciones_sucursales_id_seq'::regclass);


--
-- TOC entry 2626 (class 2604 OID 417569)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY domicilios ALTER COLUMN id SET DEFAULT nextval('domicilios_id_seq'::regclass);


--
-- TOC entry 2631 (class 2604 OID 417570)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY duraciones_empresas ALTER COLUMN id SET DEFAULT nextval('duraciones_emepresas_id_seq'::regclass);


--
-- TOC entry 2634 (class 2604 OID 417571)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY empresas_relacionadas ALTER COLUMN id SET DEFAULT nextval('empresas_relacionadas_id_seq'::regclass);


--
-- TOC entry 2639 (class 2604 OID 417572)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY estatus_contratistas ALTER COLUMN id SET DEFAULT nextval('estatus_contratistas_id_seq'::regclass);


--
-- TOC entry 2644 (class 2604 OID 417573)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY fondos_reservas ALTER COLUMN id SET DEFAULT nextval('fondos_reservas_id_seq'::regclass);


--
-- TOC entry 2659 (class 2604 OID 417574)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY nombres_cajas ALTER COLUMN id SET DEFAULT nextval('nombres_cajas_id_seq'::regclass);


--
-- TOC entry 2665 (class 2604 OID 417575)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY notas_revelatorias ALTER COLUMN id SET DEFAULT nextval('notas_revelatorias_id_seq'::regclass);


--
-- TOC entry 2668 (class 2604 OID 417576)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY notas_revelatorias_cuentas ALTER COLUMN id SET DEFAULT nextval('notas_revelatorias_cuentas_id_seq'::regclass);


--
-- TOC entry 2673 (class 2604 OID 417577)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY objetos_autorizaciones ALTER COLUMN id SET DEFAULT nextval('objetos_autorizaciones_id_seq'::regclass);


--
-- TOC entry 2678 (class 2604 OID 417578)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY objetos_empresas ALTER COLUMN id SET DEFAULT nextval('objetos_empresas_id_seq'::regclass);


--
-- TOC entry 2683 (class 2604 OID 417579)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY objetos_sociales ALTER COLUMN id SET DEFAULT nextval('objetos_sociales_id_seq'::regclass);


--
-- TOC entry 2686 (class 2604 OID 417580)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY personas_juridicas ALTER COLUMN id SET DEFAULT nextval('personas_juridicas_id_seq'::regclass);


--
-- TOC entry 2691 (class 2604 OID 417581)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY personas_naturales ALTER COLUMN id SET DEFAULT nextval('personas_naturales_id_seq'::regclass);


--
-- TOC entry 2694 (class 2604 OID 417582)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY polizas_contratadas ALTER COLUMN id SET DEFAULT nextval('polizas_contratadas_id_seq'::regclass);


--
-- TOC entry 2697 (class 2604 OID 417583)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY principios_contables ALTER COLUMN id SET DEFAULT nextval('principios_contables_id_seq'::regclass);


--
-- TOC entry 2702 (class 2604 OID 417584)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY razones_sociales ALTER COLUMN id SET DEFAULT nextval('razon_social_id_seq'::regclass);


--
-- TOC entry 2707 (class 2604 OID 417585)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY relaciones_contratos ALTER COLUMN id SET DEFAULT nextval('relaciones_contratos_id_seq'::regclass);


--
-- TOC entry 2712 (class 2604 OID 418496)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY sucursales ALTER COLUMN id SET DEFAULT nextval('sucursales_id_seq'::regclass);


--
-- TOC entry 2717 (class 2604 OID 417586)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY suplementarios ALTER COLUMN id SET DEFAULT nextval('suplementarios_id_seq'::regclass);


--
-- TOC entry 2722 (class 2604 OID 417587)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY sys_bancos ALTER COLUMN id SET DEFAULT nextval('sys_bancos_id_seq'::regclass);


--
-- TOC entry 2727 (class 2604 OID 417588)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY sys_caev ALTER COLUMN id SET DEFAULT nextval('sys_caev_id_seq'::regclass);


--
-- TOC entry 2732 (class 2604 OID 417589)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY sys_ciudades ALTER COLUMN id SET DEFAULT nextval('sys_ciudades_id_seq'::regclass);


--
-- TOC entry 2735 (class 2604 OID 417590)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY sys_cuentas ALTER COLUMN id SET DEFAULT nextval('sys_cuentas_id_seq'::regclass);


--
-- TOC entry 2744 (class 2604 OID 417591)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY sys_divisas ALTER COLUMN id SET DEFAULT nextval('sys_monedas_id_seq'::regclass);


--
-- TOC entry 2749 (class 2604 OID 417592)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY sys_estados ALTER COLUMN id SET DEFAULT nextval('sys_estados_id_seq'::regclass);


--
-- TOC entry 2649 (class 2604 OID 417593)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY sys_inpc ALTER COLUMN id SET DEFAULT nextval('inpc_id_seq'::regclass);


--
-- TOC entry 2754 (class 2604 OID 417594)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY sys_municipios ALTER COLUMN id SET DEFAULT nextval('sys_municipios_id_seq'::regclass);


--
-- TOC entry 2654 (class 2604 OID 417595)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY sys_naturales_juridicas ALTER COLUMN id SET DEFAULT nextval('naturales_juridicas_id_seq'::regclass);


--
-- TOC entry 2759 (class 2604 OID 417596)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY sys_paises ALTER COLUMN id SET DEFAULT nextval('sys_paises_id_seq'::regclass);


--
-- TOC entry 2764 (class 2604 OID 417597)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY sys_parroquias ALTER COLUMN id SET DEFAULT nextval('sys_parroquias_id_seq'::regclass);


--
-- TOC entry 2769 (class 2604 OID 417598)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY sys_subdenominaciones_comerciales ALTER COLUMN id SET DEFAULT nextval('sys_subdenominaciones_comerciales_id_seq'::regclass);


--
-- TOC entry 2774 (class 2604 OID 417599)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY sys_tasas_divisas ALTER COLUMN id SET DEFAULT nextval('sys_tasas_divisas_id_seq'::regclass);


--
-- TOC entry 2778 (class 2604 OID 417600)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY "user" ALTER COLUMN id SET DEFAULT nextval('user_id_seq'::regclass);


--
-- TOC entry 2779 (class 2604 OID 417601)
-- Name: id; Type: DEFAULT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY user_visit_log ALTER COLUMN id SET DEFAULT nextval('user_visit_log_id_seq'::regclass);


SET search_path = activos, pg_catalog;

--
-- TOC entry 3246 (class 0 OID 416737)
-- Dependencies: 172
-- Data for Name: activos_biologicos; Type: TABLE DATA; Schema: activos; Owner: eureka
--

COPY activos_biologicos (id, bien_id, catidad, certificado, num_certificado, detalles, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 4369 (class 0 OID 0)
-- Dependencies: 173
-- Name: activos_biologicos_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: eureka
--

SELECT pg_catalog.setval('activos_biologicos_id_seq', 1, false);


--
-- TOC entry 3248 (class 0 OID 416748)
-- Dependencies: 174
-- Data for Name: activos_intangibles; Type: TABLE DATA; Schema: activos; Owner: eureka
--

COPY activos_intangibles (id, bien_id, certificado_registro, fecha_registro, vigencia, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 4370 (class 0 OID 0)
-- Dependencies: 175
-- Name: activos_intangibles_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: eureka
--

SELECT pg_catalog.setval('activos_intangibles_id_seq', 1, false);


--
-- TOC entry 3250 (class 0 OID 416755)
-- Dependencies: 176
-- Data for Name: avaluos; Type: TABLE DATA; Schema: activos; Owner: eureka
--

COPY avaluos (id, bien_id, valor, fecha_informe, perito_id, gremio_id, num_inscripcion_gremio, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 4371 (class 0 OID 0)
-- Dependencies: 177
-- Name: avaluos_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: eureka
--

SELECT pg_catalog.setval('avaluos_id_seq', 1, false);


--
-- TOC entry 3252 (class 0 OID 416762)
-- Dependencies: 178
-- Data for Name: bienes; Type: TABLE DATA; Schema: activos; Owner: eureka
--

COPY bienes (id, sys_tipo_bien_id, principio_contable, depreciable, deterioro, detalle, origen, fecha_origen, contratista_id, propio, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 4372 (class 0 OID 0)
-- Dependencies: 179
-- Name: bienes_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: eureka
--

SELECT pg_catalog.setval('bienes_id_seq', 1, false);


--
-- TOC entry 3254 (class 0 OID 416775)
-- Dependencies: 180
-- Data for Name: construcciones_inmuebles; Type: TABLE DATA; Schema: activos; Owner: eureka
--

COPY construcciones_inmuebles (id, bien_id, area_construccion, porcentaje_ejecucion, monto_ejecutado, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 4373 (class 0 OID 0)
-- Dependencies: 181
-- Name: construcciones_inmuebles_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: eureka
--

SELECT pg_catalog.setval('construcciones_inmuebles_id_seq', 1, false);


--
-- TOC entry 4374 (class 0 OID 0)
-- Dependencies: 183
-- Name: datos_importacion_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: eureka
--

SELECT pg_catalog.setval('datos_importacion_id_seq', 1, false);


--
-- TOC entry 3256 (class 0 OID 416782)
-- Dependencies: 182
-- Data for Name: datos_importaciones; Type: TABLE DATA; Schema: activos; Owner: eureka
--

COPY datos_importaciones (id, bien_id, num_guia_nac, costo_adquisicion, gastos_mon_extranjera, sys_divisa_id, tasa_cambio, gastos_imp_nacional, otros_costros_imp_instalacion, total_costo_adquisicion, pais_origen_id, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 3258 (class 0 OID 416789)
-- Dependencies: 184
-- Data for Name: depreciaciones_amortizaciones; Type: TABLE DATA; Schema: activos; Owner: eureka
--

COPY depreciaciones_amortizaciones (id, bien_id, costo_adquisicion_avaluo, fecha_adquisicion_avaluo, vida_util, valor_residual, valor_depreciar, tasa_anual, unidades_estimadas, bs_unidad, unidades_producidas_periodo, unidades_consumidas, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 4375 (class 0 OID 0)
-- Dependencies: 185
-- Name: depresiaciones_amortizaciones_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: eureka
--

SELECT pg_catalog.setval('depresiaciones_amortizaciones_id_seq', 1, false);


--
-- TOC entry 3260 (class 0 OID 416796)
-- Dependencies: 186
-- Data for Name: desincorporacion_activos; Type: TABLE DATA; Schema: activos; Owner: eureka
--

COPY desincorporacion_activos (id, sys_motivo_id, fecha, precio_venta, valor_neto_libro, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 4376 (class 0 OID 0)
-- Dependencies: 187
-- Name: desincorporacion_activos_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: eureka
--

SELECT pg_catalog.setval('desincorporacion_activos_id_seq', 1, false);


--
-- TOC entry 3262 (class 0 OID 416804)
-- Dependencies: 188
-- Data for Name: deterioros; Type: TABLE DATA; Schema: activos; Owner: eureka
--

COPY deterioros (id, bien_id, valor_razonable, costo_disposicion, valor_uso, acumulado_ejer_ant, ejercicios_anteriores, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 4377 (class 0 OID 0)
-- Dependencies: 189
-- Name: deterioros_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: eureka
--

SELECT pg_catalog.setval('deterioros_id_seq', 1, false);


--
-- TOC entry 3264 (class 0 OID 416811)
-- Dependencies: 190
-- Data for Name: documentos_registrados; Type: TABLE DATA; Schema: activos; Owner: eureka
--

COPY documentos_registrados (id, contratista_id, sys_tipo_documento_id, sys_tipo_registro_id, circunscripcion, num_registro_notaria, tomo, folio, fecha_registro, valor_adquisicion, fecha_asamblea, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 4378 (class 0 OID 0)
-- Dependencies: 191
-- Name: documentos_registrados_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: eureka
--

SELECT pg_catalog.setval('documentos_registrados_id_seq', 1, false);


--
-- TOC entry 3266 (class 0 OID 416821)
-- Dependencies: 192
-- Data for Name: fabricaciones_muebles; Type: TABLE DATA; Schema: activos; Owner: eureka
--

COPY fabricaciones_muebles (id, bien_id, cantidad, porcentaje_fabricacion, monto_ejecutado, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 4379 (class 0 OID 0)
-- Dependencies: 193
-- Name: fabricaciones_muebles_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: eureka
--

SELECT pg_catalog.setval('fabricaciones_muebles_id_seq', 1, false);


--
-- TOC entry 3268 (class 0 OID 416828)
-- Dependencies: 194
-- Data for Name: facturas; Type: TABLE DATA; Schema: activos; Owner: eureka
--

COPY facturas (id, num_factura, proveedor_id, fecha_emision, imprenta_id, fecha_emision_talonario, comprador_id, base_imponible_gravable, exento, iva, contratista_id, bien_id, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 4380 (class 0 OID 0)
-- Dependencies: 195
-- Name: facturas_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: eureka
--

SELECT pg_catalog.setval('facturas_id_seq', 1, false);


--
-- TOC entry 3270 (class 0 OID 416835)
-- Dependencies: 196
-- Data for Name: inmuebles; Type: TABLE DATA; Schema: activos; Owner: eureka
--

COPY inmuebles (id, bien_id, descripcion, direccion_ubicacion, ficha_catastral, zonificacion, extension, titulo_supletorio, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 4381 (class 0 OID 0)
-- Dependencies: 197
-- Name: inmuebles_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: eureka
--

SELECT pg_catalog.setval('inmuebles_id_seq', 1, false);


--
-- TOC entry 4382 (class 0 OID 0)
-- Dependencies: 199
-- Name: licencia_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: eureka
--

SELECT pg_catalog.setval('licencia_id_seq', 1, false);


--
-- TOC entry 3272 (class 0 OID 416845)
-- Dependencies: 198
-- Data for Name: licencias; Type: TABLE DATA; Schema: activos; Owner: eureka
--

COPY licencias (id, activo_intangible_id, numero, fecha_adquisicion, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 4383 (class 0 OID 0)
-- Dependencies: 201
-- Name: medicion_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: eureka
--

SELECT pg_catalog.setval('medicion_id_seq', 1, false);


--
-- TOC entry 3274 (class 0 OID 416852)
-- Dependencies: 200
-- Data for Name: mediciones; Type: TABLE DATA; Schema: activos; Owner: eureka
--

COPY mediciones (id, bien_id, medicion_activo, sys_metodo_medicion_id, aplica_deterioro, vinculado_proceso_productivo, vinculado_proceso_ventas, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 4384 (class 0 OID 0)
-- Dependencies: 203
-- Name: mejoras_propiedad_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: eureka
--

SELECT pg_catalog.setval('mejoras_propiedad_id_seq', 1, false);


--
-- TOC entry 3276 (class 0 OID 416863)
-- Dependencies: 202
-- Data for Name: mejoras_propiedades; Type: TABLE DATA; Schema: activos; Owner: eureka
--

COPY mejoras_propiedades (id, clasificacion, sys_tipo_bien_id, principio_contable_id, depreciacion, deterioro, bien_id, monto, fecha, capitalizable, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 3278 (class 0 OID 416873)
-- Dependencies: 204
-- Data for Name: muebles; Type: TABLE DATA; Schema: activos; Owner: eureka
--

COPY muebles (id, bien_id, marca, modelo, serial, cantidad, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 4385 (class 0 OID 0)
-- Dependencies: 205
-- Name: muebles_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: eureka
--

SELECT pg_catalog.setval('muebles_id_seq', 1, false);


--
-- TOC entry 3281 (class 0 OID 416885)
-- Dependencies: 207
-- Data for Name: sys_clasificaciones_bienes; Type: TABLE DATA; Schema: activos; Owner: eureka
--

COPY sys_clasificaciones_bienes (id, nombre, descripcion, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
1	adsf	asd	t	2015-04-22 14:12:49.808-04:30	\N	\N
2	sdaf	asd	t	2015-04-22 14:21:59.208-04:30	\N	\N
3	sdfg	sfg	t	2015-04-22 14:22:05.864-04:30	\N	\N
\.


--
-- TOC entry 4386 (class 0 OID 0)
-- Dependencies: 206
-- Name: sys_clasificaciones_bienes_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: eureka
--

SELECT pg_catalog.setval('sys_clasificaciones_bienes_id_seq', 3, true);


--
-- TOC entry 3282 (class 0 OID 416894)
-- Dependencies: 208
-- Data for Name: sys_formas_org; Type: TABLE DATA; Schema: activos; Owner: eureka
--

COPY sys_formas_org (id, nombre, descripcion, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 4387 (class 0 OID 0)
-- Dependencies: 209
-- Name: sys_formas_org_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: eureka
--

SELECT pg_catalog.setval('sys_formas_org_id_seq', 1, false);


--
-- TOC entry 3284 (class 0 OID 416904)
-- Dependencies: 210
-- Data for Name: sys_gremios; Type: TABLE DATA; Schema: activos; Owner: eureka
--

COPY sys_gremios (id, persona_juridica_id, direccion, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 4388 (class 0 OID 0)
-- Dependencies: 211
-- Name: sys_gremios_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: eureka
--

SELECT pg_catalog.setval('sys_gremios_id_seq', 1, false);


--
-- TOC entry 4389 (class 0 OID 0)
-- Dependencies: 213
-- Name: sys_metodo_medicion_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: eureka
--

SELECT pg_catalog.setval('sys_metodo_medicion_id_seq', 1, false);


--
-- TOC entry 3286 (class 0 OID 416914)
-- Dependencies: 212
-- Data for Name: sys_metodos_medicion; Type: TABLE DATA; Schema: activos; Owner: eureka
--

COPY sys_metodos_medicion (id, nombre, descripcion, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 4390 (class 0 OID 0)
-- Dependencies: 215
-- Name: sys_motivios_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: eureka
--

SELECT pg_catalog.setval('sys_motivios_id_seq', 1, false);


--
-- TOC entry 3288 (class 0 OID 416924)
-- Dependencies: 214
-- Data for Name: sys_motivos; Type: TABLE DATA; Schema: activos; Owner: eureka
--

COPY sys_motivos (id, nombre, descripcion, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 4391 (class 0 OID 0)
-- Dependencies: 217
-- Name: sys_tipo_bien_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: eureka
--

SELECT pg_catalog.setval('sys_tipo_bien_id_seq', 1, false);


--
-- TOC entry 3290 (class 0 OID 416934)
-- Dependencies: 216
-- Data for Name: sys_tipos_bienes; Type: TABLE DATA; Schema: activos; Owner: eureka
--

COPY sys_tipos_bienes (id, nombre, descripcion, sys_clasificacion_bien_id, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 3293 (class 0 OID 416946)
-- Dependencies: 219
-- Data for Name: sys_tipos_documentos; Type: TABLE DATA; Schema: activos; Owner: eureka
--

COPY sys_tipos_documentos (id, nombre, estado, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 4392 (class 0 OID 0)
-- Dependencies: 218
-- Name: sys_tipos_documentos_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: eureka
--

SELECT pg_catalog.setval('sys_tipos_documentos_id_seq', 1, false);


--
-- TOC entry 3294 (class 0 OID 416953)
-- Dependencies: 220
-- Data for Name: sys_tipos_registros; Type: TABLE DATA; Schema: activos; Owner: eureka
--

COPY sys_tipos_registros (id, nombre, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 4393 (class 0 OID 0)
-- Dependencies: 221
-- Name: sys_tipos_registros_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: eureka
--

SELECT pg_catalog.setval('sys_tipos_registros_id_seq', 1, false);


--
-- TOC entry 3296 (class 0 OID 416960)
-- Dependencies: 222
-- Data for Name: vehiculos; Type: TABLE DATA; Schema: activos; Owner: eureka
--

COPY vehiculos (id, mueble_id, anho, uso, num_certificado, placa, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 4394 (class 0 OID 0)
-- Dependencies: 223
-- Name: vehiculos_id_seq; Type: SEQUENCE SET; Schema: activos; Owner: eureka
--

SELECT pg_catalog.setval('vehiculos_id_seq', 1, false);


SET search_path = public, pg_catalog;

--
-- TOC entry 3298 (class 0 OID 416967)
-- Dependencies: 224
-- Data for Name: acciones; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY acciones (id, tipo_accion, numero_principal, numero_comun, numero_preferencial, valor_principal, valor_comun, valor_preferencial, capital_id, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 4395 (class 0 OID 0)
-- Dependencies: 225
-- Name: acciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('acciones_id_seq', 1, false);


--
-- TOC entry 4396 (class 0 OID 0)
-- Dependencies: 227
-- Name: accionistas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('accionistas_id_seq', 1, false);


--
-- TOC entry 3300 (class 0 OID 416976)
-- Dependencies: 226
-- Data for Name: accionistas_otros; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY accionistas_otros (id, contratista_id, natural_juridica_id, porcentaje_accionario, valor_compra, fecha, obligacion, accionista, junta_directiva, rep_legal, cargo, documento_registrado_id, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 3302 (class 0 OID 416985)
-- Dependencies: 228
-- Data for Name: actas_constitutivas; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY actas_constitutivas (id, contratista_id, documento_registrado_id, capital_id, denominacion_comercial_id, duracion_empresa_id, objeto_social_id, razon_social_id, domicilio_id, accionista_otro, comisario_auditor_id, cierre_ejercicio_id, fecha_modificacion, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 4397 (class 0 OID 0)
-- Dependencies: 229
-- Name: actas_constitutivas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('actas_constitutivas_id_seq', 1, false);


--
-- TOC entry 3304 (class 0 OID 416994)
-- Dependencies: 230
-- Data for Name: actividades_economicas; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY actividades_economicas (id, ppal_caev_id, comp1_caev_id, comp2_caev_id, contratista_id, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 4398 (class 0 OID 0)
-- Dependencies: 231
-- Name: actividades_economicas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('actividades_economicas_id_seq', 1, false);


--
-- TOC entry 3306 (class 0 OID 417001)
-- Dependencies: 232
-- Data for Name: auth_assignment; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY auth_assignment (item_name, user_id, created_at) FROM stdin;
\.


--
-- TOC entry 3307 (class 0 OID 417004)
-- Dependencies: 233
-- Data for Name: auth_item; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY auth_item (name, type, description, rule_name, data, created_at, updated_at, group_code) FROM stdin;
commonPermission	2	Common permission	\N	\N	1429743423	1429743423	\N
/*	3	\N	\N	\N	1429743465	1429743465	\N
/fixture/*	3	\N	\N	\N	1429743465	1429743465	\N
/fixture/unload	3	\N	\N	\N	1429743465	1429743465	\N
/fixture/load	3	\N	\N	\N	1429743465	1429743465	\N
/asset/*	3	\N	\N	\N	1429743465	1429743465	\N
/asset/template	3	\N	\N	\N	1429743465	1429743465	\N
/asset/compress	3	\N	\N	\N	1429743465	1429743465	\N
/cache/*	3	\N	\N	\N	1429743465	1429743465	\N
/cache/flush-schema	3	\N	\N	\N	1429743465	1429743465	\N
/cache/flush-all	3	\N	\N	\N	1429743465	1429743465	\N
/cache/flush	3	\N	\N	\N	1429743465	1429743465	\N
/cache/index	3	\N	\N	\N	1429743465	1429743465	\N
/migrate/*	3	\N	\N	\N	1429743465	1429743465	\N
/migrate/create	3	\N	\N	\N	1429743465	1429743465	\N
/migrate/new	3	\N	\N	\N	1429743465	1429743465	\N
/migrate/history	3	\N	\N	\N	1429743465	1429743465	\N
/migrate/mark	3	\N	\N	\N	1429743465	1429743465	\N
/migrate/to	3	\N	\N	\N	1429743465	1429743465	\N
/migrate/redo	3	\N	\N	\N	1429743465	1429743465	\N
/migrate/down	3	\N	\N	\N	1429743465	1429743465	\N
/migrate/up	3	\N	\N	\N	1429743465	1429743465	\N
/help/*	3	\N	\N	\N	1429743465	1429743465	\N
/help/index	3	\N	\N	\N	1429743465	1429743465	\N
/message/*	3	\N	\N	\N	1429743465	1429743465	\N
/message/extract	3	\N	\N	\N	1429743465	1429743465	\N
/message/config	3	\N	\N	\N	1429743465	1429743465	\N
//*	3	\N	\N	\N	1429743465	1429743465	\N
//index	3	\N	\N	\N	1429743465	1429743465	\N
//extension	3	\N	\N	\N	1429743465	1429743465	\N
//module	3	\N	\N	\N	1429743465	1429743465	\N
//form	3	\N	\N	\N	1429743465	1429743465	\N
//controller	3	\N	\N	\N	1429743465	1429743465	\N
//crud	3	\N	\N	\N	1429743465	1429743465	\N
//model	3	\N	\N	\N	1429743465	1429743465	\N
/gii/*	3	\N	\N	\N	1429743465	1429743465	\N
/gii/default/*	3	\N	\N	\N	1429743465	1429743465	\N
/gii/default/action	3	\N	\N	\N	1429743465	1429743465	\N
/gii/default/diff	3	\N	\N	\N	1429743465	1429743465	\N
/gii/default/preview	3	\N	\N	\N	1429743465	1429743465	\N
/gii/default/view	3	\N	\N	\N	1429743465	1429743465	\N
/gii/default/index	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/*	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/user-visit-log/*	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/user-visit-log/grid-page-size	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/user-visit-log/grid-sort	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/user-visit-log/bulk-delete	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/user-visit-log/bulk-deactivate	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/user-visit-log/bulk-activate	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/user-visit-log/toggle-attribute	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/user-visit-log/delete	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/user-visit-log/update	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/user-visit-log/create	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/user-visit-log/view	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/user-visit-log/index	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/user-permission/*	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/user-permission/set-roles	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/user-permission/set	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/user/*	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/user/grid-page-size	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/user/grid-sort	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/user/bulk-delete	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/user/bulk-deactivate	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/user/bulk-activate	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/user/toggle-attribute	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/user/delete	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/user/update	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/user/view	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/user/index	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/user/change-password	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/user/create	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/role/*	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/role/grid-page-size	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/role/grid-sort	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/role/bulk-delete	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/role/bulk-deactivate	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/role/bulk-activate	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/role/toggle-attribute	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/role/delete	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/role/index	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/role/update	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/role/create	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/role/set-child-permissions	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/role/set-child-roles	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/role/view	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/permission/*	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/permission/grid-page-size	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/permission/grid-sort	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/permission/bulk-delete	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/permission/bulk-deactivate	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/permission/bulk-activate	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/permission/toggle-attribute	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/permission/delete	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/permission/index	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/permission/update	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/permission/create	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/permission/refresh-routes	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/permission/set-child-routes	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/permission/set-child-permissions	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/permission/view	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/auth-item-group/*	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/auth-item-group/grid-page-size	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/auth-item-group/grid-sort	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/auth-item-group/bulk-delete	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/auth-item-group/bulk-deactivate	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/auth-item-group/bulk-activate	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/auth-item-group/toggle-attribute	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/auth-item-group/delete	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/auth-item-group/update	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/auth-item-group/create	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/auth-item-group/view	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/auth-item-group/index	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/auth/*	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/auth/confirm-email-receive	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/auth/confirm-email	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/auth/password-recovery-receive	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/auth/password-recovery	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/auth/confirm-registration-email	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/auth/registration	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/auth/change-own-password	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/auth/logout	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/auth/login	3	\N	\N	\N	1429743465	1429743465	\N
/user-management/auth/captcha	3	\N	\N	\N	1429743465	1429743465	\N
Admin	1	Admin	\N	\N	1429743465	1429743465	\N
viewUsers	2	View users	\N	\N	1429743465	1429743465	userManagement
createUsers	2	Create users	\N	\N	1429743465	1429743465	userManagement
editUsers	2	Edit users	\N	\N	1429743465	1429743465	userManagement
deleteUsers	2	Delete users	\N	\N	1429743465	1429743465	userManagement
changeUserPassword	2	Change user password	\N	\N	1429743465	1429743465	userManagement
assignRolesToUsers	2	Assign roles to users	\N	\N	1429743465	1429743465	userManagement
viewVisitLog	2	View visit log	\N	\N	1429743465	1429743465	userManagement
viewUserRoles	2	View user roles	\N	\N	1429743465	1429743465	userManagement
viewRegistrationIp	2	View registration IP	\N	\N	1429743465	1429743465	userManagement
viewUserEmail	2	View user email	\N	\N	1429743465	1429743465	userManagement
editUserEmail	2	Edit user email	\N	\N	1429743465	1429743465	userManagement
bindUserToIp	2	Bind user to IP	\N	\N	1429743465	1429743465	userManagement
changeOwnPassword	2	Change own password	\N	\N	1429743465	1429743465	userCommonPermissions
cargaInfor	2	Cargar información	\N	\N	1429748345	1429748345	comisario
comisario	1	Comisario	\N	\N	1429751202	1429751202	\N
registroContratista	2	Registro Contratista	\N	\N	1429807771	1429807791	userCommonPermissions
\.


--
-- TOC entry 3308 (class 0 OID 417010)
-- Dependencies: 234
-- Data for Name: auth_item_child; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY auth_item_child (parent, child) FROM stdin;
Admin	viewUsers
viewUsers	/user-management/user/index
viewUsers	/user-management/user/view
viewUsers	/user-management/user/grid-page-size
Admin	createUsers
createUsers	/user-management/user/create
Admin	editUsers
editUsers	/user-management/user/update
editUsers	/user-management/user/bulk-activate
editUsers	/user-management/user/bulk-deactivate
Admin	deleteUsers
deleteUsers	/user-management/user/delete
deleteUsers	/user-management/user/bulk-delete
Admin	changeUserPassword
changeUserPassword	/user-management/user/change-password
Admin	assignRolesToUsers
assignRolesToUsers	/user-management/user-permission/set
assignRolesToUsers	/user-management/user-permission/set-roles
viewVisitLog	/user-management/user-visit-log/index
viewVisitLog	/user-management/user-visit-log/grid-page-size
viewVisitLog	/user-management/user-visit-log/view
assignRolesToUsers	viewUsers
assignRolesToUsers	viewUserRoles
changeUserPassword	viewUsers
deleteUsers	viewUsers
createUsers	viewUsers
editUsers	viewUsers
editUserEmail	viewUserEmail
Admin	changeOwnPassword
changeOwnPassword	/user-management/auth/change-own-password
comisario	changeOwnPassword
comisario	cargaInfor
viewRegistrationIp	cargaInfor
registroContratista	/user-management/auth/*
registroContratista	/user-management/auth/confirm-email-receive
registroContratista	/user-management/auth/confirm-email
registroContratista	/user-management/auth/password-recovery-receive
registroContratista	/user-management/auth/password-recovery
registroContratista	/user-management/auth/confirm-registration-email
registroContratista	/user-management/auth/registration
registroContratista	/user-management/auth/change-own-password
registroContratista	/user-management/auth/logout
registroContratista	/user-management/auth/login
registroContratista	/user-management/auth/captcha
\.


--
-- TOC entry 3309 (class 0 OID 417013)
-- Dependencies: 235
-- Data for Name: auth_item_group; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY auth_item_group (code, name, created_at, updated_at) FROM stdin;
userManagement	User management	1429743465	1429743465
userCommonPermissions	User common permission	1429743465	1429743465
cargaActivos	Carga de Activos	1429748008	1429748026
comisario	Comisario	1429748062	1429748062
\.


--
-- TOC entry 3310 (class 0 OID 417016)
-- Dependencies: 236
-- Data for Name: auth_rule; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY auth_rule (name, data, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3311 (class 0 OID 417022)
-- Dependencies: 237
-- Data for Name: bancos_contratistas; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY bancos_contratistas (id, banco_id, contratista_id, num_cuenta, tipo_moneda, tipo_cuenta, estatus_cuenta, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 4399 (class 0 OID 0)
-- Dependencies: 238
-- Name: bancos_contratistas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('bancos_contratistas_id_seq', 1, false);


--
-- TOC entry 3313 (class 0 OID 417031)
-- Dependencies: 239
-- Data for Name: capitales; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY capitales (id, tipo_capital, accion, certificado, suplementario, efectivo, propiedad, inventario, biologico, intangible, pagar_accionista, decreto, capital_social, contratista_id, documento_registrado_id, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 3314 (class 0 OID 417038)
-- Dependencies: 240
-- Data for Name: capitales_decretos; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY capitales_decretos (id, numero_accion, valor_accion, saldo_cierre, fecha_aumento, monto_aumento, capital_id, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 3315 (class 0 OID 417045)
-- Dependencies: 241
-- Data for Name: capitales_efectivos; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY capitales_efectivos (id, numero_transaccion, monto, fecha, sys_banco_id, cuenta_contratista_id, capital_id, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 4400 (class 0 OID 0)
-- Dependencies: 242
-- Name: capitales_efectivos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('capitales_efectivos_id_seq', 1, false);


--
-- TOC entry 4401 (class 0 OID 0)
-- Dependencies: 243
-- Name: capitales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('capitales_id_seq', 1, false);


--
-- TOC entry 3318 (class 0 OID 417056)
-- Dependencies: 244
-- Data for Name: capitales_mercancias; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY capitales_mercancias (id, monto, codigo_producto_id, fecha, capital_id, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 4402 (class 0 OID 0)
-- Dependencies: 245
-- Name: capitales_mercancias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('capitales_mercancias_id_seq', 1, false);


--
-- TOC entry 3320 (class 0 OID 417065)
-- Dependencies: 246
-- Data for Name: capitales_pagar_accionistas; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY capitales_pagar_accionistas (id, saldo_cierre, fecha_corte, saldo_corte, monto_aumento, saldo_aumento, capital_id, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 3321 (class 0 OID 417072)
-- Dependencies: 247
-- Data for Name: capitales_propiedades; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY capitales_propiedades (id, monto, capital_id, factura_id, documento_registrado_id, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 4403 (class 0 OID 0)
-- Dependencies: 248
-- Name: capitales_propiedades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('capitales_propiedades_id_seq', 1, false);


--
-- TOC entry 3323 (class 0 OID 417081)
-- Dependencies: 249
-- Data for Name: certificaciones_aportes; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY certificaciones_aportes (id, capital_id, persona_natural_id, colegiatura, tipo_profesion, fecha_informe, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 3324 (class 0 OID 417088)
-- Dependencies: 250
-- Data for Name: certificados; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY certificados (id, tipo_certificado, capital_id, numero_asociacion, numero_aportacion, numero_rotativo, numero_inversion, valor_asociacion, valor_aportacion, valor_rotativo, valor_inversion, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 4404 (class 0 OID 0)
-- Dependencies: 251
-- Name: certificados_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('certificados_id_seq', 1, false);


--
-- TOC entry 4405 (class 0 OID 0)
-- Dependencies: 252
-- Name: certificiones_aportes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('certificiones_aportes_id_seq', 1, false);


--
-- TOC entry 3327 (class 0 OID 417099)
-- Dependencies: 253
-- Data for Name: cierres_ejercicios; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY cierres_ejercicios (id, contratista_id, documento_registrado_id, fecha_cierre, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 4406 (class 0 OID 0)
-- Dependencies: 254
-- Name: cierres_ejercicios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('cierres_ejercicios_id_seq', 1, false);


--
-- TOC entry 3329 (class 0 OID 417108)
-- Dependencies: 255
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY clientes (id, nombre, publico, contratista_id, natural_juridico_id, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 4407 (class 0 OID 0)
-- Dependencies: 256
-- Name: clientes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('clientes_id_seq', 1, false);


--
-- TOC entry 3331 (class 0 OID 417118)
-- Dependencies: 257
-- Data for Name: comisarios_auditores; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY comisarios_auditores (id, fecha_vencimiento, declaracion_jurada, tipo_profesion, fecha_carta, colegiatura, documento_registrado_id, contratista_id, comisario, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 4408 (class 0 OID 0)
-- Dependencies: 258
-- Name: comisarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('comisarios_id_seq', 1, false);


--
-- TOC entry 3333 (class 0 OID 417127)
-- Dependencies: 259
-- Data for Name: contratistas; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY contratistas (id, natural_juridica_id, estatus_contratista_id, sigla, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el, tipo_sector) FROM stdin;
\.


--
-- TOC entry 3334 (class 0 OID 417134)
-- Dependencies: 260
-- Data for Name: contratistas_contactos; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY contratistas_contactos (id, contacto_id, contratista_id, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 4409 (class 0 OID 0)
-- Dependencies: 261
-- Name: contratistas_contactos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('contratistas_contactos_id_seq', 1, false);


--
-- TOC entry 4410 (class 0 OID 0)
-- Dependencies: 262
-- Name: contratistas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('contratistas_id_seq', 1, false);


--
-- TOC entry 3337 (class 0 OID 417143)
-- Dependencies: 263
-- Data for Name: contratos_facturas; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY contratos_facturas (id, relacion_contrato_id, orden_factura, monto, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 4411 (class 0 OID 0)
-- Dependencies: 264
-- Name: contratos_facturas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('contratos_facturas_id_seq', 1, false);


--
-- TOC entry 3339 (class 0 OID 417152)
-- Dependencies: 265
-- Data for Name: contratos_valuaciones; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY contratos_valuaciones (id, relacion_contrato_id, orden_valuacion, monto, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 4412 (class 0 OID 0)
-- Dependencies: 266
-- Name: contratos_valuaciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('contratos_valuaciones_id_seq', 1, false);


--
-- TOC entry 4413 (class 0 OID 0)
-- Dependencies: 267
-- Name: cuentas_xpagar_accionistas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('cuentas_xpagar_accionistas_id_seq', 1, false);


--
-- TOC entry 4414 (class 0 OID 0)
-- Dependencies: 268
-- Name: decretos_dividiendos_acciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('decretos_dividiendos_acciones_id_seq', 1, false);


--
-- TOC entry 3343 (class 0 OID 417165)
-- Dependencies: 269
-- Data for Name: denominaciones_comerciales; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY denominaciones_comerciales (id, sys_denominacion_comercial_id, sys_subdenominacion_comercial_id, codigo_situr, fin_lucro, cooperativa_capital, cooperativa_distribuicion, contratista_id, documento_registrado_id, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 4415 (class 0 OID 0)
-- Dependencies: 270
-- Name: denominaciones_comerciales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('denominaciones_comerciales_id_seq', 1, false);


--
-- TOC entry 3345 (class 0 OID 417174)
-- Dependencies: 271
-- Data for Name: direcciones; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY direcciones (id, zona, calle, casa, nivel, numero, referencia, sys_estado_id, sys_municipio_id, sys_parroquia_id, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 4416 (class 0 OID 0)
-- Dependencies: 272
-- Name: direcciones_sucursales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('direcciones_sucursales_id_seq', 1, false);


--
-- TOC entry 3347 (class 0 OID 417186)
-- Dependencies: 273
-- Data for Name: domicilios; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY domicilios (id, contratista_id, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el, direccion_id, documento_registrado_id, fiscal) FROM stdin;
\.


--
-- TOC entry 4417 (class 0 OID 0)
-- Dependencies: 274
-- Name: domicilios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('domicilios_id_seq', 1, false);


--
-- TOC entry 4418 (class 0 OID 0)
-- Dependencies: 276
-- Name: duraciones_emepresas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('duraciones_emepresas_id_seq', 1, false);


--
-- TOC entry 3349 (class 0 OID 417195)
-- Dependencies: 275
-- Data for Name: duraciones_empresas; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY duraciones_empresas (id, contratista_id, documento_registrado_id, tiempo_prorroga, fecha_vencimiento, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 3351 (class 0 OID 417204)
-- Dependencies: 277
-- Data for Name: empresas_relacionadas; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY empresas_relacionadas (id, tipo_relacion, tipo_sector, sys_pais_id, fecha_inicio, fecha_fin, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el, persona_juridica_id, persona_contacto_id) FROM stdin;
\.


--
-- TOC entry 4419 (class 0 OID 0)
-- Dependencies: 278
-- Name: empresas_relacionadas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('empresas_relacionadas_id_seq', 1, false);


--
-- TOC entry 3353 (class 0 OID 417211)
-- Dependencies: 279
-- Data for Name: estatus_contratistas; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY estatus_contratistas (id, descripcion, informacion_adicional, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 4420 (class 0 OID 0)
-- Dependencies: 280
-- Name: estatus_contratistas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('estatus_contratistas_id_seq', 1, false);


--
-- TOC entry 3355 (class 0 OID 417223)
-- Dependencies: 281
-- Data for Name: fondos_reservas; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY fondos_reservas (id, acta_constitutiva_id, nombre_fondo, porcentaje, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 4421 (class 0 OID 0)
-- Dependencies: 282
-- Name: fondos_reservas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('fondos_reservas_id_seq', 1, false);


--
-- TOC entry 4422 (class 0 OID 0)
-- Dependencies: 284
-- Name: inpc_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('inpc_id_seq', 1, false);


--
-- TOC entry 3359 (class 0 OID 417241)
-- Dependencies: 285
-- Data for Name: migration; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY migration (version, apply_time) FROM stdin;
m140608_173539_create_user_table	1429743422
m140611_133903_init_rbac	1429743422
m140808_073114_create_auth_item_group_table	1429743423
m140809_072112_insert_superadmin_to_user	1429743423
m140809_073114_insert_common_permisison_to_auth_item	1429743423
m141023_141535_create_user_visit_log	1429743423
m141116_115804_add_bind_to_ip_and_registration_ip_to_user	1429743423
m141121_194858_split_browser_and_os_column	1429743423
m141201_220516_add_email_and_email_confirmed_to_user	1429743465
m141207_001649_create_basic_user_permissions	1429743465
\.


--
-- TOC entry 4423 (class 0 OID 0)
-- Dependencies: 287
-- Name: naturales_juridicas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('naturales_juridicas_id_seq', 1, false);


--
-- TOC entry 3362 (class 0 OID 417253)
-- Dependencies: 288
-- Data for Name: nombres_cajas; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY nombres_cajas (id, nombre, contratistas_id, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el, tipo_caja) FROM stdin;
\.


--
-- TOC entry 4424 (class 0 OID 0)
-- Dependencies: 289
-- Name: nombres_cajas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('nombres_cajas_id_seq', 1, false);


--
-- TOC entry 3364 (class 0 OID 417262)
-- Dependencies: 290
-- Data for Name: notas_revelatorias; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY notas_revelatorias (id, nota, contratista_id, usuario_id, estado, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 3365 (class 0 OID 417273)
-- Dependencies: 291
-- Data for Name: notas_revelatorias_cuentas; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY notas_revelatorias_cuentas (id, nota_revelatoria_id, sys_cuenta_id, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 4425 (class 0 OID 0)
-- Dependencies: 292
-- Name: notas_revelatorias_cuentas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('notas_revelatorias_cuentas_id_seq', 1, false);


--
-- TOC entry 4426 (class 0 OID 0)
-- Dependencies: 293
-- Name: notas_revelatorias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('notas_revelatorias_id_seq', 1, false);


--
-- TOC entry 3368 (class 0 OID 417282)
-- Dependencies: 294
-- Data for Name: objetos_autorizaciones; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY objetos_autorizaciones (id, objeto_empresa_id, domicilio_fabricante_id, productos, marcas, origen_producto_id, sello_firma, idioma_redacion_id, documento_traducido, numero_identificacion, nombre_interprete, fecha_emision, fecha_vencimiento, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el, persona_juridica_id) FROM stdin;
\.


--
-- TOC entry 4427 (class 0 OID 0)
-- Dependencies: 295
-- Name: objetos_autorizaciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('objetos_autorizaciones_id_seq', 1, false);


--
-- TOC entry 3370 (class 0 OID 417294)
-- Dependencies: 296
-- Data for Name: objetos_empresas; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY objetos_empresas (id, nombre, tipo_relacion, autorizacion, relacion_id, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 4428 (class 0 OID 0)
-- Dependencies: 297
-- Name: objetos_empresas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('objetos_empresas_id_seq', 1, false);


--
-- TOC entry 3372 (class 0 OID 417303)
-- Dependencies: 298
-- Data for Name: objetos_sociales; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY objetos_sociales (id, contratista_id, documento_registrado_id, tipo_objeto, descripcion, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 4429 (class 0 OID 0)
-- Dependencies: 299
-- Name: objetos_sociales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('objetos_sociales_id_seq', 1, false);


--
-- TOC entry 3374 (class 0 OID 417315)
-- Dependencies: 300
-- Data for Name: personas_juridicas; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY personas_juridicas (id, rif, razon_social, creado_por, numero_identitifacion, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el, tipo_nacionalidad) FROM stdin;
\.


--
-- TOC entry 4430 (class 0 OID 0)
-- Dependencies: 301
-- Name: personas_juridicas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('personas_juridicas_id_seq', 1, false);


--
-- TOC entry 3376 (class 0 OID 417325)
-- Dependencies: 302
-- Data for Name: personas_naturales; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY personas_naturales (id, primer_nombre, segundo_nombre, rif, ci, creado_por, primer_apellido, segundo_apellido, telefono_local, telefono_celular, fax, correo, pagina_web, facebook, twitter, instagram, sys_pais_id, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el, numero_identificacion, nacionalidad) FROM stdin;
\.


--
-- TOC entry 4431 (class 0 OID 0)
-- Dependencies: 303
-- Name: personas_naturales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('personas_naturales_id_seq', 1, false);


--
-- TOC entry 3378 (class 0 OID 417337)
-- Dependencies: 304
-- Data for Name: polizas_contratadas; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY polizas_contratadas (id, sys_pais_id, tipo_nacionalidad, contratista_id, numero_identificacion, numero_contrato, fecha_suscripcion, fecha_inicio, fecha_finalizacion, duracion, tipo_poliza, bien_asegurado, monto_asegurado, monto_contrato, aseguradora_id, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 4432 (class 0 OID 0)
-- Dependencies: 305
-- Name: polizas_contratadas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('polizas_contratadas_id_seq', 1, false);


--
-- TOC entry 3380 (class 0 OID 417347)
-- Dependencies: 306
-- Data for Name: principios_contables; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY principios_contables (id, principio_contable, codigo_sudeaseg, contratista_id, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 4433 (class 0 OID 0)
-- Dependencies: 307
-- Name: principios_contables_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('principios_contables_id_seq', 1, false);


--
-- TOC entry 4434 (class 0 OID 0)
-- Dependencies: 309
-- Name: razon_social_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('razon_social_id_seq', 1, false);


--
-- TOC entry 3382 (class 0 OID 417354)
-- Dependencies: 308
-- Data for Name: razones_sociales; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY razones_sociales (id, contratista_id, nombre, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 3384 (class 0 OID 417363)
-- Dependencies: 310
-- Data for Name: relaciones_contratos; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY relaciones_contratos (id, contratista_id, tipo_sector, tipo_contrato, nombre_proyecto, fecha_inicio, fecha_fin, monto_contrato, anticipo_recibido, porcentaje_ejecucion, evaluacion_ente, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el, natural_juridica_id) FROM stdin;
\.


--
-- TOC entry 4435 (class 0 OID 0)
-- Dependencies: 311
-- Name: relaciones_contratos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('relaciones_contratos_id_seq', 1, false);


--
-- TOC entry 3386 (class 0 OID 417375)
-- Dependencies: 312
-- Data for Name: sucursales; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY sucursales (persona_natural_id, direccion_id, contratista_id, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el, id) FROM stdin;
\.


--
-- TOC entry 4436 (class 0 OID 0)
-- Dependencies: 342
-- Name: sucursales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('sucursales_id_seq', 1, false);


--
-- TOC entry 3387 (class 0 OID 417382)
-- Dependencies: 313
-- Data for Name: suplementarios; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY suplementarios (id, tipo_suplementario, capital_id, numero, valor, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 4437 (class 0 OID 0)
-- Dependencies: 314
-- Name: suplementarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('suplementarios_id_seq', 1, false);


--
-- TOC entry 3389 (class 0 OID 417391)
-- Dependencies: 315
-- Data for Name: sys_bancos; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY sys_bancos (id, nombre, rif, codigo_sudeban, codigo_swift, sys_pais_id, tipo_nacionalidad, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 4438 (class 0 OID 0)
-- Dependencies: 316
-- Name: sys_bancos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('sys_bancos_id_seq', 1, false);


--
-- TOC entry 3391 (class 0 OID 417400)
-- Dependencies: 317
-- Data for Name: sys_caev; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY sys_caev (id, grupo, denominacion, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
3	sdfg	asdf	t	\N	2015-04-23 00:00:00-04:30	2015-04-23 00:00:00-04:30
4	asdf	asdf	f	2015-04-23 00:00:00-04:30	\N	2015-04-23 00:00:00-04:30
2	adsf	asdf	f	\N	\N	2015-04-23 00:00:00-04:30
5	fxfv	cxvzxcv	f	2015-04-23 09:09:09.545-04:30	2015-04-23 09:09:09.545-04:30	2015-04-23 09:20:41-04:30
6	asdf	asdf	t	2015-04-23 09:44:58.376-04:30	2015-04-23 10:21:50.741-04:30	2015-04-23 10:21:50-04:30
\.


--
-- TOC entry 4439 (class 0 OID 0)
-- Dependencies: 318
-- Name: sys_caev_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('sys_caev_id_seq', 6, true);


--
-- TOC entry 3393 (class 0 OID 417412)
-- Dependencies: 319
-- Data for Name: sys_ciudades; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY sys_ciudades (id, sys_estado_id, nombre, codigo_postal, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 4440 (class 0 OID 0)
-- Dependencies: 320
-- Name: sys_ciudades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('sys_ciudades_id_seq', 1, false);


--
-- TOC entry 3395 (class 0 OID 417424)
-- Dependencies: 321
-- Data for Name: sys_cuentas; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY sys_cuentas (id, nombre, modelos, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 4441 (class 0 OID 0)
-- Dependencies: 322
-- Name: sys_cuentas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('sys_cuentas_id_seq', 1, false);


--
-- TOC entry 3397 (class 0 OID 417434)
-- Dependencies: 323
-- Data for Name: sys_denominaciones_comerciales; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY sys_denominaciones_comerciales (id, nombre, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 3398 (class 0 OID 417441)
-- Dependencies: 324
-- Data for Name: sys_divisas; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY sys_divisas (id, nombre, codigo, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 3399 (class 0 OID 417448)
-- Dependencies: 325
-- Data for Name: sys_estados; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY sys_estados (id, sys_pais_id, nombre, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 4442 (class 0 OID 0)
-- Dependencies: 326
-- Name: sys_estados_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('sys_estados_id_seq', 1, false);


--
-- TOC entry 3357 (class 0 OID 417232)
-- Dependencies: 283
-- Data for Name: sys_inpc; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY sys_inpc (id, mes, indice, anho, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 4443 (class 0 OID 0)
-- Dependencies: 327
-- Name: sys_monedas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('sys_monedas_id_seq', 1, false);


--
-- TOC entry 3402 (class 0 OID 417459)
-- Dependencies: 328
-- Data for Name: sys_municipios; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY sys_municipios (id, sys_estado_id, nombre, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 4444 (class 0 OID 0)
-- Dependencies: 329
-- Name: sys_municipios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('sys_municipios_id_seq', 1, false);


--
-- TOC entry 3360 (class 0 OID 417244)
-- Dependencies: 286
-- Data for Name: sys_naturales_juridicas; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY sys_naturales_juridicas (id, rif, juridica, denominacion, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 3404 (class 0 OID 417468)
-- Dependencies: 330
-- Data for Name: sys_paises; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY sys_paises (id, nombre, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 4445 (class 0 OID 0)
-- Dependencies: 331
-- Name: sys_paises_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('sys_paises_id_seq', 1, false);


--
-- TOC entry 3406 (class 0 OID 417477)
-- Dependencies: 332
-- Data for Name: sys_parroquias; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY sys_parroquias (id, sys_municipio_id, nombre, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 4446 (class 0 OID 0)
-- Dependencies: 333
-- Name: sys_parroquias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('sys_parroquias_id_seq', 1, false);


--
-- TOC entry 3408 (class 0 OID 417486)
-- Dependencies: 334
-- Data for Name: sys_subdenominaciones_comerciales; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY sys_subdenominaciones_comerciales (id, nombre, sys_denominacion_comercial_id, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 4447 (class 0 OID 0)
-- Dependencies: 335
-- Name: sys_subdenominaciones_comerciales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('sys_subdenominaciones_comerciales_id_seq', 1, false);


--
-- TOC entry 3410 (class 0 OID 417495)
-- Dependencies: 336
-- Data for Name: sys_tasas_divisas; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY sys_tasas_divisas (id, sys_divisa_id, tasa, sys_status, sys_creado_el, sys_actualizado_el, sys_finalizado_el) FROM stdin;
\.


--
-- TOC entry 4448 (class 0 OID 0)
-- Dependencies: 337
-- Name: sys_tasas_divisas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('sys_tasas_divisas_id_seq', 1, false);


--
-- TOC entry 3412 (class 0 OID 417504)
-- Dependencies: 338
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY "user" (id, username, auth_key, password_hash, confirmation_token, status, superadmin, created_at, updated_at, registration_ip, bind_to_ip, email, email_confirmed) FROM stdin;
1	superadmin	GRI6cEgyJnVMFfPHO7IEhOYtYar30Fa8	$2y$13$QoQ1vcvZyPJ/Qr5ioABcB.IQsTa54ft3UHroiMQSN8Icu451oXgsm	\N	1	1	1429743423	1429743423	\N	\N	\N	0
\.


--
-- TOC entry 4449 (class 0 OID 0)
-- Dependencies: 339
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('user_id_seq', 4, true);


--
-- TOC entry 3414 (class 0 OID 417515)
-- Dependencies: 340
-- Data for Name: user_visit_log; Type: TABLE DATA; Schema: public; Owner: eureka
--

COPY user_visit_log (id, token, ip, language, user_agent, user_id, visit_time, browser, os) FROM stdin;
1	553835722ea18	127.0.0.1	en	Mozilla/5.0 (Windows NT 6.1; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0	1	1429747058	Firefox	Windows
2	55383ac8497c8	127.0.0.1	en	Mozilla/5.0 (Windows NT 6.1; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0	1	1429748424	Firefox	Windows
3	553845f796640	127.0.0.1	en	Mozilla/5.0 (Windows NT 6.1; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0	1	1429751287	Firefox	Windows
5	5538471672038	127.0.0.1	en	Mozilla/5.0 (Windows NT 6.1; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0	1	1429751574	Firefox	Windows
6	553847798fcc8	127.0.0.1	en	Mozilla/5.0 (Windows NT 6.1; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0	1	1429751673	Firefox	Windows
7	5538ffaf9fe98	127.0.0.1	en	Mozilla/5.0 (Windows NT 6.1; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0	1	1429798831	Firefox	Windows
4	5538468546cd0	127.0.0.1	en	Mozilla/5.0 (Windows NT 6.1; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0	\N	1429751429	Firefox	Windows
8	55390af5ec540	127.0.0.1	en	Mozilla/5.0 (Windows NT 6.1; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0	1	1429801717	Firefox	Windows
9	55390e114da30	127.0.0.1	en	Mozilla/5.0 (Windows NT 6.1; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0	1	1429802513	Firefox	Windows
11	5539109bbd740	127.0.0.1	en	Mozilla/5.0 (Windows NT 6.1; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0	1	1429803163	Firefox	Windows
12	553910e98e940	127.0.0.1	en	Mozilla/5.0 (Windows NT 6.1; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0	1	1429803241	Firefox	Windows
13	553915ab87be0	127.0.0.1	en	Mozilla/5.0 (Windows NT 6.1; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0	1	1429804459	Firefox	Windows
14	5539222b14050	127.0.0.1	en	Mozilla/5.0 (Windows NT 6.1; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0	1	1429807659	Firefox	Windows
10	55390e3bc5058	127.0.0.1	en	Mozilla/5.0 (Windows NT 6.1; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0	\N	1429802555	Firefox	Windows
\.


--
-- TOC entry 4450 (class 0 OID 0)
-- Dependencies: 341
-- Name: user_visit_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eureka
--

SELECT pg_catalog.setval('user_visit_log_id_seq', 14, true);


SET search_path = activos, pg_catalog;

--
-- TOC entry 2781 (class 2606 OID 417603)
-- Name: activos_biologicos_pkey; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY activos_biologicos
    ADD CONSTRAINT activos_biologicos_pkey PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 417605)
-- Name: activos_intangibles_pkey; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY activos_intangibles
    ADD CONSTRAINT activos_intangibles_pkey PRIMARY KEY (id);


--
-- TOC entry 2785 (class 2606 OID 417607)
-- Name: avaluos_pkey; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY avaluos
    ADD CONSTRAINT avaluos_pkey PRIMARY KEY (id);


--
-- TOC entry 2787 (class 2606 OID 417609)
-- Name: bienes_pkey; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY bienes
    ADD CONSTRAINT bienes_pkey PRIMARY KEY (id);


--
-- TOC entry 2789 (class 2606 OID 417611)
-- Name: construcciones_inmuebles_pkey; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY construcciones_inmuebles
    ADD CONSTRAINT construcciones_inmuebles_pkey PRIMARY KEY (id);


--
-- TOC entry 2791 (class 2606 OID 417613)
-- Name: datos_importacion_pkey; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY datos_importaciones
    ADD CONSTRAINT datos_importacion_pkey PRIMARY KEY (id);


--
-- TOC entry 2794 (class 2606 OID 417615)
-- Name: depresiaciones_amortizaciones_pkey; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY depreciaciones_amortizaciones
    ADD CONSTRAINT depresiaciones_amortizaciones_pkey PRIMARY KEY (id);


--
-- TOC entry 2796 (class 2606 OID 417617)
-- Name: desincorporacion_activos_pkey; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY desincorporacion_activos
    ADD CONSTRAINT desincorporacion_activos_pkey PRIMARY KEY (id);


--
-- TOC entry 2798 (class 2606 OID 417619)
-- Name: deterioros_pkey; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY deterioros
    ADD CONSTRAINT deterioros_pkey PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 417621)
-- Name: documentos_registrados_pkey; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY documentos_registrados
    ADD CONSTRAINT documentos_registrados_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 417623)
-- Name: fabricaciones_muebles_pkey; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY fabricaciones_muebles
    ADD CONSTRAINT fabricaciones_muebles_pkey PRIMARY KEY (id);


--
-- TOC entry 2805 (class 2606 OID 417625)
-- Name: facturas_pkey; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY facturas
    ADD CONSTRAINT facturas_pkey PRIMARY KEY (id);


--
-- TOC entry 2807 (class 2606 OID 417627)
-- Name: facturas_proveedor_id_num_factura_key; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY facturas
    ADD CONSTRAINT facturas_proveedor_id_num_factura_key UNIQUE (proveedor_id, num_factura);


--
-- TOC entry 2810 (class 2606 OID 417629)
-- Name: inmuebles_pkey; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY inmuebles
    ADD CONSTRAINT inmuebles_pkey PRIMARY KEY (id);


--
-- TOC entry 2812 (class 2606 OID 417631)
-- Name: licencia_pkey; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY licencias
    ADD CONSTRAINT licencia_pkey PRIMARY KEY (id);


--
-- TOC entry 2814 (class 2606 OID 417633)
-- Name: medicion_pkey; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY mediciones
    ADD CONSTRAINT medicion_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 417635)
-- Name: mejoras_propiedad_pkey; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY mejoras_propiedades
    ADD CONSTRAINT mejoras_propiedad_pkey PRIMARY KEY (id);


--
-- TOC entry 2819 (class 2606 OID 417637)
-- Name: muebles_pkey; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY muebles
    ADD CONSTRAINT muebles_pkey PRIMARY KEY (id);


--
-- TOC entry 2821 (class 2606 OID 417639)
-- Name: sys_clasificaciones_bien_pkey; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_clasificaciones_bienes
    ADD CONSTRAINT sys_clasificaciones_bien_pkey PRIMARY KEY (id);


--
-- TOC entry 2823 (class 2606 OID 417641)
-- Name: sys_formas_org_nombre_key; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_formas_org
    ADD CONSTRAINT sys_formas_org_nombre_key UNIQUE (nombre);


--
-- TOC entry 2825 (class 2606 OID 417643)
-- Name: sys_formas_org_pkey; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_formas_org
    ADD CONSTRAINT sys_formas_org_pkey PRIMARY KEY (id);


--
-- TOC entry 2827 (class 2606 OID 417645)
-- Name: sys_gremios_pkey; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_gremios
    ADD CONSTRAINT sys_gremios_pkey PRIMARY KEY (id);


--
-- TOC entry 2829 (class 2606 OID 417647)
-- Name: sys_metodo_medicion_nombre_key; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_metodos_medicion
    ADD CONSTRAINT sys_metodo_medicion_nombre_key UNIQUE (nombre);


--
-- TOC entry 2831 (class 2606 OID 417649)
-- Name: sys_metodo_medicion_pkey; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_metodos_medicion
    ADD CONSTRAINT sys_metodo_medicion_pkey PRIMARY KEY (id);


--
-- TOC entry 2833 (class 2606 OID 417651)
-- Name: sys_motivios_nombre_key; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_motivos
    ADD CONSTRAINT sys_motivios_nombre_key UNIQUE (nombre);


--
-- TOC entry 2835 (class 2606 OID 417653)
-- Name: sys_motivios_pkey; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_motivos
    ADD CONSTRAINT sys_motivios_pkey PRIMARY KEY (id);


--
-- TOC entry 2838 (class 2606 OID 417655)
-- Name: sys_tipo_bien_nombre_key; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_tipos_bienes
    ADD CONSTRAINT sys_tipo_bien_nombre_key UNIQUE (nombre);


--
-- TOC entry 2840 (class 2606 OID 417657)
-- Name: sys_tipo_bien_pkey; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_tipos_bienes
    ADD CONSTRAINT sys_tipo_bien_pkey PRIMARY KEY (id);


--
-- TOC entry 2842 (class 2606 OID 417659)
-- Name: sys_tipo_documento_nombre_key; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_tipos_documentos
    ADD CONSTRAINT sys_tipo_documento_nombre_key UNIQUE (nombre);


--
-- TOC entry 2844 (class 2606 OID 417661)
-- Name: sys_tipo_documento_pkey; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_tipos_documentos
    ADD CONSTRAINT sys_tipo_documento_pkey PRIMARY KEY (id);


--
-- TOC entry 2846 (class 2606 OID 417663)
-- Name: sys_tipos_registros_nombre_key; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_tipos_registros
    ADD CONSTRAINT sys_tipos_registros_nombre_key UNIQUE (nombre);


--
-- TOC entry 2848 (class 2606 OID 417665)
-- Name: sys_tipos_registros_pkey; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_tipos_registros
    ADD CONSTRAINT sys_tipos_registros_pkey PRIMARY KEY (id);


--
-- TOC entry 2850 (class 2606 OID 417667)
-- Name: vehiculos_pkey; Type: CONSTRAINT; Schema: activos; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY vehiculos
    ADD CONSTRAINT vehiculos_pkey PRIMARY KEY (id);


SET search_path = public, pg_catalog;

--
-- TOC entry 2852 (class 2606 OID 417669)
-- Name: acciones_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY acciones
    ADD CONSTRAINT acciones_pkey PRIMARY KEY (id);


--
-- TOC entry 2854 (class 2606 OID 417671)
-- Name: accionistas_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY accionistas_otros
    ADD CONSTRAINT accionistas_pkey PRIMARY KEY (id);


--
-- TOC entry 2856 (class 2606 OID 417673)
-- Name: actas_constitutivas_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY actas_constitutivas
    ADD CONSTRAINT actas_constitutivas_pkey PRIMARY KEY (id);


--
-- TOC entry 2858 (class 2606 OID 417675)
-- Name: actividades_economicas_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY actividades_economicas
    ADD CONSTRAINT actividades_economicas_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 417677)
-- Name: auth_assignment_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY auth_assignment
    ADD CONSTRAINT auth_assignment_pkey PRIMARY KEY (item_name, user_id);


--
-- TOC entry 2865 (class 2606 OID 417679)
-- Name: auth_item_child_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY auth_item_child
    ADD CONSTRAINT auth_item_child_pkey PRIMARY KEY (parent, child);


--
-- TOC entry 2867 (class 2606 OID 417681)
-- Name: auth_item_group_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY auth_item_group
    ADD CONSTRAINT auth_item_group_pkey PRIMARY KEY (code);


--
-- TOC entry 2862 (class 2606 OID 417683)
-- Name: auth_item_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY auth_item
    ADD CONSTRAINT auth_item_pkey PRIMARY KEY (name);


--
-- TOC entry 2869 (class 2606 OID 417685)
-- Name: auth_rule_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY auth_rule
    ADD CONSTRAINT auth_rule_pkey PRIMARY KEY (name);


--
-- TOC entry 2871 (class 2606 OID 417687)
-- Name: bancos_contratistas_num_cuenta_key; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY bancos_contratistas
    ADD CONSTRAINT bancos_contratistas_num_cuenta_key UNIQUE (num_cuenta);


--
-- TOC entry 2873 (class 2606 OID 417689)
-- Name: bancos_contratistas_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY bancos_contratistas
    ADD CONSTRAINT bancos_contratistas_pkey PRIMARY KEY (id);


--
-- TOC entry 2881 (class 2606 OID 417691)
-- Name: capitales_efectivos_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY capitales_efectivos
    ADD CONSTRAINT capitales_efectivos_pkey PRIMARY KEY (id);


--
-- TOC entry 2883 (class 2606 OID 417693)
-- Name: capitales_mercancias_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY capitales_mercancias
    ADD CONSTRAINT capitales_mercancias_pkey PRIMARY KEY (id);


--
-- TOC entry 2877 (class 2606 OID 417695)
-- Name: capitales_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY capitales
    ADD CONSTRAINT capitales_pkey PRIMARY KEY (id);


--
-- TOC entry 2887 (class 2606 OID 417697)
-- Name: capitales_propiedades_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY capitales_propiedades
    ADD CONSTRAINT capitales_propiedades_pkey PRIMARY KEY (id);


--
-- TOC entry 2891 (class 2606 OID 417699)
-- Name: certificados_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY certificados
    ADD CONSTRAINT certificados_pkey PRIMARY KEY (id);


--
-- TOC entry 2889 (class 2606 OID 417701)
-- Name: certificiones_aportes_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY certificaciones_aportes
    ADD CONSTRAINT certificiones_aportes_pkey PRIMARY KEY (id);


--
-- TOC entry 2893 (class 2606 OID 417703)
-- Name: cierres_ejercicios_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY cierres_ejercicios
    ADD CONSTRAINT cierres_ejercicios_pkey PRIMARY KEY (id);


--
-- TOC entry 2895 (class 2606 OID 417705)
-- Name: clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);


--
-- TOC entry 2899 (class 2606 OID 417707)
-- Name: comisarios_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY comisarios_auditores
    ADD CONSTRAINT comisarios_pkey PRIMARY KEY (id);


--
-- TOC entry 2903 (class 2606 OID 417709)
-- Name: contratistas_contactos_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY contratistas_contactos
    ADD CONSTRAINT contratistas_contactos_pkey PRIMARY KEY (id);


--
-- TOC entry 2901 (class 2606 OID 417711)
-- Name: contratistas_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY contratistas
    ADD CONSTRAINT contratistas_pkey PRIMARY KEY (id);


--
-- TOC entry 2905 (class 2606 OID 417713)
-- Name: contratos_facturas_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY contratos_facturas
    ADD CONSTRAINT contratos_facturas_pkey PRIMARY KEY (id);


--
-- TOC entry 2907 (class 2606 OID 417715)
-- Name: contratos_valuaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY contratos_valuaciones
    ADD CONSTRAINT contratos_valuaciones_pkey PRIMARY KEY (id);


--
-- TOC entry 2885 (class 2606 OID 417717)
-- Name: cuentas_xpagar_accionistas_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY capitales_pagar_accionistas
    ADD CONSTRAINT cuentas_xpagar_accionistas_pkey PRIMARY KEY (id);


--
-- TOC entry 2879 (class 2606 OID 417719)
-- Name: decretos_dividiendos_acciones_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY capitales_decretos
    ADD CONSTRAINT decretos_dividiendos_acciones_pkey PRIMARY KEY (id);


--
-- TOC entry 2909 (class 2606 OID 417721)
-- Name: denominaciones_comerciales_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY denominaciones_comerciales
    ADD CONSTRAINT denominaciones_comerciales_pkey PRIMARY KEY (id);


--
-- TOC entry 2911 (class 2606 OID 417723)
-- Name: direcciones_sucursales_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY direcciones
    ADD CONSTRAINT direcciones_sucursales_pkey PRIMARY KEY (id);


--
-- TOC entry 2913 (class 2606 OID 417725)
-- Name: domicilios_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY domicilios
    ADD CONSTRAINT domicilios_pkey PRIMARY KEY (id);


--
-- TOC entry 2915 (class 2606 OID 417727)
-- Name: duraciones_emepresas_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY duraciones_empresas
    ADD CONSTRAINT duraciones_emepresas_pkey PRIMARY KEY (id);


--
-- TOC entry 2917 (class 2606 OID 417729)
-- Name: empresas_relacionadas_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY empresas_relacionadas
    ADD CONSTRAINT empresas_relacionadas_pkey PRIMARY KEY (id);


--
-- TOC entry 2919 (class 2606 OID 417731)
-- Name: estatus_contratistas_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY estatus_contratistas
    ADD CONSTRAINT estatus_contratistas_pkey PRIMARY KEY (id);


--
-- TOC entry 2921 (class 2606 OID 417733)
-- Name: fondos_reservas_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY fondos_reservas
    ADD CONSTRAINT fondos_reservas_pkey PRIMARY KEY (id);


--
-- TOC entry 2923 (class 2606 OID 417735)
-- Name: inpc_mes_anho_key; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_inpc
    ADD CONSTRAINT inpc_mes_anho_key UNIQUE (mes, anho);


--
-- TOC entry 2925 (class 2606 OID 417737)
-- Name: inpc_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_inpc
    ADD CONSTRAINT inpc_pkey PRIMARY KEY (id);


--
-- TOC entry 2927 (class 2606 OID 417739)
-- Name: migration_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY migration
    ADD CONSTRAINT migration_pkey PRIMARY KEY (version);


--
-- TOC entry 2929 (class 2606 OID 417741)
-- Name: naturales_juridicas_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_naturales_juridicas
    ADD CONSTRAINT naturales_juridicas_pkey PRIMARY KEY (id);


--
-- TOC entry 2931 (class 2606 OID 417743)
-- Name: naturales_juridicas_rif_key; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_naturales_juridicas
    ADD CONSTRAINT naturales_juridicas_rif_key UNIQUE (rif);


--
-- TOC entry 2933 (class 2606 OID 417745)
-- Name: nombres_cajas_nombre_contratistas_id_key; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY nombres_cajas
    ADD CONSTRAINT nombres_cajas_nombre_contratistas_id_key UNIQUE (nombre, contratistas_id);


--
-- TOC entry 2935 (class 2606 OID 417747)
-- Name: nombres_cajas_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY nombres_cajas
    ADD CONSTRAINT nombres_cajas_pkey PRIMARY KEY (id);


--
-- TOC entry 2939 (class 2606 OID 417749)
-- Name: notas_revelatorias_cuentas_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY notas_revelatorias_cuentas
    ADD CONSTRAINT notas_revelatorias_cuentas_pkey PRIMARY KEY (id);


--
-- TOC entry 2937 (class 2606 OID 417751)
-- Name: notas_revelatorias_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY notas_revelatorias
    ADD CONSTRAINT notas_revelatorias_pkey PRIMARY KEY (id);


--
-- TOC entry 2941 (class 2606 OID 417753)
-- Name: objetos_autorizaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY objetos_autorizaciones
    ADD CONSTRAINT objetos_autorizaciones_pkey PRIMARY KEY (id);


--
-- TOC entry 2943 (class 2606 OID 417755)
-- Name: objetos_empresas_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY objetos_empresas
    ADD CONSTRAINT objetos_empresas_pkey PRIMARY KEY (id);


--
-- TOC entry 2945 (class 2606 OID 417757)
-- Name: objetos_sociales_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY objetos_sociales
    ADD CONSTRAINT objetos_sociales_pkey PRIMARY KEY (id);


--
-- TOC entry 2947 (class 2606 OID 417759)
-- Name: personas_juridicas_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY personas_juridicas
    ADD CONSTRAINT personas_juridicas_pkey PRIMARY KEY (id);


--
-- TOC entry 2949 (class 2606 OID 417761)
-- Name: personas_juridicas_rif_key; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY personas_juridicas
    ADD CONSTRAINT personas_juridicas_rif_key UNIQUE (rif);


--
-- TOC entry 2951 (class 2606 OID 417763)
-- Name: personas_naturales_ci_key; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY personas_naturales
    ADD CONSTRAINT personas_naturales_ci_key UNIQUE (ci);


--
-- TOC entry 2953 (class 2606 OID 417765)
-- Name: personas_naturales_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY personas_naturales
    ADD CONSTRAINT personas_naturales_pkey PRIMARY KEY (id);


--
-- TOC entry 2955 (class 2606 OID 417767)
-- Name: personas_naturales_rif_key; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY personas_naturales
    ADD CONSTRAINT personas_naturales_rif_key UNIQUE (rif);


--
-- TOC entry 2957 (class 2606 OID 417769)
-- Name: polizas_contratadas_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY polizas_contratadas
    ADD CONSTRAINT polizas_contratadas_pkey PRIMARY KEY (id);


--
-- TOC entry 2959 (class 2606 OID 417771)
-- Name: principios_contables_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY principios_contables
    ADD CONSTRAINT principios_contables_pkey PRIMARY KEY (id);


--
-- TOC entry 2961 (class 2606 OID 417773)
-- Name: razon_social_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY razones_sociales
    ADD CONSTRAINT razon_social_pkey PRIMARY KEY (id);


--
-- TOC entry 2963 (class 2606 OID 417775)
-- Name: relaciones_contratos_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY relaciones_contratos
    ADD CONSTRAINT relaciones_contratos_pkey PRIMARY KEY (id);


--
-- TOC entry 2965 (class 2606 OID 418501)
-- Name: sucursales_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sucursales
    ADD CONSTRAINT sucursales_pkey PRIMARY KEY (id);


--
-- TOC entry 2967 (class 2606 OID 417779)
-- Name: suplementarios_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY suplementarios
    ADD CONSTRAINT suplementarios_pkey PRIMARY KEY (id);


--
-- TOC entry 2969 (class 2606 OID 417781)
-- Name: sys_bancos_codigo_sudeban_key; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_bancos
    ADD CONSTRAINT sys_bancos_codigo_sudeban_key UNIQUE (codigo_sudeban);


--
-- TOC entry 2971 (class 2606 OID 417783)
-- Name: sys_bancos_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_bancos
    ADD CONSTRAINT sys_bancos_pkey PRIMARY KEY (id);


--
-- TOC entry 2973 (class 2606 OID 417785)
-- Name: sys_bancos_rif_key; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_bancos
    ADD CONSTRAINT sys_bancos_rif_key UNIQUE (rif);


--
-- TOC entry 2975 (class 2606 OID 417787)
-- Name: sys_caev_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_caev
    ADD CONSTRAINT sys_caev_pkey PRIMARY KEY (id);


--
-- TOC entry 2977 (class 2606 OID 417789)
-- Name: sys_ciudades_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_ciudades
    ADD CONSTRAINT sys_ciudades_pkey PRIMARY KEY (id);


--
-- TOC entry 2979 (class 2606 OID 417791)
-- Name: sys_ciudades_sys_estado_id_nombre_key; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_ciudades
    ADD CONSTRAINT sys_ciudades_sys_estado_id_nombre_key UNIQUE (sys_estado_id, nombre);


--
-- TOC entry 2981 (class 2606 OID 417793)
-- Name: sys_cuentas_nombre_key; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_cuentas
    ADD CONSTRAINT sys_cuentas_nombre_key UNIQUE (nombre);


--
-- TOC entry 2983 (class 2606 OID 417795)
-- Name: sys_cuentas_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_cuentas
    ADD CONSTRAINT sys_cuentas_pkey PRIMARY KEY (id);


--
-- TOC entry 2985 (class 2606 OID 417797)
-- Name: sys_denominaciones_comerciales_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_denominaciones_comerciales
    ADD CONSTRAINT sys_denominaciones_comerciales_pkey PRIMARY KEY (id);


--
-- TOC entry 2991 (class 2606 OID 417799)
-- Name: sys_estados_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_estados
    ADD CONSTRAINT sys_estados_pkey PRIMARY KEY (id);


--
-- TOC entry 2987 (class 2606 OID 417801)
-- Name: sys_monedas_nombre_key; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_divisas
    ADD CONSTRAINT sys_monedas_nombre_key UNIQUE (nombre);


--
-- TOC entry 2989 (class 2606 OID 417803)
-- Name: sys_monedas_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_divisas
    ADD CONSTRAINT sys_monedas_pkey PRIMARY KEY (id);


--
-- TOC entry 2993 (class 2606 OID 417805)
-- Name: sys_municipios_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_municipios
    ADD CONSTRAINT sys_municipios_pkey PRIMARY KEY (id);


--
-- TOC entry 2995 (class 2606 OID 417807)
-- Name: sys_paises_nombre_key; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_paises
    ADD CONSTRAINT sys_paises_nombre_key UNIQUE (nombre);


--
-- TOC entry 2997 (class 2606 OID 417809)
-- Name: sys_paises_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_paises
    ADD CONSTRAINT sys_paises_pkey PRIMARY KEY (id);


--
-- TOC entry 2999 (class 2606 OID 417811)
-- Name: sys_parroquias_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_parroquias
    ADD CONSTRAINT sys_parroquias_pkey PRIMARY KEY (id);


--
-- TOC entry 3001 (class 2606 OID 417813)
-- Name: sys_subdenominaciones_comerciales_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_subdenominaciones_comerciales
    ADD CONSTRAINT sys_subdenominaciones_comerciales_pkey PRIMARY KEY (id);


--
-- TOC entry 3003 (class 2606 OID 417815)
-- Name: sys_tasas_divisas_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_tasas_divisas
    ADD CONSTRAINT sys_tasas_divisas_pkey PRIMARY KEY (id);


--
-- TOC entry 3005 (class 2606 OID 417817)
-- Name: sys_tasas_divisas_sys_divisa_id_tasa_key; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY sys_tasas_divisas
    ADD CONSTRAINT sys_tasas_divisas_sys_divisa_id_tasa_key UNIQUE (sys_divisa_id, tasa);


--
-- TOC entry 3007 (class 2606 OID 417819)
-- Name: user_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 3009 (class 2606 OID 417821)
-- Name: user_visit_log_pkey; Type: CONSTRAINT; Schema: public; Owner: eureka; Tablespace: 
--

ALTER TABLE ONLY user_visit_log
    ADD CONSTRAINT user_visit_log_pkey PRIMARY KEY (id);


SET search_path = activos, pg_catalog;

--
-- TOC entry 2808 (class 1259 OID 417822)
-- Name: fki_bienes_facturas; Type: INDEX; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE INDEX fki_bienes_facturas ON facturas USING btree (bien_id);


--
-- TOC entry 2815 (class 1259 OID 417823)
-- Name: fki_bienes_mejoras; Type: INDEX; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE INDEX fki_bienes_mejoras ON mejoras_propiedades USING btree (bien_id);


--
-- TOC entry 2836 (class 1259 OID 417824)
-- Name: fki_clasificacion_bien_tipos_bienes; Type: INDEX; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE INDEX fki_clasificacion_bien_tipos_bienes ON sys_tipos_bienes USING btree (sys_clasificacion_bien_id);


--
-- TOC entry 2792 (class 1259 OID 417825)
-- Name: fki_pais_datos_importacion; Type: INDEX; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE INDEX fki_pais_datos_importacion ON datos_importaciones USING btree (pais_origen_id);


--
-- TOC entry 2801 (class 1259 OID 417826)
-- Name: fki_tipos_registros_registrados; Type: INDEX; Schema: activos; Owner: eureka; Tablespace: 
--

CREATE INDEX fki_tipos_registros_registrados ON documentos_registrados USING btree (sys_tipo_registro_id);


SET search_path = public, pg_catalog;

--
-- TOC entry 2874 (class 1259 OID 417827)
-- Name: fki_bancos_contratistas; Type: INDEX; Schema: public; Owner: eureka; Tablespace: 
--

CREATE INDEX fki_bancos_contratistas ON bancos_contratistas USING btree (contratista_id);


--
-- TOC entry 2896 (class 1259 OID 417828)
-- Name: fki_contratista_clientes; Type: INDEX; Schema: public; Owner: eureka; Tablespace: 
--

CREATE INDEX fki_contratista_clientes ON clientes USING btree (contratista_id);


--
-- TOC entry 2875 (class 1259 OID 417829)
-- Name: fki_sys_bancos_contratistas; Type: INDEX; Schema: public; Owner: eureka; Tablespace: 
--

CREATE INDEX fki_sys_bancos_contratistas ON bancos_contratistas USING btree (banco_id);


--
-- TOC entry 2897 (class 1259 OID 417830)
-- Name: fki_sys_naturales_juridicos; Type: INDEX; Schema: public; Owner: eureka; Tablespace: 
--

CREATE INDEX fki_sys_naturales_juridicos ON clientes USING btree (natural_juridico_id);


--
-- TOC entry 2863 (class 1259 OID 417831)
-- Name: idx-auth_item-type; Type: INDEX; Schema: public; Owner: eureka; Tablespace: 
--

CREATE INDEX "idx-auth_item-type" ON auth_item USING btree (type);


SET search_path = activos, pg_catalog;

--
-- TOC entry 3010 (class 2606 OID 417832)
-- Name: activos_biologicos_bien_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY activos_biologicos
    ADD CONSTRAINT activos_biologicos_bien_id_fkey FOREIGN KEY (bien_id) REFERENCES bienes(id);


--
-- TOC entry 3011 (class 2606 OID 417837)
-- Name: activos_intangibles_bien_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY activos_intangibles
    ADD CONSTRAINT activos_intangibles_bien_id_fkey FOREIGN KEY (bien_id) REFERENCES bienes(id);


--
-- TOC entry 3012 (class 2606 OID 417842)
-- Name: avaluos_bien_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY avaluos
    ADD CONSTRAINT avaluos_bien_id_fkey FOREIGN KEY (bien_id) REFERENCES bienes(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3013 (class 2606 OID 417847)
-- Name: avaluos_gremio_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY avaluos
    ADD CONSTRAINT avaluos_gremio_id_fkey FOREIGN KEY (gremio_id) REFERENCES sys_gremios(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3014 (class 2606 OID 417852)
-- Name: avaluos_perito_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY avaluos
    ADD CONSTRAINT avaluos_perito_id_fkey FOREIGN KEY (perito_id) REFERENCES public.personas_naturales(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3015 (class 2606 OID 417857)
-- Name: bienes_contratista_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY bienes
    ADD CONSTRAINT bienes_contratista_id_fkey FOREIGN KEY (contratista_id) REFERENCES public.contratistas(id);


--
-- TOC entry 3016 (class 2606 OID 417862)
-- Name: bienes_principio_contable_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY bienes
    ADD CONSTRAINT bienes_principio_contable_fkey FOREIGN KEY (principio_contable) REFERENCES sys_formas_org(id);


--
-- TOC entry 3017 (class 2606 OID 417867)
-- Name: construcciones_inmuebles_bien_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY construcciones_inmuebles
    ADD CONSTRAINT construcciones_inmuebles_bien_id_fkey FOREIGN KEY (bien_id) REFERENCES bienes(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3018 (class 2606 OID 417872)
-- Name: datos_importacion_bien_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY datos_importaciones
    ADD CONSTRAINT datos_importacion_bien_id_fkey FOREIGN KEY (bien_id) REFERENCES bienes(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3019 (class 2606 OID 417877)
-- Name: datos_importacion_sys_moneda_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY datos_importaciones
    ADD CONSTRAINT datos_importacion_sys_moneda_id_fkey FOREIGN KEY (sys_divisa_id) REFERENCES public.sys_divisas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3020 (class 2606 OID 417882)
-- Name: datos_importacion_sys_pais_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY datos_importaciones
    ADD CONSTRAINT datos_importacion_sys_pais_id_fkey FOREIGN KEY (pais_origen_id) REFERENCES public.sys_paises(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3021 (class 2606 OID 417887)
-- Name: depresiaciones_amortizaciones_bien_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY depreciaciones_amortizaciones
    ADD CONSTRAINT depresiaciones_amortizaciones_bien_id_fkey FOREIGN KEY (bien_id) REFERENCES bienes(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3022 (class 2606 OID 417892)
-- Name: desincorporacion_activos_sys_motivo_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY desincorporacion_activos
    ADD CONSTRAINT desincorporacion_activos_sys_motivo_id_fkey FOREIGN KEY (sys_motivo_id) REFERENCES sys_motivos(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3023 (class 2606 OID 417897)
-- Name: deterioros_bien_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY deterioros
    ADD CONSTRAINT deterioros_bien_id_fkey FOREIGN KEY (bien_id) REFERENCES bienes(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3024 (class 2606 OID 417902)
-- Name: documentos_registrados_contratista_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY documentos_registrados
    ADD CONSTRAINT documentos_registrados_contratista_id_fkey FOREIGN KEY (contratista_id) REFERENCES public.contratistas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3025 (class 2606 OID 417907)
-- Name: documentos_registrados_sys_tipo_documento_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY documentos_registrados
    ADD CONSTRAINT documentos_registrados_sys_tipo_documento_id_fkey FOREIGN KEY (sys_tipo_documento_id) REFERENCES sys_tipos_documentos(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3027 (class 2606 OID 417912)
-- Name: fabricaciones_muebles_bien_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY fabricaciones_muebles
    ADD CONSTRAINT fabricaciones_muebles_bien_id_fkey FOREIGN KEY (bien_id) REFERENCES bienes(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3028 (class 2606 OID 417917)
-- Name: facturas_comprador_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY facturas
    ADD CONSTRAINT facturas_comprador_id_fkey FOREIGN KEY (comprador_id) REFERENCES public.personas_juridicas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3029 (class 2606 OID 417922)
-- Name: facturas_contratista_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY facturas
    ADD CONSTRAINT facturas_contratista_id_fkey FOREIGN KEY (contratista_id) REFERENCES public.personas_juridicas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3030 (class 2606 OID 417927)
-- Name: facturas_imprenta_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY facturas
    ADD CONSTRAINT facturas_imprenta_id_fkey FOREIGN KEY (imprenta_id) REFERENCES public.personas_juridicas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3031 (class 2606 OID 417932)
-- Name: facturas_proveedor_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY facturas
    ADD CONSTRAINT facturas_proveedor_id_fkey FOREIGN KEY (proveedor_id) REFERENCES public.personas_juridicas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3032 (class 2606 OID 417937)
-- Name: fk_bienes_facturas; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY facturas
    ADD CONSTRAINT fk_bienes_facturas FOREIGN KEY (bien_id) REFERENCES bienes(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3037 (class 2606 OID 417942)
-- Name: fk_bienes_mejoras; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY mejoras_propiedades
    ADD CONSTRAINT fk_bienes_mejoras FOREIGN KEY (bien_id) REFERENCES bienes(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3042 (class 2606 OID 417947)
-- Name: fk_clasificacion_bien_tipos_bienes; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY sys_tipos_bienes
    ADD CONSTRAINT fk_clasificacion_bien_tipos_bienes FOREIGN KEY (sys_clasificacion_bien_id) REFERENCES sys_clasificaciones_bienes(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3026 (class 2606 OID 417952)
-- Name: fk_tipos_registros_registrados; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY documentos_registrados
    ADD CONSTRAINT fk_tipos_registros_registrados FOREIGN KEY (sys_tipo_registro_id) REFERENCES sys_tipos_registros(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3033 (class 2606 OID 417957)
-- Name: inmuebles_bien_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY inmuebles
    ADD CONSTRAINT inmuebles_bien_id_fkey FOREIGN KEY (bien_id) REFERENCES bienes(id);


--
-- TOC entry 3034 (class 2606 OID 417962)
-- Name: licencia_activos_intangibles_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY licencias
    ADD CONSTRAINT licencia_activos_intangibles_id_fkey FOREIGN KEY (activo_intangible_id) REFERENCES activos_intangibles(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3035 (class 2606 OID 417967)
-- Name: medicion_bien_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY mediciones
    ADD CONSTRAINT medicion_bien_id_fkey FOREIGN KEY (bien_id) REFERENCES bienes(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3036 (class 2606 OID 417972)
-- Name: medicion_sys_metodo_medicion_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY mediciones
    ADD CONSTRAINT medicion_sys_metodo_medicion_id_fkey FOREIGN KEY (sys_metodo_medicion_id) REFERENCES sys_metodos_medicion(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3038 (class 2606 OID 417977)
-- Name: mejoras_propiedad_principio_contable_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY mejoras_propiedades
    ADD CONSTRAINT mejoras_propiedad_principio_contable_id_fkey FOREIGN KEY (principio_contable_id) REFERENCES sys_formas_org(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3039 (class 2606 OID 417982)
-- Name: mejoras_propiedad_sys_tipo_bien_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY mejoras_propiedades
    ADD CONSTRAINT mejoras_propiedad_sys_tipo_bien_id_fkey FOREIGN KEY (sys_tipo_bien_id) REFERENCES sys_tipos_bienes(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3040 (class 2606 OID 417987)
-- Name: muebles_bien_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY muebles
    ADD CONSTRAINT muebles_bien_id_fkey FOREIGN KEY (bien_id) REFERENCES bienes(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3041 (class 2606 OID 417992)
-- Name: sys_gremios_persona_juridica_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY sys_gremios
    ADD CONSTRAINT sys_gremios_persona_juridica_id_fkey FOREIGN KEY (persona_juridica_id) REFERENCES public.personas_juridicas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3043 (class 2606 OID 417997)
-- Name: vehiculos_mueble_id_fkey; Type: FK CONSTRAINT; Schema: activos; Owner: eureka
--

ALTER TABLE ONLY vehiculos
    ADD CONSTRAINT vehiculos_mueble_id_fkey FOREIGN KEY (mueble_id) REFERENCES muebles(id) ON UPDATE CASCADE ON DELETE CASCADE;


SET search_path = public, pg_catalog;

--
-- TOC entry 3044 (class 2606 OID 418002)
-- Name: acciones_capital_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY acciones
    ADD CONSTRAINT acciones_capital_id_fkey FOREIGN KEY (capital_id) REFERENCES capitales(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3045 (class 2606 OID 418007)
-- Name: accionistas_contratista_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY accionistas_otros
    ADD CONSTRAINT accionistas_contratista_id_fkey FOREIGN KEY (contratista_id) REFERENCES contratistas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3046 (class 2606 OID 418012)
-- Name: accionistas_natural_juridica_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY accionistas_otros
    ADD CONSTRAINT accionistas_natural_juridica_id_fkey FOREIGN KEY (natural_juridica_id) REFERENCES sys_naturales_juridicas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3047 (class 2606 OID 418017)
-- Name: accionistas_otros_documento_registrado_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY accionistas_otros
    ADD CONSTRAINT accionistas_otros_documento_registrado_id_fkey FOREIGN KEY (documento_registrado_id) REFERENCES activos.documentos_registrados(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3048 (class 2606 OID 418022)
-- Name: actas_constitutivas_contratista_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY actas_constitutivas
    ADD CONSTRAINT actas_constitutivas_contratista_id_fkey FOREIGN KEY (contratista_id) REFERENCES contratistas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3049 (class 2606 OID 418027)
-- Name: actas_constitutivas_documento_registrado_id; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY actas_constitutivas
    ADD CONSTRAINT actas_constitutivas_documento_registrado_id FOREIGN KEY (documento_registrado_id) REFERENCES activos.documentos_registrados(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3050 (class 2606 OID 418032)
-- Name: actas_constitutivas_duracion_empresa_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY actas_constitutivas
    ADD CONSTRAINT actas_constitutivas_duracion_empresa_id_fkey FOREIGN KEY (duracion_empresa_id) REFERENCES duraciones_empresas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3051 (class 2606 OID 418037)
-- Name: actas_contitutivas_accionista_otro_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY actas_constitutivas
    ADD CONSTRAINT actas_contitutivas_accionista_otro_id_fkey FOREIGN KEY (accionista_otro) REFERENCES accionistas_otros(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3052 (class 2606 OID 418042)
-- Name: actas_contitutivas_capital_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY actas_constitutivas
    ADD CONSTRAINT actas_contitutivas_capital_id_fkey FOREIGN KEY (capital_id) REFERENCES capitales(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3053 (class 2606 OID 418047)
-- Name: actas_contitutivas_cierre_ejercicio_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY actas_constitutivas
    ADD CONSTRAINT actas_contitutivas_cierre_ejercicio_id_fkey FOREIGN KEY (cierre_ejercicio_id) REFERENCES cierres_ejercicios(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3054 (class 2606 OID 418052)
-- Name: actas_contitutivas_comisario_auditor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY actas_constitutivas
    ADD CONSTRAINT actas_contitutivas_comisario_auditor_id_fkey FOREIGN KEY (comisario_auditor_id) REFERENCES comisarios_auditores(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3055 (class 2606 OID 418057)
-- Name: actas_contitutivas_denominacion_comercial_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY actas_constitutivas
    ADD CONSTRAINT actas_contitutivas_denominacion_comercial_id_fkey FOREIGN KEY (denominacion_comercial_id) REFERENCES denominaciones_comerciales(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3056 (class 2606 OID 418062)
-- Name: actas_contitutivas_domicilio_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY actas_constitutivas
    ADD CONSTRAINT actas_contitutivas_domicilio_id_fkey FOREIGN KEY (domicilio_id) REFERENCES domicilios(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3057 (class 2606 OID 418067)
-- Name: actas_contitutivas_objeto_social_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY actas_constitutivas
    ADD CONSTRAINT actas_contitutivas_objeto_social_id_fkey FOREIGN KEY (objeto_social_id) REFERENCES objetos_sociales(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3058 (class 2606 OID 418072)
-- Name: actas_contitutivas_razon_social_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY actas_constitutivas
    ADD CONSTRAINT actas_contitutivas_razon_social_id_fkey FOREIGN KEY (razon_social_id) REFERENCES razones_sociales(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3059 (class 2606 OID 418077)
-- Name: actividades_economicas_comp1_caev_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY actividades_economicas
    ADD CONSTRAINT actividades_economicas_comp1_caev_id_fkey FOREIGN KEY (comp1_caev_id) REFERENCES sys_caev(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3060 (class 2606 OID 418082)
-- Name: actividades_economicas_comp2_caev_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY actividades_economicas
    ADD CONSTRAINT actividades_economicas_comp2_caev_id_fkey FOREIGN KEY (comp2_caev_id) REFERENCES sys_caev(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3061 (class 2606 OID 418087)
-- Name: actividades_economicas_contratista_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY actividades_economicas
    ADD CONSTRAINT actividades_economicas_contratista_id_fkey FOREIGN KEY (contratista_id) REFERENCES contratistas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3062 (class 2606 OID 418092)
-- Name: actividades_economicas_ppal_caev_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY actividades_economicas
    ADD CONSTRAINT actividades_economicas_ppal_caev_id_fkey FOREIGN KEY (ppal_caev_id) REFERENCES sys_caev(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3063 (class 2606 OID 418097)
-- Name: auth_assignment_item_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY auth_assignment
    ADD CONSTRAINT auth_assignment_item_name_fkey FOREIGN KEY (item_name) REFERENCES auth_item(name) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3064 (class 2606 OID 418102)
-- Name: auth_assignment_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY auth_assignment
    ADD CONSTRAINT auth_assignment_user_id_fkey FOREIGN KEY (user_id) REFERENCES "user"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3067 (class 2606 OID 418107)
-- Name: auth_item_child_child_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY auth_item_child
    ADD CONSTRAINT auth_item_child_child_fkey FOREIGN KEY (child) REFERENCES auth_item(name) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3068 (class 2606 OID 418112)
-- Name: auth_item_child_parent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY auth_item_child
    ADD CONSTRAINT auth_item_child_parent_fkey FOREIGN KEY (parent) REFERENCES auth_item(name) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3065 (class 2606 OID 418117)
-- Name: auth_item_rule_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY auth_item
    ADD CONSTRAINT auth_item_rule_name_fkey FOREIGN KEY (rule_name) REFERENCES auth_rule(name) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3071 (class 2606 OID 418122)
-- Name: capitales_contratista_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY capitales
    ADD CONSTRAINT capitales_contratista_id_fkey FOREIGN KEY (contratista_id) REFERENCES contratistas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3073 (class 2606 OID 418127)
-- Name: capitales_decretos_capital_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY capitales_decretos
    ADD CONSTRAINT capitales_decretos_capital_id_fkey FOREIGN KEY (capital_id) REFERENCES capitales(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3072 (class 2606 OID 418132)
-- Name: capitales_documento_registrado_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY capitales
    ADD CONSTRAINT capitales_documento_registrado_id_fkey FOREIGN KEY (documento_registrado_id) REFERENCES activos.documentos_registrados(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3074 (class 2606 OID 418137)
-- Name: capitales_efectivos_capital_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY capitales_efectivos
    ADD CONSTRAINT capitales_efectivos_capital_id_fkey FOREIGN KEY (cuenta_contratista_id) REFERENCES capitales(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3075 (class 2606 OID 418142)
-- Name: capitales_efectivos_sys_banco_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY capitales_efectivos
    ADD CONSTRAINT capitales_efectivos_sys_banco_id_fkey FOREIGN KEY (sys_banco_id) REFERENCES sys_bancos(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3077 (class 2606 OID 418147)
-- Name: capitales_pagar_accionistas_capital_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY capitales_pagar_accionistas
    ADD CONSTRAINT capitales_pagar_accionistas_capital_id_fkey FOREIGN KEY (capital_id) REFERENCES capitales(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3078 (class 2606 OID 418152)
-- Name: capitales_propiedades_capitales_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY capitales_propiedades
    ADD CONSTRAINT capitales_propiedades_capitales_id_fkey FOREIGN KEY (capital_id) REFERENCES capitales(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3079 (class 2606 OID 418157)
-- Name: capitles_propiedades_documento_registrado_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY capitales_propiedades
    ADD CONSTRAINT capitles_propiedades_documento_registrado_id_fkey FOREIGN KEY (documento_registrado_id) REFERENCES activos.documentos_registrados(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3081 (class 2606 OID 418162)
-- Name: certificados_capital_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY certificados
    ADD CONSTRAINT certificados_capital_id_fkey FOREIGN KEY (capital_id) REFERENCES capitales(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3080 (class 2606 OID 418167)
-- Name: certificiones_aportes_capital_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY certificaciones_aportes
    ADD CONSTRAINT certificiones_aportes_capital_id_fkey FOREIGN KEY (capital_id) REFERENCES capitales(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3082 (class 2606 OID 418172)
-- Name: cierres_ejercicios_contratista_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY cierres_ejercicios
    ADD CONSTRAINT cierres_ejercicios_contratista_id_fkey FOREIGN KEY (contratista_id) REFERENCES contratistas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3083 (class 2606 OID 418177)
-- Name: cierres_ejercicios_documento_registrado_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY cierres_ejercicios
    ADD CONSTRAINT cierres_ejercicios_documento_registrado_id_fkey FOREIGN KEY (documento_registrado_id) REFERENCES activos.documentos_registrados(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3086 (class 2606 OID 418182)
-- Name: comisarios_contratista_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY comisarios_auditores
    ADD CONSTRAINT comisarios_contratista_id_fkey FOREIGN KEY (contratista_id) REFERENCES contratistas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3087 (class 2606 OID 418187)
-- Name: comisarios_documento_registrado_id; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY comisarios_auditores
    ADD CONSTRAINT comisarios_documento_registrado_id FOREIGN KEY (documento_registrado_id) REFERENCES activos.documentos_registrados(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3090 (class 2606 OID 418192)
-- Name: contratistas_contactos_contacto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY contratistas_contactos
    ADD CONSTRAINT contratistas_contactos_contacto_id_fkey FOREIGN KEY (contacto_id) REFERENCES personas_naturales(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3091 (class 2606 OID 418197)
-- Name: contratistas_contactos_contratista_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY contratistas_contactos
    ADD CONSTRAINT contratistas_contactos_contratista_id_fkey FOREIGN KEY (contratista_id) REFERENCES contratistas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3088 (class 2606 OID 418202)
-- Name: contratistas_estatus_contratista_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY contratistas
    ADD CONSTRAINT contratistas_estatus_contratista_id_fkey FOREIGN KEY (estatus_contratista_id) REFERENCES estatus_contratistas(id);


--
-- TOC entry 3089 (class 2606 OID 418207)
-- Name: contratistas_natural_juridica_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY contratistas
    ADD CONSTRAINT contratistas_natural_juridica_id_fkey FOREIGN KEY (natural_juridica_id) REFERENCES sys_naturales_juridicas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3098 (class 2606 OID 418212)
-- Name: contratistas_natural_sys_estado_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY direcciones
    ADD CONSTRAINT contratistas_natural_sys_estado_id_fkey FOREIGN KEY (sys_estado_id) REFERENCES sys_estados(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3099 (class 2606 OID 418217)
-- Name: contratistas_natural_sys_municipio_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY direcciones
    ADD CONSTRAINT contratistas_natural_sys_municipio_id_fkey FOREIGN KEY (sys_municipio_id) REFERENCES sys_municipios(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3100 (class 2606 OID 418222)
-- Name: contratistas_natural_sys_parroquia_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY direcciones
    ADD CONSTRAINT contratistas_natural_sys_parroquia_id_fkey FOREIGN KEY (sys_parroquia_id) REFERENCES sys_parroquias(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3092 (class 2606 OID 418227)
-- Name: contratos_facturas_relacion_contrato_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY contratos_facturas
    ADD CONSTRAINT contratos_facturas_relacion_contrato_id_fkey FOREIGN KEY (relacion_contrato_id) REFERENCES relaciones_contratos(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3093 (class 2606 OID 418232)
-- Name: contratos_valuaciones_relacion_contrato_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY contratos_valuaciones
    ADD CONSTRAINT contratos_valuaciones_relacion_contrato_id_fkey FOREIGN KEY (relacion_contrato_id) REFERENCES relaciones_contratos(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3130 (class 2606 OID 418237)
-- Name: csuplementarios_capital_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY suplementarios
    ADD CONSTRAINT csuplementarios_capital_id_fkey FOREIGN KEY (capital_id) REFERENCES capitales(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3094 (class 2606 OID 418242)
-- Name: denominaciones_comerciales_contratista_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY denominaciones_comerciales
    ADD CONSTRAINT denominaciones_comerciales_contratista_id_fkey FOREIGN KEY (contratista_id) REFERENCES contratistas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3095 (class 2606 OID 418247)
-- Name: denominaciones_comerciales_denominacion_comercial_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY denominaciones_comerciales
    ADD CONSTRAINT denominaciones_comerciales_denominacion_comercial_id_fkey FOREIGN KEY (sys_denominacion_comercial_id) REFERENCES sys_denominaciones_comerciales(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3096 (class 2606 OID 418252)
-- Name: denominaciones_comerciales_documento_registrado_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY denominaciones_comerciales
    ADD CONSTRAINT denominaciones_comerciales_documento_registrado_id_fkey FOREIGN KEY (documento_registrado_id) REFERENCES activos.documentos_registrados(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3097 (class 2606 OID 418257)
-- Name: denominaciones_comerciales_subdenominacion_comercial_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY denominaciones_comerciales
    ADD CONSTRAINT denominaciones_comerciales_subdenominacion_comercial_id_fkey FOREIGN KEY (sys_subdenominacion_comercial_id) REFERENCES sys_subdenominaciones_comerciales(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3101 (class 2606 OID 418262)
-- Name: domicilios_contratista_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY domicilios
    ADD CONSTRAINT domicilios_contratista_id_fkey FOREIGN KEY (contratista_id) REFERENCES contratistas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3102 (class 2606 OID 418282)
-- Name: duraciones_emepresas_contratista_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY duraciones_empresas
    ADD CONSTRAINT duraciones_emepresas_contratista_id_fkey FOREIGN KEY (contratista_id) REFERENCES contratistas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3103 (class 2606 OID 418287)
-- Name: duraciones_emepresas_documento_registrado_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY duraciones_empresas
    ADD CONSTRAINT duraciones_emepresas_documento_registrado_id_fkey FOREIGN KEY (documento_registrado_id) REFERENCES activos.documentos_registrados(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3104 (class 2606 OID 418292)
-- Name: empresas_relacionadas_persona_contacto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY empresas_relacionadas
    ADD CONSTRAINT empresas_relacionadas_persona_contacto_id_fkey FOREIGN KEY (persona_contacto_id) REFERENCES personas_naturales(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3105 (class 2606 OID 418297)
-- Name: empresas_relacionadas_persona_juridica_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY empresas_relacionadas
    ADD CONSTRAINT empresas_relacionadas_persona_juridica_id_fkey FOREIGN KEY (persona_juridica_id) REFERENCES personas_juridicas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3066 (class 2606 OID 418302)
-- Name: fk_auth_item_group_code; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY auth_item
    ADD CONSTRAINT fk_auth_item_group_code FOREIGN KEY (group_code) REFERENCES auth_item_group(code) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3069 (class 2606 OID 418307)
-- Name: fk_bancos_contratistas; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY bancos_contratistas
    ADD CONSTRAINT fk_bancos_contratistas FOREIGN KEY (contratista_id) REFERENCES contratistas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3084 (class 2606 OID 418312)
-- Name: fk_contratista_clientes; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY clientes
    ADD CONSTRAINT fk_contratista_clientes FOREIGN KEY (contratista_id) REFERENCES contratistas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3070 (class 2606 OID 418317)
-- Name: fk_sys_bancos_contratistas; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY bancos_contratistas
    ADD CONSTRAINT fk_sys_bancos_contratistas FOREIGN KEY (banco_id) REFERENCES sys_bancos(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3085 (class 2606 OID 418322)
-- Name: fk_sys_naturales_juridicos; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY clientes
    ADD CONSTRAINT fk_sys_naturales_juridicos FOREIGN KEY (natural_juridico_id) REFERENCES sys_naturales_juridicas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3106 (class 2606 OID 418327)
-- Name: fondos_reservas_acta_constitutiva_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY fondos_reservas
    ADD CONSTRAINT fondos_reservas_acta_constitutiva_id_fkey FOREIGN KEY (acta_constitutiva_id) REFERENCES actas_constitutivas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3076 (class 2606 OID 418332)
-- Name: inventarios_mercancias_capial_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY capitales_mercancias
    ADD CONSTRAINT inventarios_mercancias_capial_id_fkey FOREIGN KEY (capital_id) REFERENCES capitales(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3107 (class 2606 OID 418337)
-- Name: nombres_cajas_contratistas_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY nombres_cajas
    ADD CONSTRAINT nombres_cajas_contratistas_id_fkey FOREIGN KEY (contratistas_id) REFERENCES contratistas(id);


--
-- TOC entry 3108 (class 2606 OID 418342)
-- Name: notas_revelatorias_contratista_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY notas_revelatorias
    ADD CONSTRAINT notas_revelatorias_contratista_id_fkey FOREIGN KEY (contratista_id) REFERENCES contratistas(id);


--
-- TOC entry 3109 (class 2606 OID 418347)
-- Name: notas_revelatorias_cuentas_nota_revelatoria_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY notas_revelatorias_cuentas
    ADD CONSTRAINT notas_revelatorias_cuentas_nota_revelatoria_id_fkey FOREIGN KEY (nota_revelatoria_id) REFERENCES notas_revelatorias(id);


--
-- TOC entry 3110 (class 2606 OID 418352)
-- Name: notas_revelatorias_cuentas_sys_cuenta_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY notas_revelatorias_cuentas
    ADD CONSTRAINT notas_revelatorias_cuentas_sys_cuenta_id_fkey FOREIGN KEY (sys_cuenta_id) REFERENCES sys_cuentas(id);


--
-- TOC entry 3111 (class 2606 OID 418357)
-- Name: objetos_autorizaciones_domicilio_fabricante_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY objetos_autorizaciones
    ADD CONSTRAINT objetos_autorizaciones_domicilio_fabricante_id_fkey FOREIGN KEY (domicilio_fabricante_id) REFERENCES sys_paises(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3112 (class 2606 OID 418362)
-- Name: objetos_autorizaciones_objeto_empresa_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY objetos_autorizaciones
    ADD CONSTRAINT objetos_autorizaciones_objeto_empresa_id_fkey FOREIGN KEY (objeto_empresa_id) REFERENCES objetos_empresas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3113 (class 2606 OID 418367)
-- Name: objetos_autorizaciones_origen_producto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY objetos_autorizaciones
    ADD CONSTRAINT objetos_autorizaciones_origen_producto_id_fkey FOREIGN KEY (origen_producto_id) REFERENCES sys_paises(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3114 (class 2606 OID 418372)
-- Name: objetos_autorizaciones_persona_juridica_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY objetos_autorizaciones
    ADD CONSTRAINT objetos_autorizaciones_persona_juridica_id_fkey FOREIGN KEY (persona_juridica_id) REFERENCES personas_juridicas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3115 (class 2606 OID 418377)
-- Name: objetos_sociales_contratista_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY objetos_sociales
    ADD CONSTRAINT objetos_sociales_contratista_id_fkey FOREIGN KEY (contratista_id) REFERENCES contratistas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3116 (class 2606 OID 418382)
-- Name: objetos_sociales_documento_registrado_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY objetos_sociales
    ADD CONSTRAINT objetos_sociales_documento_registrado_id_fkey FOREIGN KEY (documento_registrado_id) REFERENCES activos.documentos_registrados(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3117 (class 2606 OID 418387)
-- Name: personas_juridicas_rif_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY personas_juridicas
    ADD CONSTRAINT personas_juridicas_rif_fkey FOREIGN KEY (rif) REFERENCES sys_naturales_juridicas(rif);


--
-- TOC entry 3118 (class 2606 OID 418392)
-- Name: personas_naturales_rif_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY personas_naturales
    ADD CONSTRAINT personas_naturales_rif_fkey FOREIGN KEY (rif) REFERENCES sys_naturales_juridicas(rif);


--
-- TOC entry 3119 (class 2606 OID 418397)
-- Name: personas_naturales_sys_pais_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY personas_naturales
    ADD CONSTRAINT personas_naturales_sys_pais_id_fkey FOREIGN KEY (sys_pais_id) REFERENCES sys_paises(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3120 (class 2606 OID 418402)
-- Name: polizas_contratadas_contratista_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY polizas_contratadas
    ADD CONSTRAINT polizas_contratadas_contratista_id_fkey FOREIGN KEY (contratista_id) REFERENCES contratistas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3121 (class 2606 OID 418407)
-- Name: polizas_contratadas_persona_juridica_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY polizas_contratadas
    ADD CONSTRAINT polizas_contratadas_persona_juridica_id_fkey FOREIGN KEY (aseguradora_id) REFERENCES personas_juridicas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3122 (class 2606 OID 418412)
-- Name: polizas_contratadas_sys_pais_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY polizas_contratadas
    ADD CONSTRAINT polizas_contratadas_sys_pais_id_fkey FOREIGN KEY (sys_pais_id) REFERENCES sys_paises(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3123 (class 2606 OID 418417)
-- Name: principios_contables_contratista_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY principios_contables
    ADD CONSTRAINT principios_contables_contratista_id_fkey FOREIGN KEY (contratista_id) REFERENCES contratistas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3124 (class 2606 OID 418422)
-- Name: razon_social_contratista_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY razones_sociales
    ADD CONSTRAINT razon_social_contratista_id_fkey FOREIGN KEY (contratista_id) REFERENCES contratistas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3125 (class 2606 OID 418427)
-- Name: relaciones_contratos_contratista_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY relaciones_contratos
    ADD CONSTRAINT relaciones_contratos_contratista_id_fkey FOREIGN KEY (contratista_id) REFERENCES contratistas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3126 (class 2606 OID 418432)
-- Name: relaciones_contratos_natural_juridica_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY relaciones_contratos
    ADD CONSTRAINT relaciones_contratos_natural_juridica_id_fkey FOREIGN KEY (natural_juridica_id) REFERENCES sys_naturales_juridicas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3127 (class 2606 OID 418437)
-- Name: sucursales_contratista_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY sucursales
    ADD CONSTRAINT sucursales_contratista_id_fkey FOREIGN KEY (contratista_id) REFERENCES contratistas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3128 (class 2606 OID 418442)
-- Name: sucursales_direccion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY sucursales
    ADD CONSTRAINT sucursales_direccion_id_fkey FOREIGN KEY (direccion_id) REFERENCES direcciones(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3129 (class 2606 OID 418447)
-- Name: sucursales_persona_natural_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY sucursales
    ADD CONSTRAINT sucursales_persona_natural_id_fkey FOREIGN KEY (persona_natural_id) REFERENCES personas_naturales(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3131 (class 2606 OID 418452)
-- Name: sys_bancos_sys_pais_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY sys_bancos
    ADD CONSTRAINT sys_bancos_sys_pais_id_fkey FOREIGN KEY (sys_pais_id) REFERENCES sys_paises(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3132 (class 2606 OID 418457)
-- Name: sys_ciudades_sys_estado_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY sys_ciudades
    ADD CONSTRAINT sys_ciudades_sys_estado_id_fkey FOREIGN KEY (sys_estado_id) REFERENCES sys_estados(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3133 (class 2606 OID 418462)
-- Name: sys_estados_sys_pais_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY sys_estados
    ADD CONSTRAINT sys_estados_sys_pais_id_fkey FOREIGN KEY (sys_pais_id) REFERENCES sys_paises(id);


--
-- TOC entry 3134 (class 2606 OID 418467)
-- Name: sys_municipios_sys_estado_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY sys_municipios
    ADD CONSTRAINT sys_municipios_sys_estado_id_fkey FOREIGN KEY (sys_estado_id) REFERENCES sys_estados(id);


--
-- TOC entry 3135 (class 2606 OID 418472)
-- Name: sys_parroquias_sys_municipio_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY sys_parroquias
    ADD CONSTRAINT sys_parroquias_sys_municipio_id_fkey FOREIGN KEY (sys_municipio_id) REFERENCES sys_municipios(id);


--
-- TOC entry 3136 (class 2606 OID 418477)
-- Name: sys_subdenominaciones_comerciales_sys_denominacion_comercial_id; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY sys_subdenominaciones_comerciales
    ADD CONSTRAINT sys_subdenominaciones_comerciales_sys_denominacion_comercial_id FOREIGN KEY (sys_denominacion_comercial_id) REFERENCES sys_denominaciones_comerciales(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3137 (class 2606 OID 418482)
-- Name: sys_tasas_divisas_sys_divisa_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY sys_tasas_divisas
    ADD CONSTRAINT sys_tasas_divisas_sys_divisa_id_fkey FOREIGN KEY (sys_divisa_id) REFERENCES sys_divisas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3138 (class 2606 OID 418487)
-- Name: user_visit_log_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eureka
--

ALTER TABLE ONLY user_visit_log
    ADD CONSTRAINT user_visit_log_user_id_fkey FOREIGN KEY (user_id) REFERENCES "user"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3424 (class 0 OID 0)
-- Dependencies: 8
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO eureka;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2015-04-23 16:54:41

--
-- PostgreSQL database dump complete
--

