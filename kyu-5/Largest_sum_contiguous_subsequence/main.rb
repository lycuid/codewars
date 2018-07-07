# https://www.codewars.com/kata/56001790ac99763af400008c

def largest_sum(l)
  maximum = max_end = 0
  for i in 0..l.length-1
    max_end = max_end + l[i]
    if max_end < 0
      max_end = 0
    elsif maximum < max_end
      maximum = max_end
    end
  end
  return maximum
end