class PersonalFilePdfFormatter
  attr_reader :pdf

  def initialize
    @pdf = Prawn::Document.new
  end

  def parse_my_info(my_info)
    ######Test these commented lines last:
    # @pdf.text "My Personal Info", :size => 20, :style => :bold, :align => :center
    # @pdf.move_down 50
    # @pdf.fill_color '121e87'
    @pdf.text "First name: #{my_info[:first_name]}", :inline_format => true
    @pdf.text "Last name: #{my_info[:last_name]}", :inline_format => true
    #####This goes second:
    # @pdf.fill_color '871212'
    # @pdf.text "Full name: #{my_info[:first_name] + ' ' + my_info[:middle_initial] + ' ' + my_info[:last_name]}"
  end

  def write(my_info)
    parsed_info = parse_my_info(my_info)
    @pdf.text(parsed_info)
  end

  def render(filename)
    @pdf.render_file(filename)
  end
end
