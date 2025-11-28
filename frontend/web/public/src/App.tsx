import { useAppSelector } from "./app/hooks"
import CountryResults from "./components/countryResults"
import CountrySelect, { getLabelString } from "./components/countrySelect"
import { selectCountryCode } from "./features/country/countrySlice"
import Link from "@mui/material/Link"

export const App = () => {
  const selectedCountry = useAppSelector(selectCountryCode)

  return (
    <div>
      <h1>Foreign Ownership of UK Companies</h1>
      <p>
        Data generated using publicly available
        &nbsp;
        <Link
          target="_blank"
          rel="noopener noreferrer"
          href={'https://download.companieshouse.gov.uk/en_output.html'}
        >
          Basic Company Data
        </Link>
        &nbsp;
        and
        &nbsp;
        <Link
          target="_blank"
          rel="noopener noreferrer"
          href={'https://download.companieshouse.gov.uk/en_pscdata.html'}
        >
          Persons With Significant Control (PSC)
        </Link>
        &nbsp;
        data products published by
        &nbsp;
        <Link
          target="_blank"
          rel="noopener noreferrer"
          href={'https://www.gov.uk/guidance/companies-house-data-products'}
        >
          Companies House
        </Link>
        .
      </p>
      <CountrySelect />
      <h4>
        {selectedCountry
          ? `Selected: ${getLabelString(selectedCountry)}`
          : `Select a country to display company and persons with significant control data`}
      </h4>
      <CountryResults />
    </div>
  )
}
