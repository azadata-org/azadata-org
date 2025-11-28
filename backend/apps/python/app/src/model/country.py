from dataclasses import dataclass

@dataclass
class Country:
    """
    Country model
    """

    code_type: str
    english_short_name: str
    french_short_name: str
    alpha_2_code: str
    alpha_3_code: str
    numeric_code: str
    start_date: str
    end_date: str
    alpha_4_code: str
    english_remark: str
    french_remark: str
