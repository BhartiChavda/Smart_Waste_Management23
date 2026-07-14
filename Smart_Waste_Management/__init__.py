import pymysql

pymysql.install_as_MySQLdb()

# Bypass the MariaDB 10.6+ strict version check in Django 4.2+ 
# because XAMPP uses MariaDB 10.4.32
from django.db.backends.mysql.base import DatabaseWrapper
DatabaseWrapper.check_database_version_supported = lambda self: True

from django.db.backends.mysql.features import DatabaseFeatures
DatabaseFeatures.can_return_columns_from_insert = property(lambda self: False)
DatabaseFeatures.can_return_rows_from_bulk_insert = property(lambda self: False)
