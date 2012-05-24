require "open-uri"
require "nokogiri"
require "json"


def grep_knicks_schedule
    
    ret = {}
    
    #schedule = Nokogiri::HTML(open("http://espn.go.com/nba/team/schedule/_/name/ny/new-york-knicks"))
    schedule = Nokogiri::HTML(open("http://espn.go.com/nba/team/schedule/_/name/ny/seasontype/2/new-york-knicks"))
    
    start = false
    sch = schedule.xpath('//div[@class="mod-content"]/table[@class="tablehead"]/tr')
    sch.each do |game|
      next if start && game['class'] == "colhead"
      
      start = true if (game.at_css('td').text == "Sat, Feb 4")

      if start
        opp = game.at_css('td:nth-child(2) ul.game-schedule li.team-name a').content
        res = game.at_css('td:nth-child(3) ul.game-schedule li.game-status span').content
        sco = game.at_css('td:nth-child(3) ul.game-schedule li.score a').content
        gid = game.at_css('td:nth-child(3) ul.game-schedule li.score a')['href'].gsub(/[^0-9]+/,"")
        ret[gid] = {
          "opponent" => opp,
          "result" => res,
          "score" => sco
        }
      end
    end
    ret
end

games = grep_knicks_schedule

jeremy_lin = {}
jeremy_lin['games'] = games
total_shots = []

games.each { |game_id, info|
  shots = []
  puts "Grabbing data from Knicks vs. #{info["opponent"]} (#{game_id})"
  doc = Nokogiri::XML(open("http://sports.espn.go.com/nba/gamepackage/data/shot?gameId=" + game_id ))
  doc.xpath('//Shot[@p="Jeremy Lin"]').each do |node|
    insert_hash = {}
    node.keys.each {|k|
      insert_hash[k] = node[k]
    }
    shots << insert_hash
    total_shots << insert_hash
  end
  games[game_id]['shots'] = shots
}

File.open('output.json', 'w') {|f| f.write(JSON.pretty_generate(jeremy_lin)) }
File.open('shots.json', 'w') {|f| f.write(JSON.pretty_generate(total_shots)) }
File.open('shots.js', 'w') {|f| f.write("var shots = " + JSON.pretty_generate(total_shots)) }


