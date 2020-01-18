require 'http'

while true
  puts "=+" * 25
  puts "Type 0 (NUMBER) to exit program."
  puts "Type 1 to display all teams."
  puts "Type 2 to filter by city."
  puts "Type 3 to display most loyal and disloyal fanbases."
  puts "=+" * 25
  user_input = gets.chomp

  if user_input == "0"
    puts "=+" * 25
    puts "Exiting Program!"
    break
  elsif user_input == "1"
    response = HTTP.get("http://localhost:3000/api/sports")
    retrieve_all_teams = response.parse(@sports)
    puts "=+" * 25
    puts retrieve_all_teams
  elsif user_input == "2"
    puts "Please enter a city to filter by:"
    city_input = gets.chomp

    response = HTTP.get("http://localhost:3000/api/sports")
    retrieve_team_by_city = response.parse(@sports)

    retrieve_team_by_city.each do |team|
      if team["city"] == "#{city_input}"
        puts "=+" * 25
        puts team
      end
    end

  elsif user_input == "3"
    puts "=+" * 25
    puts "Type 1 for loyal fanbases and 2 for disloyal fanbases"
    puts "=+" * 25
    fanabase_response = gets.chomp

    response = HTTP.get("http://localhost:3000/api/sports")
    fanbase_loyalty = response.parse(@sports)

    sorted_loyal = []
    sorted_disloyal = []

      if fanabase_response == "1"
        fanbase_loyalty.each do |fanbase_hash|
          if fanbase_hash["fanbase_loyalty"] > 6
            sorted_loyal << fanbase_hash
          end
        end
        final_arr_1 = sorted_loyal.sort_by{|fanbase_hash| fanbase_hash["fanbase_loyalty"]}.reverse
        puts final_arr_1
      elsif fanabase_response == "2"
        fanbase_loyalty.each do |fanbase_hash|
          if fanbase_hash["fanbase_loyalty"] <= 6
            sorted_disloyal << fanbase_hash
          end
        end
        final_arr_2 = sorted_disloyal.sort_by{|fanbase_hash| fanbase_hash["fanbase_loyalty"]}
        puts final_arr_2
      end
  else
    puts "=+" * 25
    puts "Unexpected Input! Exiting..."
    break
  end
end