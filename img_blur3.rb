class Image
attr_accessor :image_data

 def initialize(data) 
     @image_data = data
 end

  def blur_man(dist) 
    dist.times do
      transform
    end
    manhattan_image
  end

  def blur(row_index,col_index)
    if row_index != 0
      @image_data[row_index-1][col_index]   = 1
    end
    if col_index != 0
      @image_data[row_index][col_index-1]   = 1
    end
    first_row = image_data[0]
    if col_index != first_row.length - 1
      @image_data[row_index][col_index+1]   = 1
    end
    if row_index != image_data.length - 1
      @image_data[row_index+1][col_index]   = 1
    end
  end

  def transform
    ones = []
    @image_data.each_with_index do |row, row_index|
      row.each_with_index do |pixel, col_index|
        if pixel == 1
          ones.push [row_index, col_index]
        end
      end
    end
      ones.each do |pair|
      row_index, col_index = pair
      blur(row_index, col_index)
    end
  end

  def manhattan_image
     @image_data.each do |row|
         row.each do |pixel|
           print pixel
         end   
         puts
     end
      puts "------------"
  end

end

 i = Image.new([ 
     [0, 0, 0, 0, 0, 0, 0, 0, 0],
     [0, 0, 0, 0, 0, 0, 0, 0, 0],
     [0, 0, 0, 0, 0, 0, 0, 0, 0],
     [0, 0, 0, 1, 0, 0, 0, 0, 0],
     [0, 0, 0, 0, 0, 0, 0, 0, 0],
     [0, 0, 0, 0, 0, 0, 0, 0, 0],
     [0, 0, 0, 0, 0, 0, 0, 0, 0],
     [0, 0, 0, 0, 0, 0, 0, 0, 0],
     [0, 0, 0, 0, 0, 0, 0, 0, 1]
])

i.blur_man(2)