from dataclasses import dataclass

from src.model.company import Company

@dataclass
class CompanyReason(Company):
    """
    Company model
    """

    reasons: str | None = None
