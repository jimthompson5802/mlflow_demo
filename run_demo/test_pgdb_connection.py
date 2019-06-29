###
# Test connection to Postgres database
###

import sqlalchemy
import os
import sys

# retrieve connection string to back-end database
db_connection_string = 'postgresql://mlflow_user:mlflow_pw@pgdb/mlflow_db' #os.environ['MLFLOW_BACKEND_STORE']
engine = sqlalchemy.create_engine(db_connection_string)

try:
    conn = engine.connect()
    print("test connection worked")
    conn.close()
except Exception as e:
    print(str(e))
    sys.exit(1)