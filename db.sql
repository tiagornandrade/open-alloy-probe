GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO postgres;
ALTER USER postgres WITH SUPERUSER;


CREATE EXTENSION IF NOT EXISTS timescaledb;

CREATE TABLE public.transactions (
    transactionid UUID,
    productid TEXT,
    productname TEXT,
    productcategory TEXT,
    productprice FLOAT,
    productquantity INT,
    productbrand TEXT,
    currency TEXT,
    customerid TEXT,
    transactiondate TIMESTAMPTZ,
    paymentmethod TEXT
);

SELECT create_hypertable('transactions', 'transactiondate');
