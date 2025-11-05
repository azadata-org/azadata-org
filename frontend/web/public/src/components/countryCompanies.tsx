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
            return <p>{company.name}</p>
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
