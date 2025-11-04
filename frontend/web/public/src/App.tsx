import { useAppSelector } from "./app/hooks"
import CountryResults from "./components/countryResults"
import CountrySelect, { getLabelString } from "./components/countrySelect"
import { selectCountryCode } from "./features/country/countrySlice"

export const App = () => {
  const selectedCountry = useAppSelector(selectCountryCode)

  return (
    <div>
      <h1>Foreign Ownership of UK Companies</h1>
      <CountrySelect />
      <h4>
        {selectedCountry
          ? `Selected: ${getLabelString(selectedCountry)}`
          : `Select a country to display company and owner data`}
      </h4>
      <CountryResults />
    </div>
  )
}
