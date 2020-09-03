require 'regexp-examples'

DEFAULT_COUNT = 100
DEFAULT_PATTERN = /^[0-9]{16},[0-9]{6},[0-9]{4}$/

i = 0
params = {
  count: DEFAULT_COUNT,
  pattern: DEFAULT_PATTERN
} 
while ARGV.count / 2 > i
  case ARGV[i * 2]
  when '-c' then
    params[:count] = ARGV[i * 2 + 1].to_i
  when '-p' then
    params[:pattern] = ARGV[i * 2 + 1]
  else
    raise "ruby #{$PROGRAM_NAME} [-c count-number | -p Pattern]"
  end
  i += 1
end

params[:count].times do
  puts Regexp.new(params[:pattern]).random_example
end
