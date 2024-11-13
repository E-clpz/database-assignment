CREATE TABLE IF NOT EXISTS public.product
(
    id integer NOT NULL DEFAULT nextval('product_id_seq'::regclass),
    name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    brand character varying(50) COLLATE pg_catalog."default" NOT NULL,
    price numeric(10,2) NOT NULL,
    currentstock integer DEFAULT 0,
    sold integer DEFAULT 0,
    datesold timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    type character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT product_pkey PRIMARY KEY (id),
    CONSTRAINT product_price_check CHECK (price >= 0::numeric),
    CONSTRAINT product_currentstock_check CHECK (currentstock >= 0),
    CONSTRAINT product_sold_check CHECK (sold >= 0)
)

CREATE TABLE IF NOT EXISTS public.users
(
    id integer NOT NULL DEFAULT nextval('users_id_seq'::regclass),
    username character varying(50) COLLATE pg_catalog."default" NOT NULL,
    password character varying(50) COLLATE pg_catalog."default" NOT NULL,
    adres character varying(100) COLLATE pg_catalog."default" NOT NULL,
    functie character varying(50) COLLATE pg_catalog."default" NOT NULL,
    loonschaal integer,
    vakantiedagen integer DEFAULT 0,
    CONSTRAINT users_pkey PRIMARY KEY (id),
    CONSTRAINT users_username_key UNIQUE (username),
    CONSTRAINT users_loonschaal_check CHECK (loonschaal >= 0),
    CONSTRAINT users_vakantiedagen_check CHECK (vakantiedagen >= 0)
)

CREATE TABLE IF NOT EXISTS public.cimodule
(
    id integer NOT NULL DEFAULT nextval('cimodule_id_seq'::regclass),
    provider character varying(50) COLLATE pg_catalog."default" NOT NULL,
    encoding character varying(50) COLLATE pg_catalog."default" NOT NULL,
    productid integer,
    CONSTRAINT cimodule_pkey PRIMARY KEY (id),
    CONSTRAINT cimodule_productid_key UNIQUE (productid),
    CONSTRAINT cimodule_productid_fkey FOREIGN KEY (productid)
        REFERENCES public.product (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE
)

CREATE TABLE IF NOT EXISTS public.monitors
(
    id integer NOT NULL DEFAULT nextval('monitors_id_seq'::regclass),
    inches numeric(5,2) NOT NULL,
    refreshrate character varying(20) COLLATE pg_catalog."default" NOT NULL,
    schermtype character varying(50) COLLATE pg_catalog."default" NOT NULL,
    reactiontime numeric(5,3) NOT NULL,
    productid integer,
    CONSTRAINT monitors_pkey PRIMARY KEY (id),
    CONSTRAINT monitors_productid_key UNIQUE (productid),
    CONSTRAINT monitors_productid_fkey FOREIGN KEY (productid)
        REFERENCES public.product (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE,
    CONSTRAINT monitors_inches_check CHECK (inches > 0::numeric),
    CONSTRAINT monitors_reactiontime_check CHECK (reactiontime > 0::numeric)
)

CREATE TABLE IF NOT EXISTS public.remotecontroller
(
    id integer NOT NULL DEFAULT nextval('remotecontroller_id_seq'::regclass),
    smart boolean DEFAULT false,
    batterytype character varying(50) COLLATE pg_catalog."default" NOT NULL,
    productid integer,
    CONSTRAINT remotecontroller_pkey PRIMARY KEY (id),
    CONSTRAINT remotecontroller_productid_key UNIQUE (productid),
    CONSTRAINT remotecontroller_productid_fkey FOREIGN KEY (productid)
        REFERENCES public.product (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE
)

CREATE TABLE IF NOT EXISTS public.wallbracket
(
    id integer NOT NULL DEFAULT nextval('wallbracket_id_seq'::regclass),
    adjustable boolean DEFAULT false,
    bevestigingsmethode character varying(50) COLLATE pg_catalog."default" NOT NULL,
    height numeric(5,2) NOT NULL,
    width numeric(5,2) NOT NULL,
    productid integer,
    CONSTRAINT wallbracket_pkey PRIMARY KEY (id),
    CONSTRAINT wallbracket_productid_key UNIQUE (productid),
    CONSTRAINT wallbracket_productid_fkey FOREIGN KEY (productid)
        REFERENCES public.product (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE,
    CONSTRAINT wallbracket_height_check CHECK (height > 0::numeric),
    CONSTRAINT wallbracket_width_check CHECK (width > 0::numeric)
)

SELECT * FROM Product;

CREATE TABLE IF NOT EXISTS public.monitors
(
    id integer NOT NULL DEFAULT nextval('monitors_id_seq'::regclass),
    inches numeric(5,2) NOT NULL,
    refreshrate character varying(20) COLLATE pg_catalog."default" NOT NULL,
    schermtype character varying(50) COLLATE pg_catalog."default" NOT NULL,
    reactiontime numeric(5,3) NOT NULL,
    productid integer,
    CONSTRAINT monitors_pkey PRIMARY KEY (id),
    CONSTRAINT monitors_productid_key UNIQUE (productid),
    CONSTRAINT monitors_productid_fkey FOREIGN KEY (productid)
        REFERENCES public.product (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE,
    CONSTRAINT monitors_inches_check CHECK (inches > 0::numeric),
    CONSTRAINT monitors_reactiontime_check CHECK (reactiontime > 0::numeric)
)

SELECT * FROM Monitors;

SELECT Monitors.ReactionTime
FROM Monitors;

SELECT *
	FROM Monitors
	WHERE ReactionTime = 1;

CREATE TABLE IF NOT EXISTS public.cables
(
    id integer NOT NULL DEFAULT nextval('cables_id_seq'::regclass),
    cabletype character varying(50) COLLATE pg_catalog."default" NOT NULL,
    cablelength numeric(5,2) NOT NULL,
    productid integer,
    CONSTRAINT cables_pkey PRIMARY KEY (id),
    CONSTRAINT cables_productid_key UNIQUE (productid),
    CONSTRAINT cables_productid_fkey FOREIGN KEY (productid)
        REFERENCES public.product (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE,
    CONSTRAINT cables_cablelength_check CHECK (cablelength > 0::numeric)
)

SELECT * FROM Cables;

