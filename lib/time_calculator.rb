# frozen_string_literal: true
class TimeCalculator

  def calculate_hours(add_min)
    day = 24
    # clock goes forward by default
    hours = add_min / 60

    # strip out days
    days = hours / day
    if days > 0
      hours_minus_days = hours - (days * day)
      return hours_minus_days
    end
    if hours > 12
      hours_minus_days = hours - (days * day)
      time = hours_minus_days - day
      return time
    end
     hours
  end

  def calculate_mins(add_min)
    mins = add_min % 60
    mins
  end

  def find_hour(time)
    split_time = time.split(":")
    split_time[0].to_i
  end

  def find_min(time)
    split_time = time.split(":")
    min_period = split_time[1]
    min = min_period.split(" ")
    min[0].to_i
  end

  def find_period(time)
    split_time = time.split(":")
    period_min = split_time[1]
    period = period_min.split(" ")
    period[1]
  end

  def calculate_period(new_hours, start_hours, period_bool)
    if new_hours + start_hours >= 12
      if period_bool
          return  "PM"
       else
          return "AM"
      end
    end
  end

  def add_minutes(time, add_min)
    # Ruby does not seem to support unsigned int in the way something like C or Go does.
    # In the spirit of using an unsigned int i'm checking to make sure that the value is not negative
    raise 'add_min must be larger than zero' if add_min.negative?

    # Parse time string
    start_hour = find_hour(time)
    start_min = find_min(time)
    period = find_period(time)

    # Track period
    if period.include? 'AM'
      period_track = true
    else
      period_track = false
    end

    #get totally of hours
    add_hours = calculate_hours(add_min)
    new_hour = add_hours + start_hour

    #get total of mins
    add_minutes = calculate_mins(add_min)
    new_mins = add_minutes + start_min

    #check if mins over 1 hour: if so add that to n_hour and get minutes
    if new_mins > 59
      h_min = n_mins / 60
      new_hour + h_min
      new_mins - 60
    end

    # find the period
    period = calculate_period(new_hour, start_hour, period_track) if new_hour >= 12 && add_hours > 1

    #see if we need to adjust the hour
    if new_hour > 12
      new_hour= new_hour - 12
    end

    # turn hour into string
    s_new_hour = new_hour.to_s
    if s_new_hour.length < 2
      s_new_hour = '0' + s_new_hour
    end

    # turn min into string
    s_new_mins = new_mins.to_s
    if s_new_mins.length < 2
      s_new_mins = '0' + s_new_mins
    end

    s_new_hour + ":" + s_new_mins + ' ' + period
  end

end
