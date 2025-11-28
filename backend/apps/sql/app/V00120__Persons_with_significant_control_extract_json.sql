
/**
  Unique address JSON keys identified with:
  ```sql
  select distinct jsonb_object_keys(record::jsonb->'data') from public.person_with_significant_control_raw;
  select distinct jsonb_object_keys(record::jsonb->'data'->'address') from public.person_with_significant_control_raw;
  select distinct jsonb_object_keys(record::jsonb->'data'->'identification') from public.person_with_significant_control_raw;
  select distinct jsonb_object_keys(record::jsonb->'data'->'name_elements') from public.person_with_significant_control_raw;
  select distinct jsonb_object_keys(record::jsonb->'data'->'links') from public.person_with_significant_control_raw;
  ```
*/

create table
  person_with_significant_control_extract
as
select
  -- root element
  record->>'company_number' as company_number,
  -- data elements
  record->'data'->>'kind' as kind,
  record->'data'->>'etag' as etag,
  record->'data'->>'is_sanctioned' as is_sanctioned,
  record->'data'->>'restrictions_notice_withdrawal_reason' as restrictions_notice_withdrawal_reason,
  record->'data'->>'statement' as statement,
  record->'data'->>'linked_psc_name' as linked_psc_name,
  record->'data'->>'ceased_on' as ceased_on,
  record->'data'->>'generated_at' as generated_at,
  record->'data'->>'notified_on' as notified_on,
  record->'data'->>'nationality' as nationality,
  record->'data'->>'country_of_residence' as country_of_residence,
  -- identity verification details elements
  record->'data'->'identity_verification_details'->>'appointment_verification_statement_date' as appointment_verification_statement_date,
  record->'data'->'identity_verification_details'->>'appointment_verification_statement_due_on' as appointment_verification_statement_due_on,
  -- identification elements
  record->'data'->'identification'->>'place_registered' as identification_place_registered,
  record->'data'->'identification'->>'country_registered' as identification_country_registered,
  record->'data'->'identification'->>'registration_number' as identification_registration_number,
  record->'data'->'identification'->>'legal_form' as identification_legal_form,
  record->'data'->'identification'->>'legal_authority' as identification_legal_authority,
  -- links elements
  record->'data'->'links'->>'self' as link_self,
  record->'data'->'links'->>'statement' as link_statement,
  record->'data'->'links'->>'person_with_significant_control' as link_person_with_significant_control,
  -- date of birth elements
  record->'data'->'date_of_birth'->>'month' as date_of_birth_month,
  record->'data'->'date_of_birth'->>'year' as date_of_birth_year,
  -- name elements
  record->'data'->>'name' as name,
  record->'data'->'name_elements'->>'title' as title,
  record->'data'->'name_elements'->>'surname' as surname,
  record->'data'->'name_elements'->>'forename' as forename,
  record->'data'->'name_elements'->>'middle_name' as middle_name,
  -- address fields
  record->'data'->'address'->>'address_line_1' as address_line_1,
  record->'data'->'address'->>'address_line_2' as address_line_2,
  record->'data'->'address'->>'care_of' as address_care_of,
  record->'data'->'address'->>'country' as address_country,
  record->'data'->'address'->>'locality' as address_locality,
  record->'data'->'address'->>'po_box' as address_po_box,
  record->'data'->'address'->>'postal_code' as address_postal_code,
  record->'data'->'address'->>'premises' as address_premises,
  record->'data'->'address'->>'region' as address_region,
  -- principal office address fields
  record->'data'->'principal_office_address'->>'address_line_1' as principal_office_address_line_1,
  record->'data'->'principal_office_address'->>'address_line_2' as principal_office_address_line_2,
  record->'data'->'principal_office_address'->>'care_of' as principal_office_address_care_of,
  record->'data'->'principal_office_address'->>'country' as principal_office_address_country,
  record->'data'->'principal_office_address'->>'locality' as principal_office_address_locality,
  record->'data'->'principal_office_address'->>'po_box' as principal_office_address_po_box,
  record->'data'->'principal_office_address'->>'postal_code' as principal_office_address_postal_code,
  record->'data'->'principal_office_address'->>'premises' as principal_office_address_premises,
  record->'data'->'principal_office_address'->>'region' as principal_office_address_region
from
  person_with_significant_control_raw
;
