// Need to use the React-specific entry point to import `createApi`
import { createApi, fetchBaseQuery } from "@reduxjs/toolkit/query/react"

type Company = {
  payload_uid: string
  number: string
  name: string
  status: string
  category: string
  registered_address: string
  country_of_origin: string
}

// Define a service using a base URL and expected endpoints
export const apiSlice = createApi({
  baseQuery: fetchBaseQuery({ baseUrl: "/" }),
  reducerPath: "api",
  // Tag types are used for caching and invalidation.
  tagTypes: ["Companies"],
  endpoints: build => ({
    getCompanies: build.query<Company[], string>({
      query: alpha2CountryCode =>
        `uk/companies-house/basic-company-data/${alpha2CountryCode}.json`,
      // `providesTags` determines which 'tag' is attached to the
      // cached data returned by the query.
      providesTags: (_result, _error, uid) => [{ type: "Companies", uid }],
    }),
  }),
})

export const { useGetCompaniesQuery } = apiSlice
