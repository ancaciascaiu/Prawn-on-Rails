class PersonalFilePdfFormatter
  attr_reader :pdf

  def initialize
    @pdf = Prawn::Document.new
  end

  def write(my_info)
    @pdf.text(my_info)
  end

  def render(filename)
  	@pdf.render_file(filename)
  end
end
