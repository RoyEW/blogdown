library(tidyverse)
library(lubridate)
shift_start <- ymd_hm(202107070720)
shift_end <- ymd_hm(202107072030)
day_start <- ymd_hm(202107070700)
day_end <- ymd_hm(202107071900)


min(shift_end,shift_start)
get_day_hours <- function(start_stamp, end_stamp, day_start, day_end){
  difftime(max(start_stamp,day_start),min(end_stamp,day_end),units = "secs")
}

get_day_hours(shift_start, shift_end, day_start, day_end) |> as.numeric() |> abs()
hw <- "111 Clinician - homeworking"

ifelse(str_detect(duty_station,"Home")==TRUE | str_detect(duty_station,"£")==FALSE)

str_detect(hw, "home")

mutate(`Weekday HW` = case_when(ifelse(str_detect(duty_station,"Home")==TRUE | str_detect(duty_station,"£")==FALSE,TRUE,FALSE) == TRUE ~ day_hours,
                               TRUE ~ 0))
mutate(`Night HW` = case_when(str_detect(duty_station,"Home")==TRUE ~ night_hours,
                                TRUE ~ 0))
