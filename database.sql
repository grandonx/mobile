CREATE DATABASE database

-- Created by Vertabelo (http://vertabelo.com)
-- Script type: create
-- Scope: [tables, references, sequences, views, procedures]
-- Generated at Mon Jan 05 07:17:44 UTC 2015




-- tables
-- Table tb_brand
CREATE TABLE tb_brand (
    brand_id int    NOT NULL ,
    brand_name varchar(255)    NOT NULL ,
    brand_category_id int    NOT NULL ,
    brand_location_id int    NOT NULL ,
    tb_product_product_id int    NOT NULL ,
    CONSTRAINT tb_brand_pk PRIMARY KEY (brand_id)
);

-- Table tb_category
CREATE TABLE tb_category (
    category_id int    NOT NULL ,
    category_name varchar(255)    NOT NULL ,
    tb_product_product_id int    NOT NULL ,
    tb_user_id int    NOT NULL ,
    tb_brand_brand_id int    NOT NULL ,
    CONSTRAINT tb_category_pk PRIMARY KEY (category_id)
);

-- Table tb_location
CREATE TABLE tb_location (
    location_id int    NOT NULL ,
    location_name int    NOT NULL ,
    tb_brand_brand_id int    NOT NULL ,
    transaksi_kejadian_id int    NOT NULL ,
    CONSTRAINT tb_location_pk PRIMARY KEY (location_id)
);

-- Table tb_product
CREATE TABLE tb_product (
    product_id int    NOT NULL ,
    product_name varchar(255)    NOT NULL ,
    product_brand_id int    NOT NULL ,
    product_category_id int    NOT NULL ,
    CONSTRAINT tb_product_pk PRIMARY KEY (product_id)
);

-- Table tb_user
CREATE TABLE tb_user (
    id int    NOT NULL ,
    full_name varchar(255)    NOT NULL ,
    email varchar(255)    NOT NULL ,
    user_category int    NOT NULL ,
    CONSTRAINT tb_user_pk PRIMARY KEY (id)
);

-- Table transaksi
CREATE TABLE transaksi (
    kejadian_id int    NOT NULL ,
    kejadian_user_id int    NOT NULL ,
    kejadian_location_id int    NOT NULL ,
    tb_user_id int    NOT NULL ,
    CONSTRAINT transaksi_pk PRIMARY KEY (kejadian_id)
);




-- views
-- View: V_brand_location
CREATE VIEW V_brand_location AS
SELECT tb_user.user_category,tb_location.location_id,tb_brand.brand_category_id FROM tb_user,tb_location WHERE user_category = brand_category_id;




-- foreign keys
-- Reference:  tb_brand_tb_product (table: tb_product)


ALTER TABLE tb_product ADD CONSTRAINT tb_brand_tb_product FOREIGN KEY tb_brand_tb_product (product_brand_id)
    REFERENCES tb_brand (brand_id);
-- Reference:  tb_category_tb_brand (table: tb_category)


ALTER TABLE tb_category ADD CONSTRAINT tb_category_tb_brand FOREIGN KEY tb_category_tb_brand (tb_brand_brand_id)
    REFERENCES tb_brand (brand_id);
-- Reference:  tb_category_tb_product (table: tb_category)


ALTER TABLE tb_category ADD CONSTRAINT tb_category_tb_product FOREIGN KEY tb_category_tb_product (tb_product_product_id)
    REFERENCES tb_product (product_id);
-- Reference:  tb_category_tb_user (table: tb_category)


ALTER TABLE tb_category ADD CONSTRAINT tb_category_tb_user FOREIGN KEY tb_category_tb_user (tb_user_id)
    REFERENCES tb_user (id);
-- Reference:  tb_location_tb_brand (table: tb_location)


ALTER TABLE tb_location ADD CONSTRAINT tb_location_tb_brand FOREIGN KEY tb_location_tb_brand (tb_brand_brand_id)
    REFERENCES tb_brand (brand_id);
-- Reference:  tb_location_transaksi (table: tb_location)


ALTER TABLE tb_location ADD CONSTRAINT tb_location_transaksi FOREIGN KEY tb_location_transaksi (transaksi_kejadian_id)
    REFERENCES transaksi (kejadian_id);
-- Reference:  transaksi_tb_user (table: transaksi)


ALTER TABLE transaksi ADD CONSTRAINT transaksi_tb_user FOREIGN KEY transaksi_tb_user (tb_user_id)
    REFERENCES tb_user (id);



-- End of file.

