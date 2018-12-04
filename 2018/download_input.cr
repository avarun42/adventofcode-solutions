require "http/client"
require "json"

class Secrets
    JSON.mapping(session: String)
end

begin
    secrets = File.open("#{__DIR__}/secrets.json") { |file| Secrets.from_json(file) }
    raise ArgumentError.new if ARGV.size != 1
    day = ARGV.first.to_i
rescue ex : JSON::ParseException
    abort("This AdventOfCode 2018 input downloader requires a 'session' key in secrets.json, \
    containing the session token for your AoC account.")
rescue ex : ArgumentError
    abort("This AdventOfCode 2018 input downloader requires a single argument: \
    a valid day for which to download an input.")
end

day_string = sprintf "%02d", day
dir_path = "#{__DIR__}/day#{day_string}"
file_path = "#{dir_path}/input.txt"
abort("Input for day #{day} has already been downloaded.") if File.file?(file_path)

response = HTTP::Client.get(
    "https://adventofcode.com/2018/day/#{day}/input",
    headers: HTTP::Headers{"Cookie" => "session=#{secrets.session}"}
)
if response.status_code == 400
    abort("Your session token is either missing or incorrect.")
elsif response.status_code == 404
    abort("Input for day #{day} is not online yet or does not exist.")
end

Dir.mkdir(dir_path)
File.write(file_path, response.body)
