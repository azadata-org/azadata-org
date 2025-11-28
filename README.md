Azadata is an open data platform for public data.

Currently, UK Company data published by [Companies House](https://www.gov.uk/guidance/companies-house-data-products) is available.

```shell
export COMPANIES_HOUSE_BASIC_COMPANY_DATA_CSV_PATH="/path/to/BasicCompanyDataAsOneFile-2025-11-01.csv"
export COMPANIES_HOUSE_PERSONS_WITH_SIGNIFICANT_CONTROL_JSONL_PATH="/path/to/persons-with-significant-control-snapshot-2025-11-02.txt"
docker compose up
```

Processed JSON outputs will be placed in `frontend/web/public/public/uk/companies-house`.

To launch the frontend locally, run:
```shell
# navigate to frontend
cd frontend/web/public

# Launch frontend with
npm start
```
