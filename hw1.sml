fun is_older (date1 : int * int * int, date2 : int * int * int) =
let
  fun month_to_days(month: int) =
  let
    val days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    fun loop(current: int, days: int list) =
      if current = month
      then 0
      else hd days + loop(current + 1, tl days)
  in
    loop(1, days)
  end

  fun date_to_days(date : int * int * int) =
  let
    val year = #1 date
    val month = #2 date
    val day = #3 date
  in
    year * 365 + month_to_days(month) + day
  end
in
  date_to_days(date1) < date_to_days(date2)
end

fun number_in_month(dates: (int * int * int) list, month: int) =
  if null dates
  then 0
  else
    if #2 (hd dates) = month
    then 1 + number_in_month(tl dates, month)
    else number_in_month(tl dates, month)

fun number_in_months(dates: (int * int * int) list, months: int list) =
  if null months
  then 0
  else number_in_month(dates, hd months) + number_in_months(dates, tl months)

fun dates_in_month(dates: (int * int * int) list, month: int) =
  if null dates
  then []
  else
    if #2 (hd dates) = month
    then (hd dates) :: dates_in_month(tl dates, month)
    else dates_in_month(tl dates, month)

fun dates_in_months(dates: (int * int * int) list, months: int list) =
  if null months
  then []
  else dates_in_month(dates, hd months) @ dates_in_months(dates, tl months)

fun get_nth(xs: string list, n: int) =
  if n =1
  then hd xs
  else get_nth(tl xs, n - 1)

fun date_to_string(date: int * int * int) =
let
  val months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
  val year = #1 date
  val month = #2 date
  val day = #3 date
in
  get_nth(months, month) ^ " " ^ Int.toString(day) ^ ", " ^ Int.toString(year)
end

fun number_before_reaching_sum(sum: int, xs: int list) =
let
  fun loop(n: int, acc: int, xs: int list) =
    if acc >= sum
    then n
    else loop(n + 1, acc + hd xs, tl xs)
in
  loop(~1, 0, xs)
end

fun what_month(day: int) =
let
  val days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
in
  number_before_reaching_sum(day, days) + 1
end

fun month_range(day1: int, day2: int) =
  if day1 > day2
  then []
  else what_month(day1) :: month_range(day1 + 1, day2)

fun oldest(dates: (int * int* int) list) =
  if null dates
  then NONE
  else
    let
      val result = oldest(tl dates)
    in
      if isSome(result) andalso is_older(valOf(result), hd dates)
      then result
      else SOME(hd dates)
    end

fun dedupe(xs: int list) =
let
  fun contains(xs: int list, n: int) =
    if null xs
    then false
    else
      if hd xs = n
      then true
      else contains(tl xs, n)
  fun dedupe_helper(xs: int list, uniqs: int list) =
    if null xs
    then uniqs
    else
      if contains(uniqs, hd xs)
      then dedupe_helper(tl xs, uniqs)
      else dedupe_helper(tl xs, (hd xs) :: uniqs)
in
  dedupe_helper(xs, [])
end

fun number_in_months_challenge(dates: (int * int * int) list, months: int list) =
let
  val uniq_months = dedupe(months)
in
  if null uniq_months
  then 0
  else number_in_month(dates, hd uniq_months) + number_in_months(dates, tl uniq_months)
end

fun dates_in_months_challenge(dates: (int * int * int) list, months: int list) =
let
  val uniq_months = dedupe(months)
in
  if null uniq_months
  then []
  else dates_in_month(dates, hd uniq_months) @ dates_in_months_challenge(dates, tl uniq_months)
end

fun reasonable_date(date: int * int * int) =
let
  val year = #1 date
  val month = #2 date
  val day = #3 date
  fun leap_year(year: int) =
    year mod 400 = 0 orelse (year mod 4 = 0 andalso year mod 100 <> 0)
  val leap = leap_year(year)
  val days_leap = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
  val days_non_leap = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
  fun reasonable_month(month: int, day: int, days: int list) =
    if month = 1
    then day > 0 andalso day <= hd days
    else reasonable_month(month - 1, day, tl days)
in
  if year <= 0 orelse month < 1 orelse month > 12
  then false
  else
    if leap
    then reasonable_month(month, day, days_leap)
    else reasonable_month(month, day, days_non_leap)
end
