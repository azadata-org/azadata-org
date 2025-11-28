-- Copy from CSV
copy country_name (
  alpha_2_code,
  name
)
from
  '/app/data/country_names.csv'
with (format csv, header)
