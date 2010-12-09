range = (1..1000)
averages = 101
scale = nil

def run
  before = Time.now
  `curl -s http://localhost:3000 2>&1`
  $? == 0 ? Time.now - before : -1
end

range.to_a.each {|i|
  duration = (0...averages).to_a.map {|j| run }.sort[averages / 2]
  if scale.nil?
    scale = 20 / duration
  end

  if duration < 0
    puts "#{i.to_s.rjust(5)}: !"
  else
    puts "#{i.to_s.rjust(5)}: #{duration.to_s.ljust(9)[0..4]} #{(['-'] * (duration * scale).floor).join}"
  end
}
