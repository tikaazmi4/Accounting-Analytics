#243231041_Atikah azmi
#AA_HW_WEEK 9_page 49-50 (no.1)

#install dplyr > to call nycflights13
install.packages("dplyr")
install.packages("nycflights13")
library("dplyr")
library("nycflights13")
library("tidyverse")
nycflights13::flights
flights

#To see the whole dataset
View(flights)

# a) Had an arrival delay of two or more hours
arr_delay_2ormore <- filter(flights, arr_delay >= 120)
number_of_delayed_flights <- nrow(arr_delay_2ormore)
cat("Number of flights arrival delay of two or more hours:", number_of_delayed_flights)

# b) Flew to Houston (IAH or HOU)
flights_to_houston <- filter(flights, dest %in% c("IAH", "HOU"))
number_flights_to_houston <- nrow(flights_to_houston)
cat("Number of flights to Houston (IAH or HOU):", number_flights_to_houston)

# c) Were operated by United, American, or Delta
selected_airlines <- c("UA", "AA", "DL")
flights_by_UA_AA_DL <- filter(flights, carrier %in% selected_airlines)
number_flights_by_UA_AA_DL <- nrow(flights_by_UA_AA_DL)
cat("Number of flights operated by United, American, or Delta:", number_flights_by_UA_AA_DL)

# d) Departed in summer (July, August, and September)
summer <- c(7,8,9)
flights_departure_summer <- filter(flights, month %in% summer)
number_flights_departure_summer <- nrow(flights_departure_summer)
cat("Number of flights departed in summer:", number_flights_departure_summer)

# e) Arrived more than two hours late, but didn’t leave late
flights_arr_2hourslate <- filter(flights, arr_delay > 120, dep_delay <= 0)
number_arr_2hourslate_but_no_depart_delay <- nrow(flights_arr_2hourslate)
cat("Number of Arrived more than two hours late, but didn’t leave late:", number_arr_2hourslate_but_no_depart_delay)

# f)	Were delayed by at least an hour, but made up over 30 minutes in flight
#inflight=dipercepat lebih dari 30 mnt 
#inflight>30 mnt
#inflight <- dep-arr kalo ada delay jadi dep_delay - arr_delay
delay_recover30minutes <- filter(flights, dep_delay >= 60, dep_delay - arr_delay > 30)
number_delay_recover30minutes <- nrow(delay_recover30minutes)
cat("Number of flights Were delayed by at least an hour, but made up over 30 minutes:", number_delay_recover30minutes)

#g)	Departed between midnight and 6 a.m. (inclusive)
#to know how dataset write midnight
summary(flights$dep_time)

#midnight = 2400, 6 am = 600
#to change 2400 to 0 use %%
# %% resultnya akan menunjukkan sisa pembagian -> dijadikan time stamp
flight_between_midnight_6am <- filter(flights, dep_time %% 2400 <= 600)
number_flight_between_midnight_6am <- nrow(flight_between_midnight_6am)
cat("Number of flights Were delayed by at least an hour, but made up over 30 minutes:", number_flight_between_midnight_6am)
