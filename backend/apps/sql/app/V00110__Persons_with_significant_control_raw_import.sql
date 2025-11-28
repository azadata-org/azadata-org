-- https://stackoverflow.com/questions/44997087/insert-json-into-postgresql-that-contains-quotation-marks
copy person_with_significant_control_raw (
  record
)
from
  '/app/data/companiesHouse/personsWithSignificantControl.jsonl'
with
  (format csv, quote E'\x01', delimiter E'\x02')
/*
from program
  'sed -e ''s/\\/\\\\/g'' /app/data/companiesHouse/personsWithSignificantControl.jsonl'
*/
;
