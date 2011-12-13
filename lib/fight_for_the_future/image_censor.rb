require 'RMagick'
require 'uri'

module FightForTheFuture
  class ImageCensor
    def initialize(original_path, uri)
      @original_path = original_path
      @uri = URI.parse(uri.to_s)
    end

    def write(censored_path)
      image = Magick::ImageList.new(@original_path)
      image = image.gaussian_blur(0, 3)

      overlay(image)
      annotate(image, 'THIS IMAGE CENSORED', 10)
      annotate(image, @uri.to_s, 20, Magick::SouthGravity)

      image.write(censored_path)
    end

    def overlay(image, color='#000000CC')
      overlay = Magick::Image.new(image.columns, image.rows) do
        self.background_color = color
      end

      image.composite!(
        overlay,
        Magick::ForgetGravity,
        Magick::MultiplyCompositeOp
      )
    end
    private :overlay

    def annotate(image, text, margin, gravity=Magick::CenterGravity)
      canvas = Magick::Image.new(1500, 200) do
        self.background_color = '#00000000'
      end

      annotation = Magick::Draw.new

      annotation.annotate(canvas, 0, 0, 0, 0, text) do
        self.fill = 'white'
        self.stroke = 'none'
        self.gravity = Magick::CenterGravity
        self.pointsize = 80
        self.font_family = 'Helvetica'
        self.font_weight = Magick::BoldWeight
      end

      max_width = image.columns - image.columns / (100 / margin)
      max_height = image.rows / 4

      canvas.trim!(true)
      canvas.resize_to_fit!(max_width, max_height)
      image.composite!(canvas, gravity, Magick::OverCompositeOp)
    end
    private :annotate
  end
end
