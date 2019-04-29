## Mission 3-1:  Build a simple postgres database with some financial data to analyze at a later database


### Steps
- Install postgres from postgresapp.com
- Test at command line with `psql --help`
- If working then enter `psql -U postgres` this will take you to the default user postgres
- to exit you can run `control d`
- to see where postgres is installed run `which postgres` it should be located in
- /Applications/Postgres.app/Contents/Versions/10/bin/psql
- next run `ls /Applications/Postgres.app/Contents/Versions/10/bin/psql` this will
- show all the psql commands you can run
- to verify postgres is in your path run `echo "$PATH"`` and you will see it listed
- now check to see what databases you have in postgres
- run `psql -U postgres`
- from postgres run `\dt` to show what tables you already have
- next work through the factbook.sql file after review the comments
- run `psql -U postgres < factbook.psql`
- now run `\dt`
- you should see your new database factbook
- see that the records where entered and run `select * from factbook limit 100;`
