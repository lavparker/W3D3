require "byebug"

def range(start, last)
  return [] if last < start
  return [] if start == last

  range_arr = []

  range_arr.unshift(start).concat(range(start + 1, last))

  range_arr

end

# p range(1, 5)
# p range(1, 10)
# p range(7, 3)
# p range(5, 5)

def sum_arr1(arr)
  sum = 0

  arr.each do |num|
    sum += num
  end

  sum
end

# p sum_arr1([2,4,6,8])

def sum_arr_rec(arr)
  return 0 if arr.empty?

  sum =  arr[-1] + sum_arr_rec(arr[0..-2])
end

# p sum_arr_rec([2,4,6,8])
# p sum_arr_rec([])


def exp1(base, exp)

  return 1 if exp == 0
  return nil if exp < 0

  base * exp1(base, exp - 1)
end

# p exp1(2, 5)
# p exp1(3, 3)
# p exp1(20, 0)
# p exp1(2, -1)
# p exp1(2, 256)



def exp2(base, exp)

  return 1 if exp == 0 
  return base if exp == 1 
  return nil if exp < 0 

   if exp.even?
    exp2(base, exp / 2) ** 2
   else
    base * (exp2(base, (exp - 1) / 2) ** 2) 
   end

end

#  p exp2(2, 5)
#  p exp2(3, 3)
#  p exp2(20, 0)
#  p exp2(2, -1)
#  p exp2(2, 256)
#  p exp2(0, 3)


def deep_dup(arr)
  return [] if !arr.is_a?(Array)
  
  duped_arr = []

  arr.each do |sub|
    if !sub.is_a?(Array)
      duped_arr << sub
    else
      duped_arr << (deep_dup(sub))
    end
  end

  duped_arr
end

# p deep_dup([1, [2], [3, [4]] ])

def fib_iter(n)
  fibs = [0, 1]

  while n >= fibs.length 
    fibs << fibs[-2] + fibs[-1]
  end
  fibs 
end

# p fib_iter(10)

def fib_rec(n)
  return [0] if n == 1
  return [0, 1] if n == 2

  fibs = fib_rec(n - 1)

  fibs << fibs[-1] + fibs[-2]
  
end

p fib_rec(5)
p fib_rec(4)
p fib_rec(3)
p fib_rec(1)
p fib_rec(2)
p fib_rec(10)


def bsearch(arr, val)
  return nil if arr.empty?
  return nil if arr.length == 1 && arr[0] != val
  
  mid_idx = arr.length / 2

  subarr_1 = arr[0...mid_idx]

  subarr_2 = arr[mid_idx..-1]

  if arr[mid_idx] == val
    return mid_idx
  elsif arr[mid_idx] > val
    bsearch(subarr_1, val)
  elsif arr[mid_idx] < val
    bsearch(subarr_2, val)
  end


end

p bsearch([1, 2, 3], 1) # => 0
p bsearch([2, 3, 4, 5], 3) # => 1
p bsearch([2, 4, 6, 8, 10], 6) # => 2
p bsearch([1, 3, 4, 5, 9], 5) # => 3
p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil