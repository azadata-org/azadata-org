import type { PayloadAction } from "@reduxjs/toolkit"
import { createAppSlice } from "../../app/createAppSlice"
import { CountryCode } from "../../data/countryCodes"

export type CountryState = {
  countryCode: CountryCode | undefined
}

const initialState: CountryState = {
  countryCode: undefined,
}

export const countrySlice = createAppSlice({
  name: "country",
  initialState,
  reducers: create => ({
    setCountryCode: create.reducer(
      (state, action: PayloadAction<CountryCode | undefined>) => {
        state.countryCode = action.payload
      },
    ),
  }),
  selectors: {
    selectCountryCode: slice => slice.countryCode,
  },
})

// Action creators are generated for each case reducer function.
export const { setCountryCode } = countrySlice.actions

// Selectors returned by `slice.selectors` take the root state as their first argument.
export const { selectCountryCode } = countrySlice.selectors
