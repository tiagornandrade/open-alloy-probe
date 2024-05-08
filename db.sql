GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO repl_user;
ALTER USER repl_user WITH SUPERUSER;


CREATE TABLE public.transactions (
    transactionId UUID,
    productId STRING,
    productName STRING,
    productCategory STRING,
    productPrice FLOAT,
    productQuantity INT,
    productBrand STRING,
    currency STRING,
    customerId STRING,
    transactionDate TIMESTAMP,
    paymentMethod STRING
);