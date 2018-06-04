desc "Scrape Amazon Reviews and output CSV"
task movies: :environment do
  # We'll do this together!
# url="https://www.amazon.com/Oculus-Touch-Virtual-Reality-System-pc/dp/B073X8N1YW/ref=sr_1_1_sspa?s=videogames&ie=UTF8&qid=1527799157&sr=1-1-spons&keywords=oculus%2Brift&th=1"
# page=HTTParty.gt(url)

filename = Rails.root.join("lib", "imdb", "movies-coming-soon.html")
    page = open(filename)

    doc = Nokogiri::HTML(page)

    all_movie_nodes = doc.css("input overall review element from inspector gadget here")

    list_of_movies = Array.new

    all_movie_nodes.each do |one_movie_node|
      title = one_movie_node.css("h4").text.strip

      # SelectorGadget is awesome for difficult to diagnose CSS selectors!
      # But to really level up, play the game CSS Diner
      
      director = one_movie_node.css(".outline+ .txt-block a").text.strip
      genre = one_movie_node.css(".cert-runtime-genre span").text.strip
      runtime = one_movie_node.css("time").text.strip
      description = one_movie_node.css(".overview-top .outline").text.strip

      movie_hash = Hash.new
      movie_hash.store(:title, title)
      movie_hash.store(:genre, genre)
      movie_hash.store(:runtime, runtime)
      movie_hash.store(:description, description)

      list_of_movies.push(movie_hash)
    end

    ap "Saving movies to file 'coming_soon.csv...'"

    list_of_movies.to_csv("coming_soon.csv")
  end
end


#twotabsearchtextbox is the amazon page element
<%= #{product_number} %>


Use CSS 

use inspector gadget to find the "see all reviews"

.css(reviews_medley_footer).click #to see all of the reviews once you get to your product Amazon page...

then use css again to select specific elements of the first full review you see (a.section)

use css to click on each "a.section" element that corresponds with each part of each review and then click .a-last a

and save each element of the review as site_name = or product_name = 

then create a hash like above using the same designations, and save them to the database i initially created
