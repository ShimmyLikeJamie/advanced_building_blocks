module Enumerable
  def my_each
   i = 0
   while i < self.length
    if block_given?
      yield(self[i])
    end

    i += 1
   end
  end

  def my_each_with_index
    i = 0
    while i < self.length
      if block_given?
        yield(self[i], i)
      end

      i += 1
    end
  end

  def my_select
    result = []
    self.my_each {|i| result.push(i) if yield(i)}
    result
  end

  def my_all?
    self.my_each {|i| return false unless yield(i)}
    true
  end

  def my_any?
    self.my_each {|i| return true if yield(i)}
    false
  end

  def my_none?
    self.my_each {|i| return false if yield(i)}
    true
  end

  def my_count
    total = 0
    self.my_each {|i| total += 1 if yield(i)}
    total
  end

  def my_map(a_proc = nil)
    arr = []

    if a_proc || block_given?
      self.my_each {|i| arr.push(i) if yield(i)}
    else
      puts "No block given!"
    end
      arr
  end

  def my_inject(val=0)
    accumulator = val
    self.my_each {|i| accumulator = yield(accumulator, i)}
    accumulator
  end

  def multiply_els(arr)
    arr.my_inject(1) {|accumulator, i| accumulator * i}
  end
end

include Enumerable

example_array = [1, 2, 3, 4, 5]

some_proc = Proc.new do |item|
  item % 2 != 0
end

#example_array.my_each do |x|
#  puts "#{x*2}"
#end

#example_array.my_each_with_index do |item, index|
#  puts "The item at index #{index} is #{item}"
#end

#puts example_array.my_select do |item|
#  if item % 2 == 0
#    true
#  else
#    false
#  end
#end

#puts "#{example_array.my_all? do |item|
#  item < 10
#end}"

#puts "#{example_array.my_any? do |item|
#  item > 10
#end}"

#puts "#{example_array.my_none? do |item|
#  item > 10
#end}"

#puts "#{example_array.my_count do |item|
#  item % 2 == 0
#end}"

#puts "#{example_array.my_map do |item|
#  item % 2 != 0
#end}"

#puts "#{example_array.my_inject do |accumulator, item|
#  accumulator += item
#  accumulator
#end}"

#puts "#{multiply_els(example_array)}"

puts "#{example_array.my_map(&some_proc)}"