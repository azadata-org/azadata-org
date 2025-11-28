from dataclasses import dataclass

@dataclass
class PersonWithSignificantControl:
    """
    Person With Significant Control model
    """

    company_number: str
    kind: str
    etag: str
    is_sanctioned: str
    restrictions_notice_withdrawal_reason: str
    statement: str
    linked_psc_name: str
    ceased_on: str
    generated_at: str
    notified_on: str
    nationality: str
    country_of_residence: str
    appointment_verification_statement_date: str
    appointment_verification_statement_due_on: str
    identification_place_registered: str
    identification_country_registered: str
    identification_registration_number: str
    identification_legal_form: str
    identification_legal_authority: str
    link_self: str
    link_statement: str
    link_person_with_significant_control: str
    date_of_birth_month: str
    date_of_birth_year: str
    name: str
    title: str
    surname: str
    forename: str
    middle_name: str
    address_line_1: str
    address_line_2: str
    address_care_of: str
    address_country: str
    address_locality: str
    address_po_box: str
    address_postal_code: str
    address_premises: str
    address_region: str
    principal_office_address_line_1: str
    principal_office_address_line_2: str
    principal_office_address_care_of: str
    principal_office_address_country: str
    principal_office_address_locality: str
    principal_office_address_po_box: str
    principal_office_address_postal_code: str
    principal_office_address_premises: str
    principal_office_address_region: str
