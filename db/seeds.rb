# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
FFNerd.api_key = "InsertAPIKeyHere"
players = FFNerd.players
teams = FFNerd.teams
players.select! {|player| player.active == "1" }
players.select! {|player| player.position != "K" && player.position != "DEF" }
players.each {|player| Player.create(name: player[:displayName], position: player[:position], nfl_team_code: player[:team], nfl_team_name: teams.find {|team| team.code == player[:team]}.full_name)}
completed_game_weeks = 3
(1..completed_game_weeks).each do |week|
    table = CSV.parse(File.read("storage/points_week_#{week}.csv"), headers: true)
    table.each do |row|
        player = Player.find_by(name: row[1])
        if player
            Week.create(player_id: player.id, game_week: week, score: row[4])
        end
    end
end
Player.update_salary_modifiers
admin = User.create(username: "admin", password_digest: "admin", balance: 0, email: "admin@admin.com", admin: true )

 