GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO postgres;
ALTER USER postgres WITH SUPERUSER;

CREATE EXTENSION IF NOT EXISTS timescaledb CASCADE;


CREATE TABLE public.transactions (
    transactionId UUID,
    productId VARCHAR,
    productName VARCHAR,
    productCategory VARCHAR,
    productPrice FLOAT,
    productQuantity INT,
    productBrand VARCHAR,
    currency VARCHAR,
    customerId VARCHAR,
    transactionDate TIMESTAMP,
    paymentMethod VARCHAR
);