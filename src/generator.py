import random
from faker import Faker
from datetime import datetime, timezone
import psycopg2

class DataGenerator:
    def __init__(self):
        self.fake = Faker()

    def generate(self):
        user = self.fake.simple_profile()

        return {
            "transactionId": self.fake.uuid4(),
            "productId": random.choice(['product1', 'product2', 'product3', 'product4', 'product5', 'product6']),
            "productName": random.choice(['laptop', 'mobile', 'tablet', 'watch', 'headphone', 'speaker']),
            'productCategory': random.choice(['electronic', 'fashion', 'grocery', 'home', 'beauty', 'sports']),
            'productPrice': round(random.uniform(10, 1000), 2),
            'productQuantity': random.randint(1, 10),
            'productBrand': random.choice(['apple', 'samsung', 'oneplus', 'mi', 'boat', 'sony']),
            'currency': random.choice(['USD', 'GBP']),
            'customerId': user['username'],
            'transactionDate': datetime.now(timezone.utc).strftime('%Y-%m-%dT%H:%M:%S.%f%z'),
            "paymentMethod": random.choice(['credit_card', 'debit_card', 'online_transfer'])
        }

    def write_to_postgres(self, data, table_name, connection_string, commit_every=1000):
        try:
            conn = psycopg2.connect(connection_string)
            cursor = conn.cursor()

            for i, item in enumerate(data, 1):
                cols = ', '.join(item.keys())
                placeholders = ', '.join(['%s'] * len(item))
                sql = f"INSERT INTO {table_name} ({cols}) VALUES ({placeholders})"
                cursor.execute(sql, list(item.values()))

                if i % commit_every == 0:
                    conn.commit()

            conn.commit()

            cursor.close()
            conn.close()
            print("Data inserted successfully!")
        except psycopg2.Error as e:
            print(f"Error inserting data into PostgreSQL: {e}")


if __name__ == "__main__":
    generator = DataGenerator()

    data_to_insert = [generator.generate() for _ in range(100000)]

    table_name = "transactions"
    connection_string = "dbname='postgres' user='postgres' host='localhost' password='postgres'"
    generator.write_to_postgres(data_to_insert, table_name, connection_string, commit_every=1000)
