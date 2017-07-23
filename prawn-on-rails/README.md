# This repo is for practising using the Prawn gem in a Rails app, with hard coded values to display and without the use of a database.
Prawn comes with a series of methods to generate pdf files. 
See the Prawn Manual: http://prawnpdf.org/manual.pdf

***To generate a pdf file with a value on it:
A. To make this from scratch:
  1. Make Rails app
  2. add "gem 'prawn'" to Gemfile, run 'bundle install'
  3. under 'lib/tasks' make .rake file with task to generate pdf file from the terminal(see my 'lib/tasks/my_pdf.rake' file and its contents)
  4. under 'app/' make /formatters/formatter_file.rb with a class to help you instantiate a pdf object. Mine is called personal_file_pdf_formatter.rb
  5. There are more ways to create a pdf file with Prawn according to the Manual(see page 4). Here I'm using the assignment method: 
  	# Assignment method:
	pdf = Prawn::Document.new
	pdf.text "Hello World"
	pdf.render_file "assignment.pdf"
 B. Clone this repository that allows you to generate a pdf file with one value on it.
  1. in my_pdf.rake edit your first name.
  2. Create a pdf file: bundle exec rake my_pdf:create_personal_file. Type 'open credit_card.pdf' to see the result.

 ***To generate a pdf file with multiple values on it/ Exercises:
  1. Add a last name attr with a value to my_personal_info in my_pdf.rake and try and render both the first name and the last name into a pdf. (it will brake)
  2. Write a method called 'parse_my_info' that takes an argument(which will be the hash from my_personal_info), and use the Prawn 'text' method to build all the info you wanna display on the pdf (e.g.: @pdf.text "First name: #{my_info[:first_name]}", :inline_format => true) ) We can now make a pdf with as many values as we want.
  3. Change the color of the text: use the Prawn method 'fill_color' with an argument like '121e87' for navy blue, before any text in the 'parse_my_info' method: @pdf.fill_color '121e87'
  6. In 'my_personal_info, add your middle initial to the hash'. In 'parse_my_info' write a statement to display your full name. Display this last statement as red.
  4. To add a title, write "@pdf.text 'My Personal Info'" on top of the other lines of text. But to display it larger, bold and in the center of the line, and space the rest of the text apart from the title, we need to add:
  	* ':size => 20, :style => :bold, :align => :center' after the title. Another option for changing the font size is: 'font_size(20) { text "Title" }'
  	* Add '@pdf.move_down 50' after the title, to allow space before the next value (it's a kind of padding bottom or margin bottom in css)
  5. Extra: The div from html is a box here: look it up in the Prawn Manual and fill your personal file with more relevant information and wrap sets of information into separate boxes. Then, try to arrange some of them into columns.

  I hope this is useful to start learning how to use some Prawn methods and that you have fun with it!
