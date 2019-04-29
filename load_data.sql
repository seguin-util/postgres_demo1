-- here we use the begin keyword to start a transactional block..meaining all lines
-- after begin will excute in a single transaction until an explicit commit is called..this is faster
-- this is more effiecient than running command after command
begin;

-- DROP TABLE removes tables from the database
drop table if exists factbook;

-- its good practice to import all data as text initially as we just want to get the data in first without error then use the postgres tools to update

create table factbook(
  year int,
  date date,
  shares text,
  trades  text,
  dollars text

);

--  copy to table name from factbook.csv with delimter E <E tells postgres that >
-- there may be an escape character in the data followed by '\t'<tab delimter>...the null value specifies
-- there might be a null value if so add it as an empty value ''
\copy factbook from 'factbook.csv' with delimiter E'\t' null ''

-- finally alter table with the correct datatypes
alter table factbook
  alter shares
  type bigint
  using replace(shares, ',', '')::bigint,

  alter trades
  type bigint
  using replace(trades, ',', '')::bigint,

  alter dollars
  type bigint

  -- The PostgreSQL substring function is used to extract a string containing a specific number of characters from a particular position of a given string.

  using substring(replace(dollars, ',', '') from 2)::numeric;

-- finally commit the transaction to the table

commit;
