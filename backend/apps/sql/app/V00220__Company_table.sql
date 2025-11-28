/*
  Script to remap raw data fields to company entity.
  Company table is created automatically via select into.
*/

select
  company_name as name,
  company_number as number,
  concat_ws(
    ', ',
    nullif(trim(registered_address_care_of), ''),
    nullif(trim(registered_address_po_Box), ''),
    nullif(trim(registered_address_address_line_1), ''),
    nullif(trim(registered_address_address_line_2), ''),
    nullif(trim(registered_address_post_town), ''),
    nullif(trim(registered_address_county), ''),
    nullif(trim(registered_address_post_code), ''),
    nullif(trim(registered_address_country), '')
  ) as registered_address,
  company_category as category,
  company_status as status,
  country_of_origin,
  dissolution_date,
  incorporation_date,
  accounts_account_ref_day,
  accounts_account_ref_month,
  accounts_next_due_date,
  accounts_last_made_up_date,
  accounts_account_category,
  returns_next_due_date,
  returns_last_made_up_date,
  mortgages_num_mort_charges,
  mortgages_num_mort_outstanding,
  mortgages_num_mort_part_satisfied,
  mortgages_num_mort_satisfied,
  sic_code_sic_text_1,
  sic_code_sic_text_2,
  sic_code_sic_text_3,
  sic_code_sic_text_4,
  limited_partnerships_num_gen_partners,
  limited_partnerships_num_lim_partners,
  uri,
  previous_name_1_con_date,
  previous_name_1_company_name,
  previous_name_2_con_date,
  previous_name_2_company_name,
  previous_name_3_con_date,
  previous_name_3_company_name,
  previous_name_4_con_date,
  previous_name_4_company_name,
  previous_name_5_con_date,
  previous_name_5_company_name,
  previous_name_6_con_date,
  previous_name_6_company_name,
  previous_name_7_con_date,
  previous_name_7_company_name,
  previous_name_8_con_date,
  previous_name_8_company_name,
  previous_name_9_con_date,
  previous_name_9_company_name,
  previous_name_10_con_date,
  previous_name_10_company_name,
  conf_stmt_next_due_date,
  conf_stmt_last_made_up_date,
  -- Enriched fields
  registered_address_country.alpha_2_code as registered_address_country_alpha_2_code,
  country_of_origin_country.alpha_2_code as country_of_origin_country_alpha_2_code
into
  company
from
  basic_company_data
left join
  country_name
as
  registered_address_country
on
  upper(basic_company_data.registered_address_country) = upper(registered_address_country.name)
left join
  country_name
as
  country_of_origin_country
on
  upper(basic_company_data.country_of_origin) = upper(country_of_origin_country.name)
;
