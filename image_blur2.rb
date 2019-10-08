class Image

  def initialize (image)
    @image = image
  end

  def get_ones
    ones = []
    @image.each_with_index do |row, row_num|
      row.each_with_index do |item, col_num|
        if item == 1
          ones << [row_num, col_num]
        end
      end
    end
    ones
  end

  def blur!
    ones = get_ones
      @image.each_with_index do |row, row_num|
        row.each_with_index do |item, col_num|
          ones.each do |found_row_num, found_col_num|

            if row_num == found_row_num && col_num == found_col_num
              @image[row_num -1][col_num] = 1 unless row_num == 0 
              @image[row_num +1][col_num] = 1 unless row_num >= 3 
              @image[row_num][col_num -1] = 1 unless col_num == 0 
              @image[row_num][col_num +1] = 1 unless col_num >= 3 
            end
          end
        end
      end
  end

  def output_image
    @image.each do |data|
      puts data.join
    end
  end
end

image = Image.new([
[0, 0, 0, 0],
[0, 1, 0, 0],
[0, 0, 0, 1],
[0, 0, 0, 0]
])

#original
image.output_image
puts
image.blur!

#img blur
image.output_image