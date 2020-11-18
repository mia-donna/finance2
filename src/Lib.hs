
module Lib where 

import Database.HDBC
import Database.HDBC.Sqlite3

connectDB :: IO Connection
connectDB = connectSqlite3 "prices.sqlite"

initialiseDB :: Connection -> IO ()
initialiseDB conn =
 do
   run conn "CREATE TABLE IF NOT EXISTS prices (\
          \stock VARCHAR(40) NOT NULL, \
          \date VARCHAR(40) NOT NULL, \
          \open FLOAT DEFAULT NULL, \
          \high FLOAT DEFAULT NULL, \
          \low FLOAT DEFAULT NULL, \
          \close FLOAT DEFAULT NULL, \
          \volume BIGINT(11) DEFAULT NULL\
          \)"
          []
   commit conn