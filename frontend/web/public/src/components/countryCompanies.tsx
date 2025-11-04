import { CountryCode } from "../data/countryCodes"

type CountryCompaniesProps = {
  countryCode: CountryCode
}

export default function CountryCompanies(props: CountryCompaniesProps) {
  return (
    <>
      No company results found for country: {props.countryCode.englishShortName}
    </>
  )
}
