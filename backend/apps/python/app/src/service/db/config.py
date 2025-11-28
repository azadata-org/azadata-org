"""
DB connection config

List of available parameters for connecting to a PostgreSQL server
https://www.postgresql.org/docs/current/libpq-connect.html#LIBPQ-PARAMKEYWORDS
"""

from dataclasses import dataclass
import logging
import os


@dataclass
class DbConfig:
    """
    DB Config class
    """

    host: str
    port: int
    user: str
    password: str
    dbname: str
    sslmode: str


class Config:
    """
    DB Config class
    """

    def __init__(self) -> None:
        """
        Get config values from environment
        """

        logging.info('Retrieving DB connection details from environment')
        host = os.environ.get('DB_HOST', 'db')
        port = os.environ.get('DB_PORT', 5432)
        user = os.environ.get('DB_USER', 'app')
        dbname = os.environ.get('DB_NAME', 'app')
        password = os.environ.get('DB_PASSWORD', 'app')

        self.config = DbConfig(
            host=host,
            port=int(port),
            user=user,
            password=password,
            dbname=dbname,
            sslmode='require',
        )
