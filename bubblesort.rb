def bubble_sort (arr)
  sorted = false
  passes = 0
  swaps = 0

  while (sorted == false)
    i = 0

    while i < arr.length - 1 - passes

      if arr[i] > arr[i + 1]
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        swaps += 1
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

  example_one = [1, 3, 6, 2, 9]
  example_two = [2, 0, 20, 100, 3]
  example_three = [3, 4, 6, 1, 0]

  puts "#{bubble_sort(example_one)}"
  puts "#{bubble_sort(example_two)}"
  puts "#{bubble_sort(example_three)}"