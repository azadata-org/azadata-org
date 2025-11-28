copy country (
  code_type,
  english_short_name,
  french_short_name,
  alpha_2_code,
  alpha_3_code,
  numeric_code,
  start_date,
  end_date,
  alpha_4_code,
  english_remark,
  french_remark
)
from
  '/app/data/iso_3166_countries.csv'
with (format csv, header, NULL "NULL")
