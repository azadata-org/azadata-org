import { CountryCode } from "../data/countryCodes"

type CountryPeopleWithSignificantControlProps = {
  countryCode: CountryCode
}

export default function CountryPeopleWithSignificantControl(
  props: CountryPeopleWithSignificantControlProps,
) {
  return (
    <>
      No people with significant control found for country:{" "}
      {props.countryCode.englishShortName}
    </>
  )
}
