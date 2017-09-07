require 'open-uri'
require 'nokogiri'
require 'csv'

@csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
@filepath = 'reviews.csv'

# @reviews = []

# @host = "http://www.beaute-test.com"
# ingredient = "chocolate"
# urls = [
#   "http://www.beaute-test.com/shampooing_nutrition_intense_-_karite_argan_le_petit_marseillais.php?listeavis=1",
#   "http://www.beaute-test.com/shampooing_baume_eclat_2_en_1_aux_proteines_de_soie_hegor.php?listeavis=1",
#   "http://www.beaute-test.com/shampooing_raviveur_de_couleur_-_mure_proteine_de_soie_energie_fruit.php?listeavis=1",
#   "http://www.beaute-test.com/shampooing_tres_doux_2_en_1_a_la_soie_dop.php?listeavis=1",
#   "http://www.beaute-test.com/shampooing_lisse_et_soyeux_tresemme.php?listeavis=1",
#   "http://www.beaute-test.com/shampooing_adoucissant_-_all_soft_redken.php?listeavis=1"
# ]

# @index = 0

# def strip_line_breaks(string)
#   string.to_s.gsub(/\r\n/, ' ').gsub(/\n/, ' ').gsub(/\r/, ' ')
# end

# def scrap(url)
#   puts url
#   html_file = open(url).read
#   html_doc = Nokogiri::HTML(html_file)

#   html_doc.search('.us__review').each do |element|
#     review = element.at('.us__review__section>.us__txt__review__body')
#     review_txt = review ? review.text : ""
#     # p review_txt if index == 209
#     strength = ""
#     weakness = ""
#     plus_minus = element.search('.us__review__plus-min')
#     if plus_minus.search(".us__txt__review__body").size == 2
#       plus_minus.search(".us__txt__review__body").each_with_index do |e, i|
#         strength = e.text if i == 0
#         weakness = e.text if i == 1
#         raise if i > 1
#       end
#     elsif plus_minus.search(".us__txt__review__body").size == 1
#       case plus_minus.at(".us__txt__review__section").text
#       when "Points forts"
#         strength = plus_minus.at(".us__txt__review__body").text
#       when "Points faibles"
#         weakness = plus_minus.at(".us__txt__review__body").text
#       end
#     end
#     # p strength
#     @reviews << [@index, review_txt, strength, weakness].map { |s| strip_line_breaks(s) }
#     @index += 1
#   end
#   next_page = html_doc.at('.bt__pgtn__l__item__next')
#   if next_page
#     new_url = next_page.at('a').attribute('href')
#     scrap(@host + new_url)
#   end
# end

# def write_csv
#   CSV.open(@filepath, 'wb', @csv_options) do |csv|
#     csv << [:id, :overall, :likes, :dislikes]
#     @reviews.each do |row|
#       csv << row
#     end
#   end
# end

# urls.each do |url|
#   scrap(url)
# end
# write_csv

p CSV.parse_line(File.readlines("reviews.csv").sample, @csv_options)
