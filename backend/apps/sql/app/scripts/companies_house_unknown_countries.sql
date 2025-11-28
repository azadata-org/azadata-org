select
  unique_country_names.unique_country_name
from (
  select distinct
    company_country_names.country_name as unique_country_name
  from (
    -- Basic company data registered address country
    select distinct
      registered_address_country as country_name
    from
      app.basic_company_data
    union
    -- Basic company data country of origin
    select distinct
      registered_address_country as country_name
    from
      app.basic_company_data
    union
    -- Persons with significant control address country
    select distinct
      address_country as country_name
    from
      app.person_with_significant_control
    union
    -- Persons with significant control country of residence
    select distinct
      country_of_residence as country_name
    from
      app.person_with_significant_control
    union
    -- Persons with significant control identification country registered
    select distinct
      identification_country_registered as country_name
    from
      app.person_with_significant_control
    union
    -- Persons with significant control principal office address country
    select distinct
      principal_office_address_country as country_name
    from
      app.person_with_significant_control
    union
    -- Persons with significant control nationality
    select distinct
      nationality as country_name
    from
      app.person_with_significant_control
  ) as company_country_names
) as unique_country_names
where
  upper(unique_country_names.unique_country_name) not in (
    -- ISO country code fields (english name)
    select
      upper(english_short_name)
    from
      country
    union
    -- ISO country code fields (alpha 2 code)
    select
      upper(alpha_2_code)
    from
      country
    union
    -- ISO country code fields (alpha 3 code)
    select
      upper(alpha_3_code)
    from
      country
    union
    -- name aliases
    select
      upper(name)
    from
      country_name
  )
;
