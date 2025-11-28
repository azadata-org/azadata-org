"""
DB Service
"""

from dataclasses import asdict
import logging
from typing import TypeVar
from time import sleep
from psycopg import connect, Cursor, Connection, OperationalError
from psycopg.rows import class_row
from psycopg.abc import Query, Params
from psycopg.sql import SQL, Identifier
from src.service.db.config import Config

T = TypeVar("T", covariant=True)

class Db:
    """
    DB Connection class
    """

    def __init__(self) -> None:
        logging.info('Start DB service')
        config = Config()

        # wait for DB connection to be available
        attempts = 5
        for i in range(1, attempts + 1):
            logging.info('Database connection attempt %s', i)
            try:
                # Attempt to connect to the database
                self.connection: Connection = connect(**asdict(config.config))
                break
            except OperationalError as err:
                sleep_seconds = 5
                logging.info('Connection not ready, waiting for %s seconds', sleep_seconds)
                sleep(sleep_seconds)
                if i == attempts + 1:
                    logging.error(err)
                    raise ConnectionError('Giving up connecting to database') from err


    def __del__(self) -> None:
        """
        Destructor to close DB connection
        """

        logging.info('Closing DB connection')
        self.connection.close()


    def execute(self, query: Query, params: Params | None) -> None:
        """
        Execute query
        """

        result = self.connection.execute(query=query, params=params)

        logging.info(result)


    def truncate_table(self, table_name: str) -> None:
        """
        Clear all records from table
        """

        logging.info("Truncating table %s", table_name)
        sql = SQL("truncate table {}").format(Identifier(table_name))
        self.connection.execute(sql)


    def get_class_cursor(self, cls: type[T]) -> Cursor[T]:
        """
        Given a class, return a cursor using class row factory
        """

        cursor = self.connection.cursor(row_factory=class_row(cls))

        return cursor
