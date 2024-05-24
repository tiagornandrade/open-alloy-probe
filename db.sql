GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO repl_user;
ALTER USER repl_user WITH SUPERUSER;


CREATE EXTENSION IF NOT EXISTS vector;
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
