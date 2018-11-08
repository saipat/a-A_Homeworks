require 'byebug'
# Sluggish Octopus
# Find the longest fish in O(n^2) time. Do this by comparing all fish lengths to all other fish lengths

def sluggish_octopus(fishes)
  # debugger
  max_length = fishes[0].length
  max_fish = fishes[0]
  fishes.each_with_index do |fish1, idx1|
    (idx1+1).upto(fishes.length) do|fish2|
      if max_length < fish2
        max_length = fish2
        max_fish = fishes[fish2]
      else
        max_length = fish1.length
        max_fish = fish1
      end
    end
  end
  max_fish
end

class Array
def merge_sort(&blk)
   blk ||= Proc.new { |x, y| x <=> y }

   return self if count <= 1

   midpoint = count / 2
   sorted_left = self.take(midpoint).merge_sort(&blk)
   sorted_right = self.drop(midpoint).merge_sort(&blk)

   Array.merge(sorted_left, sorted_right, &blk)
 end

 private
 def self.merge(left, right, &blk)
   merged = []

   until left.empty? || right.empty?
     case blk.call(left.first, right.first)
     when -1
       merged << left.shift
     when 0
       merged << left.shift
     when 1
       merged << right.shift
     end
   end

   merged.concat(left)
   merged.concat(right)

   merged
 end
end


def clever_octopus(fishes)
  blk = Proc.new { |x, y| y.length <=> x.length }
  fishes.merge_sort(&blk)[0]
end
