import Grid from "@mui/material/Grid"
import CountryCompanies from "./countryCompanies"
import CountryPeopleWithSignificantControl from "./countryPeopleWithSignificantControl"
import { useAppSelector } from "../app/hooks"
import { selectCountryCode } from "../features/country/countrySlice"

export default function CountryResults() {
  const selectedCountry = useAppSelector(selectCountryCode)

  return (
    selectedCountry && (
      <Grid container spacing={2}>
        <Grid size={6}>
          <CountryCompanies countryCode={selectedCountry} />
        </Grid>
        <Grid size={6}>
          <CountryPeopleWithSignificantControl countryCode={selectedCountry} />
        </Grid>
      </Grid>
    )
  )
}
