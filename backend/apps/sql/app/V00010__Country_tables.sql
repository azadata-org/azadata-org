create table country (
  code_type text not null,
  english_short_name text not null,
  french_short_name text,
  alpha_2_code text not null,
  alpha_3_code text,
  numeric_code text,
  start_date date,
  end_date date,
  alpha_4_code text,
  english_remark text,
  french_remark text
);
