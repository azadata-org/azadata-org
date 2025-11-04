import getUnicodeFlagIcon from "country-flag-icons/unicode"
import { Autocomplete, Box, TextField } from "@mui/material"
import { CountryCode, countryCodes } from "../data/countryCodes"
import { useAppDispatch } from "../app/hooks"
import { setCountryCode } from "../features/country/countrySlice"
import { SyntheticEvent, ReactElement } from "react"

export function getLabelString(countryCode: CountryCode): string {
  let output = getUnicodeFlagIcon(countryCode.alpha2Code)
  output += " "
  output += countryCode.englishShortName
  return output
}

export function getLabel(countryCode: CountryCode): ReactElement {
  return (
    <>
      {getUnicodeFlagIcon(countryCode.alpha2Code)}
      &nbsp;
      {countryCode.englishShortName}
    </>
  )
}

export default function CountrySelect() {
  const dispatch = useAppDispatch()

  const onChangeHandler = function (
    event: SyntheticEvent,
    value: CountryCode | null,
  ) {
    console.debug(event)
    if (value) {
      dispatch(setCountryCode(value))
    } else {
      dispatch(setCountryCode(undefined))
    }
  }

  return (
    <Autocomplete
      id="country-select"
      sx={{ width: 300 }}
      options={countryCodes}
      autoHighlight
      getOptionLabel={getLabelString}
      onChange={onChangeHandler}
      renderOption={(props, option) => {
        const { key, ...optionProps } = props
        return (
          <Box key={key} component="li" {...optionProps}>
            {getLabel(option)}
          </Box>
        )
      }}
      renderInput={params => (
        <TextField
          {...params}
          label="Choose a country"
          slotProps={{
            htmlInput: {
              ...params.inputProps,
              autoComplete: "new-password", // disable autocomplete and autofill
            },
          }}
        />
      )}
    />
  )
}
