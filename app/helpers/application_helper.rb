module ApplicationHelper

  def get_season()
    time = Time.new

    if(time.month >= 3) && (time.month <= 5)
      "Spring"
    elsif(time.month > 5) && (time.month <= 8)
      "Summer"
    elsif(time.month > 8) && (time.month <= 12)
      "Autumn"
    else
      "Winter"
    end
  end

  def get_random_number(max_value)
    rand(max_value)
  end

  def get_random_welcome()
    opening = ["What a beautiful day. ", "Welcome to our site. ", "Thanks for stopping by. "]
    middle = ["We hope you find our site useful. ", "If there is anything you need just ask. ", "Take a look. "]
    ending = ["Happy hunting!", "Good luck!", "Bon chance!"]
    opening[get_random_number(opening.length)] +
    middle[get_random_number(middle.length)] +
    ending[get_random_number(ending.length)]
  end
end
