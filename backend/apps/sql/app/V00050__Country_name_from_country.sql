-- Insert
insert into
  country_name
select
  alpha_2_code,
  english_short_name as name
from
  country
;
