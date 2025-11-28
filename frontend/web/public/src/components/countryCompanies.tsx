import { useAppSelector } from "../app/hooks"
import { CountryCode } from "../data/countryCodes"
import { useGetCompaniesQuery } from "../features/api/apiSlice"
import { selectCountryCode } from "../features/country/countrySlice"
import Chip from "@mui/material/Chip"
import Link from "@mui/material/Link"
import CloudDownloadIcon from "@mui/icons-material/CloudDownload"
import Grid from "@mui/material/Grid"
import PersonIcon from '@mui/icons-material/Person';

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
        <div>
          <div>Found {data.length} records</div>
          <div>
            &nbsp;
            <Link
              target="_blank"
              rel="noopener noreferrer"
              href={`/uk/companies-house/basic-company-data/${selectedCountryCode.alpha2Code}.json`}
            >
              <CloudDownloadIcon /> Download data as JSON
            </Link>
          </div>
          <hr />
          {data.map(company => {
            return (
              <div>
                <div>
                  {company.name}
                  &nbsp;
                  <Chip
                    size="small"
                    color={
                      company.status.toLowerCase() == "active"
                        ? "success"
                        : "error"
                    }
                    label={company.status}
                  />
                  &nbsp;
                  <Chip
                    size="small"
                    label={company.reasons}
                  />
                </div>
                <div>
                  <Link
                    target="_blank"
                    rel="noopener noreferrer"
                    href={
                      "https://find-and-update.company-information.service.gov.uk/company/" +
                      company.number
                    }
                  >
                    <small>{company.number}</small>
                  </Link>
                  &nbsp; | &nbsp; <small>{company.registered_address}</small>
                </div>
                <Grid container spacing={2}>
                  {
                    company.persons_with_significant_control &&
                    company.persons_with_significant_control.map(psc => {
                      if (!psc.name) {
                        return <></>
                      }
                      return (
                        <Grid size={2}>
                          <span>{ psc.nationality && <PersonIcon />}{psc.name}</span><br />
                          { psc.nationality &&
                            <><span>Nationality: {psc.nationality}</span><br /></>
                          }
                          { psc.country_of_residence &&
                            <><span>Country of residence: {psc.country_of_residence}</span><br /></>
                          }
                          { psc.identification_country_registered &&
                            <><span>ID country registered: {psc.identification_country_registered}</span><br /></>
                          }
                          { psc.address_country &&
                            <><span>Address country: {psc.address_country}</span><br /></>
                          }
                          { psc.principal_office_address_country &&
                            <><span>Principal office address country: {psc.principal_office_address_country}</span><br /></>
                          }
                        </Grid>
                        )
                      })
                    }
                </Grid>
                <hr />
              </div>
            )
          })}
        </div>
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
