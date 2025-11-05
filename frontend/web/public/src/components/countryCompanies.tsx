import { useAppSelector } from "../app/hooks"
import { CountryCode } from "../data/countryCodes"
import { useGetCompaniesQuery } from "../features/api/apiSlice"
import { selectCountryCode } from "../features/country/countrySlice"

type CountryCompaniesProps = {
  countryCode: CountryCode
}

export default function CountryCompanies(props: CountryCompaniesProps) {
  const selectedCountryCode = useAppSelector(selectCountryCode)
  if (selectedCountryCode) {
    const { data, isError, isLoading, isSuccess } = useGetCompaniesQuery(
      selectedCountryCode.alpha2Code,
    )
    if (isLoading) {
      return <>Loading...</>
    }
    if (isError) {
      return <>Error loading records</>
    }
    if (isSuccess && data) {
      return (
        <>
          {data.map(company => {
            return (
              <div>
                <div>{company.name}</div>
                <div>
                  <a
                    target="_blank"
                    rel="noopener noreferrer"
                    href={
                      "https://find-and-update.company-information.service.gov.uk/company/" +
                      company.number
                    }
                  >
                    <small>{company.number}</small>
                  </a>
                  &nbsp; | &nbsp; <small>{company.registered_address}</small>
                </div>
                <hr />
              </div>
            )
          })}
        </>
      )
    }
    return (
      <>
        No company results found for country:{" "}
        {props.countryCode.englishShortName}
      </>
    )
  }
}
