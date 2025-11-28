/*
  Adds a new column to company table with json of all PSCs
*/

alter table
  company
add column
  persons_with_significant_control jsonb
;


with pscs as (
  select
    -- root element
    c.number as company_number,
    json_agg(p.*) as persons_with_significant_control
  from
    company as c
  inner join
    person_with_significant_control as p
  on
    p.company_number = c.number
  group by
    c.number
)
update
  company
set
  persons_with_significant_control = pscs.persons_with_significant_control
from
  pscs
where
  company.number = pscs.company_number
;
