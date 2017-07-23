
# frozen_string_literal: true
# require '../../app/formatters/personal_file_pdf_formatter'
namespace :my_pdf do
  def my_personal_info
    my_info = {}
    my_info[:first_name] = 'Anca'
    my_info
  end

  desc 'Create a pdf file from data hash'
  task :create_personal_file => :environment do
    filename = "#{my_personal_info[:first_name]}.pdf"
    pdf = nil
    time = Benchmark.realtime do
      pdf = PersonalFilePdfFormatter.new

      pdf.write(my_personal_info[:first_name])
      pdf.render(filename)
    end
    raise 'could not create pdf file' if pdf.nil?

    puts "Generated PDF (#{filename}) in #{time} time."
  end
end
