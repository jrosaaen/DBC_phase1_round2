def binary_search(num, ary)
  result = 0
  low = 0
  high = ary.length - 1 #6

  while low <= high
    middle = (high+low) / 2 # 3 + 0

     if ary[middle] < num #get rid of left side
      low = middle
     elsif ary[middle] > num #get rid of right side
      high = middle
     else
      result = middle
      return result
     end
  end
end



def assert
  raise "error" unless yield
  return true
end

test_array = (100..200).to_a

p assert { binary_search(32, [13, 19, 24, 29, 32, 37, 43]) == 4 }
p assert { binary_search(135, test_array) == 35 }
current_time = Time.now
p binary_search(32, [13, 19, 24, 29, 32, 37, 43])
p current_time-Time.now