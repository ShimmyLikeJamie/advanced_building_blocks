def bubble_sort_by (arr)

  sorted = false
  passes = 0
  swaps = 0

  while (sorted == false)
    i = 0

    while i < arr.length - 1 - passes

      if block_given?
        if yield(arr[i], arr[i + 1]) > 0
          arr[i], arr[i + 1] = arr[i + 1], arr[i]
          swaps += 1
        end
      else
        if arr[i] > arr[i + 1]
          arr[i], arr[i + 1] = arr[i + 1], arr[i]
          swaps += 1
        end
      end

      i += 1
    end

    if swaps == 0
      sorted = true
    else
      swaps = 0
    end

    passes += 1
  end
  arr
end

example_array = ["word", "hey", "abe", "beeetch", "work", "please"]

puts bubble_sort_by(example_array) do |left, right|
  left.downcase <=> right.downcase
end