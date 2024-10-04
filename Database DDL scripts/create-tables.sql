-- public.ingredients definition

-- Drop table

-- DROP TABLE public.ingredients;

CREATE TABLE public.ingredients (
	ing_id varchar(20) NOT NULL,
	ing_name varchar(50) NULL,
	ing_weight int4 NULL,
	ing_meas varchar(10) NULL,
	ing_price numeric NULL,
	CONSTRAINT pk_ing PRIMARY KEY (ing_id)
);


-- public.items definition

-- Drop table

-- DROP TABLE public.items;

CREATE TABLE public.items (
	item_id varchar(20) NOT NULL,
	item_name varchar(30) NULL,
	item_cat varchar(20) NULL,
	item_size varchar(10) NULL,
	item_price numeric NULL,
	CONSTRAINT items_pk PRIMARY KEY (item_id)
);


-- public.orders definition

-- Drop table

-- DROP TABLE public.orders;

CREATE TABLE public.orders (
	order_id varchar(20) NOT NULL,
	cust_name varchar(50) NULL,
	created_at timestamp NULL,
	in_or_out public.in_out_enum NULL,
	CONSTRAINT orders_pk PRIMARY KEY (order_id)
);


-- public.shift definition

-- Drop table

-- DROP TABLE public.shift;

CREATE TABLE public.shift (
	shift_id varchar(20) NOT NULL,
	day_of_week public.day_of_week NULL,
	start_time time NULL,
	end_time time NULL,
	CONSTRAINT pk_shift PRIMARY KEY (shift_id)
);


-- public.staff definition

-- Drop table

-- DROP TABLE public.staff;

CREATE TABLE public.staff (
	staff_id varchar(20) NOT NULL,
	first_name varchar(50) NULL,
	last_name varchar(50) NULL,
	"position" varchar(30) NULL,
	sal_per_hour numeric NULL,
	CONSTRAINT pk_staff PRIMARY KEY (staff_id)
);


-- public.inventory definition

-- Drop table

-- DROP TABLE public.inventory;

CREATE TABLE public.inventory (
	inv_id varchar(20) NOT NULL,
	ing_id varchar(20) NULL,
	quantity int4 NULL,
	CONSTRAINT pk_inv PRIMARY KEY (inv_id),
	CONSTRAINT inventory_ingredients_fk FOREIGN KEY (ing_id) REFERENCES public.ingredients(ing_id)
);


-- public.order_details definition

-- Drop table

-- DROP TABLE public.order_details;

CREATE TABLE public.order_details (
	order_id varchar(20) NOT NULL,
	item_id varchar(20) NOT NULL,
	CONSTRAINT order_details_orders_fk FOREIGN KEY (order_id) REFERENCES public.orders(order_id),
	CONSTRAINT orders_items_fk FOREIGN KEY (item_id) REFERENCES public.items(item_id)
);


-- public.recipe definition

-- Drop table

-- DROP TABLE public.recipe;

CREATE TABLE public.recipe (
	item_id varchar(20) NOT NULL,
	ing_id varchar(20) NOT NULL,
	quantity int4 NULL,
	CONSTRAINT recipe_ingredients_fk FOREIGN KEY (ing_id) REFERENCES public.ingredients(ing_id),
	CONSTRAINT recipe_items_fk FOREIGN KEY (item_id) REFERENCES public.items(item_id)
);


-- public.rota definition

-- Drop table

-- DROP TABLE public.rota;

CREATE TABLE public.rota (
	"date" date NULL,
	shift_id varchar(20) NULL,
	staff_id varchar(20) NULL,
	CONSTRAINT rota_shift_fk FOREIGN KEY (shift_id) REFERENCES public.shift(shift_id),
	CONSTRAINT rota_staff_fk FOREIGN KEY (staff_id) REFERENCES public.staff(staff_id)
);