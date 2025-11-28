create table
  person_with_significant_control
as
select
  -- root element
  company_number,
  -- data elements
  kind,
  etag,
  is_sanctioned::boolean,
  restrictions_notice_withdrawal_reason,
  statement,
  linked_psc_name,
  date(ceased_on) as ceased_on,
  date(notified_on) as notified_on,
  nationality,
  country_of_residence,
  -- identity verification details elements
  appointment_verification_statement_date,
  appointment_verification_statement_due_on,
  -- identification elements
  identification_place_registered,
  identification_country_registered,
  identification_registration_number,
  identification_legal_form,
  identification_legal_authority,
  -- links elements
  link_self,
  link_statement,
  link_person_with_significant_control,
  -- date of birth elements
  date_of_birth_month,
  date_of_birth_year,
  -- name elements
  psc.name,
  -- record->'data'->'name_elements'->>'title' as title,
  -- record->'data'->'name_elements'->>'surname' as surname,
  -- record->'data'->'name_elements'->>'forename' as forename,
  -- record->'data'->'name_elements'->>'middle_name' as middle_name,
  -- address fields
  concat_ws(
    ', ',
    nullif(trim(address_care_of), ''),
    nullif(trim(address_po_box), ''),
    nullif(trim(address_premises), ''),
    nullif(trim(address_line_1), ''),
    nullif(trim(address_line_2), ''),
    nullif(trim(address_locality), ''),
    nullif(trim(address_region), ''),
    nullif(trim(address_postal_code), ''),
    nullif(trim(address_country), '')
  ) as address,
  address_country,
  -- principal office address fields
  concat_ws(
    ', ',
    nullif(trim(principal_office_address_care_of), ''),
    nullif(trim(principal_office_address_po_box), ''),
    nullif(trim(principal_office_address_premises), ''),
    nullif(trim(principal_office_address_line_1), ''),
    nullif(trim(principal_office_address_line_2), ''),
    nullif(trim(principal_office_address_locality), ''),
    nullif(trim(principal_office_address_region), ''),
    nullif(trim(principal_office_address_postal_code), ''),
    nullif(trim(principal_office_address_country), '')
  ) as principal_office_address,
  principal_office_address_country,
  -- Enriched fields
  coalesce(nationality.alpha_2_code, 'XX') as nationality_alpha_2_code,
  coalesce(country_of_residence.alpha_2_code, 'XX') as country_of_residence_alpha_2_code,
  coalesce(identification_country_registered.alpha_2_code, 'XX') as identification_country_registered_alpha_2_code,
  coalesce(address_country.alpha_2_code, 'XX') as address_country_alpha_2_code,
  coalesce(principal_office_address_country.alpha_2_code, 'XX') as principal_office_address_country_alpha_2_code
from
  person_with_significant_control_extract as psc
-- nationality
left join
  country_name
as
  nationality
on
  upper(psc.nationality) = upper(nationality.name)
-- country of residence
left join
  country_name
as
  country_of_residence
on
  upper(psc.country_of_residence) = upper(country_of_residence.name)
-- identification country registered
left join
  country_name
as
  identification_country_registered
on
  upper(psc.identification_country_registered) = upper(identification_country_registered.name)
-- address
left join
  country_name
as
  address_country
on
  upper(psc.address_country) = upper(address_country.name)
-- principal office address
left join
  country_name
as
  principal_office_address_country
on
  upper(psc.principal_office_address_country) = upper(principal_office_address_country.name)
;
