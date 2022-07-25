from sqlalchemy import *
from sqlalchemy.orm import sessionmaker


# app = {
#         'name': 'mysql+pymysql',
#         'user': 'root',
#         'password': 'rkwkrh13!#',
#         'host': 'localhost',
#         'dbconn': 'example',
#         'port': '3306'
# }
#
# conn_string=f'{app["name"]}://{app["user"]}:{app["password"]}@{app["host"]}:{app["port"]}/{app["dbconn"]}'

# conn_string = "mysql+pymysql://root:1313@mariadb:3306/test_db"
conn_string = "mysql+pymysql://root:rkwkrh13!#@mariadb:3306/example"
# conn_string = "mysql+pymysql://root:rkwkrh13!#@localhost:3306/example"
class engineconn:

    def __init__(self):
        self.engine = create_engine(conn_string, pool_recycle =500)

    def sessionmaker(self):
        Session = sessionmaker(bind=self.engine)
        session = Session()
        return session

    def connection(self):
        conn = self.engine.connect()
        return conn