require 'pry-byebug'

module Sort
  def self.selection_sort(arr)
    array = arr
    if array.size <= 1
      return array
    end

    for j in 0...array.size
# binding.pry
      swap_small(array, j)
    end

    array

  end

  def self.swap_small(array, j)
    min = array[j]
    min_index = j
    for i in j...array.size
      if array[i] < min
        min = array[i]
        min_index = i
      end
    end
    array[min_index] = array[j]
    array[j] = min
  end
end