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
end

include Enumerable

example_array = [1, 2, 3, 4, 5]

#example_array.my_each do |x|
#  puts "#{x*2}"
#end

example_array.my_each_with_index do |item, index|
  puts "The item at index #{index} is #{item}"
end