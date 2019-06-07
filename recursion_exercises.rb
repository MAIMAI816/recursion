require "byebug"

def range(start_num, end_num)
    return start_num if start_num >= end_num
    [start_num, range(start_num+1, end_num)]
end

# def range(start_num, end_num)
#     arr = []
#     (start_num..end_num).each { |num| arr << num }
#     arr
# end

# puts range(2,4)
# puts range(1,6)

def exp(b, n)
    return 1 if n == 0
    b * exp(b, n - 1)
end

def exp(b, n)
    return 1 if n == 0
    if n.even?
        return exp(b, n / 2) * exp(b, n / 2)
    else
        return b * (exp(b, (n - 1) / 2) * exp(b, (n - 1) / 2))
    end
end

#puts exp(2,5)

def deep_dup(arrays)
    new_arr = []
    arrays.each do |arr| 
        if arr.is_a?(Array)
            new_arr << deep_dup(arr)
        else
            new_arr << arr
        end
    end
    new_arr
end


# robot_parts = [
#   ["nuts", "bolts", "washers"],
#   ["capacitors", "resistors", "inductors"]
# ]
# puts deep_dup(robot_parts)

def fibonacci(n)
    return [0] if n == 0
    return [0,1] if n == 1
    return fibonacci(n-1) << (fibonacci(n-1).last + fibonacci(n-2).last)
    #didn't figure out the way to put it in array
end

# f(4) = f(3) + f(2) + f(1) + f(0) = [0,1,1,2]
# f(3) = f(2) + f(1) + f(0) = [0,1,1] = 2
# f(2) = f(1) + f(0) = [0,1] = 1
# f(1) = [0,1]
# f(0) = [0]
# f(2) = fibonacci(1) << f(1).last + f(0).last = [0,1] << [0+1] = [0,1,1]
# f(3) = f(2) << f(2).last + f(1).last = [0,1,1] << 2


# print fibonacci(0)
# print fibonacci(3)
# print fibonacci(5)

def bsearch(array, target)
    return nil unless array.include?(target)
    mid_value = array[array.length / 2]
    return array.index(mid_value) if mid_value == target 
    next_array = []
    index_num = 0
    large = array.select { |num| num > mid_value }
    small = array.select { |num| num < mid_value}
    if mid_value < target
        next_array = large
        index_num = small.length + 1
    else
        next_array = small
    end
    return bsearch(next_array, target) + index_num
end

# puts bsearch([1, 2, 3], 1)
# puts bsearch([2, 3, 4, 5], 3)
# puts bsearch([2, 4, 6, 8, 10], 6)
# puts bsearch([1, 3, 4, 5, 9], 5)
# puts bsearch([1, 2, 3, 4, 5, 6], 6)
# puts bsearch([1, 2, 3, 4, 5, 6], 0) 
# puts bsearch([1, 2, 3, 4, 5, 7], 6)

def merge(left, right)
    new_arr = []
    merge_arr = left + right
    while !left.empty? && !right.empty?
        #debugger if merge_arr == [5, 6, 1, 3]
        begin
            if left[0] > right[0]
                new_arr << right[0]
                right.shift
            else
                new_arr << left[0]
                left.shift
            end
        rescue
            debugger
        end
        merge_arr = left + right
    end
    new_arr + merge_arr
end

def merge_sort(arr)
    return arr if arr.length == 1
    left,right = arr.each_slice((arr.size/2).round).to_a
    merge(merge_sort(left),merge_sort(right))
end


#print merge_sort([6,5,3,1,8,7,2,4])

def split(arr)
    return arr if arr.length == 1
    left,right = arr.each_slice( (arr.size/2.0).round).to_a
    split(left) + split(right)
end

def subsets(arr)
    return [[]] if arr.empty?
    subsets(arr[0...-1]) + (subsets(arr[0...-1]).map {|sub_arr| sub_arr << arr.last })
end

# puts subsets([]) # => [[]]
# puts subsets([1]) # => [[], [1]]
# print subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# puts
# print subsets([1, 2, 3]) # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]
# puts
# print subsets([1, 2, 3, 4]) # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3], [4], [1,4], [2,4], [3,4], [1,2,4], [2,3,4], [1,3,4], [1,2,3,4]]

def permutations(arr)
    return [arr] if arr.length == 1
    new_arr = []
    permutations(arr[0...-1]).each do |sub_arr|
            sub_arr << arr.last
        begin
            (0...arr.length).each do |idx|
               # debugger if arr == [1,2,3]
                rotated = sub_arr.rotate(idx)
                new_arr << rotated
            end
        rescue
            debugger
        end
    end
    new_arr   
end


# print permutations([1,2,3,4])
# puts
# print permutations([1,2])
# puts
# print permutations([1]) 

# [1, 2] -> [1, 2, 3], [1, 3, 2], [3,1,2]

# 1
# [1]

# 2
# [1, 2]
# [2, 1]

# 6
# [1, 2, 3]
# [1, 3, 2]
# [2, 1, 3]
# [2, 3, 1]
# [3, 1, 2]
# [3, 2, 1]

# 24 
# [1, 2, 3, 4],
# [1, 2, 4, 3],
# [1, 3, 2, 4],
# [1, 3, 4, 2],
# [1, 4, 2, 3],
# [1, 4, 3, 2],
# [2, 1, 3, 4],
# [2, 1, 4, 3],
# [2, 3, 1, 4],
# [2, 3, 4, 1],
# [2, 4, 1, 3],
# [2, 4, 3, 1],
# [3, 1, 2, 4],
# [3, 1, 4, 2],
# [3, 2, 1, 4],
# [3, 2, 4, 1],
# [3, 4, 1, 2],
# [3, 4, 2, 1],
# [4, 1, 2, 3],
# [4, 1, 3, 2],
# [4, 2, 1, 3],
# [4, 2, 3, 1],
# [4, 3, 1, 2],
# [4, 3, 2, 1]

# 4*3*2*1

# def make_greedy_change(amount, coins = [25, 10, 5, 2])
#     return Array.new(amount/(coins.first), coins.first) if coins.length == 1 || amount == 0
#     selected_coins = coins.select { |coin| amount >= coin }
#     selected_coin = selected_coins.max
#     remainder = amount - selected_coin
#     if remainder == 0
#         remainder = amount 
#         selected_coins = [selected_coin]
#         make_greedy_change(remainder, selected_coins)
#     else 
#         [selected_coin] + make_greedy_change(remainder, selected_coins)  
#     end
# rescue
#     debugger
# end

def make_greedy_change(amount, coins)
    return [] if amount <= 0 || coins.length < 1
    remainder = amount % coins[0]
    Array.new(amount/coins[0], coins[0]) + make_greedy_change(remainder, coins[1..-1])
end

def make_better_change(amount, coins)
    debugger
    return [] if amount <= 0 || coins.length < 1
    possibilities = Array.new
    coins.each do |coin|
        next if (amount - coin) < 0 
        selected_coins = coins.select { |c| c <= coin && c <= amount}
        possibilities << [coin] + make_better_change(amount - coin, selected_coins)
    end
    possibilities.sort_by { |possibility| possibility.length }.first
end

print make_better_change(25, [27, 10,4,1])

# 25, [10, 4, 1]
# 10
# 

# puts
# print make_greedy_change(25)
# puts
# print make_greedy_change(39)
# puts
# print make_greedy_change(5)

# 39 / 25 = 14
# 14 / 10 = 4
# 4 / 1 = 4
# [1,1,1,1]

#[25] + make change(14) [25,10,5,1]
#[10] + make change(4) [10,5,1]
#[4] + make_change(4) [1]