CREATE TABLE ESTABLSIHMENT(
    establishmentID NUMBER(4),
    nameEstablishment VARCHAR2(8)
);

CREATE TABLE PRODUCT(
    productID NUMBER(4),
    author VARCHAR2(8),
    title VARCHAR2(16),
    priceProduct NUMBER(8)
);

CREATE TABLE WAREHOUSE(
    warehouseID NUMBER(4),
    nameWarehouse VARCHAR2(16),
    addressWarehouse VARCHAR2(16)
);

CREATE TABLE CUSTOMER(
    customerID NUMBER(4),
    nameCustomer VARCHAR2(8),
    first_last_name VARCHAR2(16),
    second_last_name VARCHAR2(16),
    emailCustomer VARCHAR2(30)
);


CREATE TABLE BOOK(
    publisher VARCHAR(16),
    editionBook VARCHAR(16)
);

CREATE TABLE MUSICAL_MEDIUM(
    gender VARCHAR2(16),
    kind VARCHAR2(16)
);

CREATE TABLE ELECTRONIC_CARDS(
    price VARCHAR(16)
);

CREATE TABLE BOOK(
    gender VARCHAR(8),
    publisher VARCHAR(16),
    edition VARCHAR(8)
);



