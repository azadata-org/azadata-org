from dataclasses import dataclass

from src.model.person_with_significant_control import PersonWithSignificantControl

@dataclass
class Company:
    """
    Company model
    """

    name: str
    number: str
    registered_address: str
    registered_address_country_alpha_2_code: str
    category: str
    status: str
    country_of_origin: str
    country_of_origin_country_alpha_2_code: str
    dissolution_date: str
    incorporation_date: str
    accounts_account_ref_day: str
    accounts_account_ref_month: str
    accounts_next_due_date: str
    accounts_last_made_up_date: str
    accounts_account_category: str
    returns_next_due_date: str
    returns_last_made_up_date: str
    mortgages_num_mort_charges: str
    mortgages_num_mort_outstanding: str
    mortgages_num_mort_part_satisfied: str
    mortgages_num_mort_satisfied: str
    sic_code_sic_text_1: str
    sic_code_sic_text_2: str
    sic_code_sic_text_3: str
    sic_code_sic_text_4: str
    limited_partnerships_num_gen_partners: str
    limited_partnerships_num_lim_partners: str
    uri: str
    previous_name_1_con_date: str
    previous_name_1_company_name: str
    previous_name_2_con_date: str
    previous_name_2_company_name: str
    previous_name_3_con_date: str
    previous_name_3_company_name: str
    previous_name_4_con_date: str
    previous_name_4_company_name: str
    previous_name_5_con_date: str
    previous_name_5_company_name: str
    previous_name_6_con_date: str
    previous_name_6_company_name: str
    previous_name_7_con_date: str
    previous_name_7_company_name: str
    previous_name_8_con_date: str
    previous_name_8_company_name: str
    previous_name_9_con_date: str
    previous_name_9_company_name: str
    previous_name_10_con_date: str
    previous_name_10_company_name: str
    conf_stmt_next_due_date: str
    conf_stmt_last_made_up_date: str
    persons_with_significant_control: list[PersonWithSignificantControl] | None = None
