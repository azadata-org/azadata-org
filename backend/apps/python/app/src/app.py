"""
Application entry point
"""

import logging
from pathlib import Path
from json import dumps
from dataclasses import asdict
from src.model.company_reason import CompanyReason
from src.model.country import Country
from src.service.db.service import Db

class App:
    """
    Application class
    """

    def __init__(self) -> None:
        logging.info('Starting application')
        self.db = Db()



    def process_country_companies(self, alpha_2_code: str) -> None:
        """
        Given a country code, retrieve the companies for that country as well as companies that have
        PSCs from that country.
        """

        sql = """
            select
                country_company_reason.reasons,
                company.*
            from
            (
                select
                    number,
                    string_agg(DISTINCT reason, ', ') AS reasons
                from (
                    -- basic company data - country of origin
                    select
                        number,
                        'company-country-of-origin' as reason
                    from
                        company
                    where
                        country_of_origin_country_alpha_2_code = %(alpha_2_code)s
                    -- basic company data - registered address country
                    union
                    select
                        number,
                        'company-registered-address-country' as reason
                    from
                        company
                    where
                        registered_address_country_alpha_2_code = %(alpha_2_code)s
                    -- PSC - nationality
                    union
                    select
                        company_number as number,
                        'psc-nationality' as reason
                    from
                        person_with_significant_control
                    where
                        nationality_alpha_2_code = %(alpha_2_code)s
                    -- PSC - country of residence
                    union
                    select
                        company_number as number,
                        'psc-country-of-residence' as reason
                    from
                        person_with_significant_control
                    where
                        country_of_residence_alpha_2_code = %(alpha_2_code)s
                    -- PSC - identification country registered
                    union
                    select
                        company_number as number,
                        'psc-identification-country-registered' as reason
                    from
                        person_with_significant_control
                    where
                        identification_country_registered_alpha_2_code = %(alpha_2_code)s
                    -- PSC - address country
                    union
                    select
                        company_number as number,
                        'psc-address-country' as reason
                    from
                        person_with_significant_control
                    where
                        address_country_alpha_2_code = %(alpha_2_code)s
                    -- PSC - principal office address country
                    union
                    select
                        company_number as number,
                        'psc-principal-office-address-country' as reason
                    from
                        person_with_significant_control
                    where
                        principal_office_address_country_alpha_2_code = %(alpha_2_code)s
                )
                group by number
            ) as country_company_reason
            inner join
                company
            using (
                number
            )
        """

        cursor = self.db.get_class_cursor(cls=CompanyReason)

        cursor.execute(sql, params={'alpha_2_code': alpha_2_code})
        companies = cursor.fetchall()

        # Build output path
        output_path = Path('/app/data/output').joinpath(f'{alpha_2_code}.json')
        logging.info('Writing output file %s', output_path)

        file_handle = open(file=output_path, mode='w', encoding='utf8')
        file_handle.writelines('[\n')

        first_record = True
        for company in companies:
            if first_record:
                first_record = False
            else:
                file_handle.writelines(',\n')

            # Write each company record
            file_handle.writelines(dumps(asdict(company), default=str))
            file_handle.flush()

        file_handle.writelines('\n]')
        file_handle.close()



    def run(self) -> None:
        """
        Main application entrypoint
        """

        cursor = self.db.get_class_cursor(cls=Country)

        cursor.execute('select * from country')

        countries = cursor.fetchall()

        # Process all non-GB countries
        for country in countries:
            if country.alpha_2_code != 'GB':
                logging.info('Processing country %s', country.alpha_2_code)
                self.process_country_companies(alpha_2_code=country.alpha_2_code)
