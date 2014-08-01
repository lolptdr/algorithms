require_relative 'predictor'
require 'pry-byebug'

class ComplexPredictor < Predictor
  # Public: Trains the predictor on books in our dataset. This method is called
  # before the predict() method is called.
  #
  # Returns nothing.
  def train!
    @data = {}
    @opto = {}
    @counts = Hash.new(0)

    @all_books.each do |category, books|
      @data[category] = {
        words: 0,
        books: 0
      }
      @counts[category] = Hash.new(0)
      books.each do |filename, tokens|
        @data[category][:words] += tokens.count
        @data[category][:books] += 1
        
        # test = books[index][index+1]
        # test1 = test.delete_if { |x| x =~ /\d/ }
        # test2 = test1.uniq
        # test3 = test2.each { |x| x.gsub!(/_/,'') }
        # test4 = test3.delete_if { |x| x.length < 3 }
        # @counts[category][filename] = test4.length

        # test3.each { |x| @counts[x] += 1 }
binding.pry
      end
# binding.pry
    end
# binding.pry
  end

  # Public: Predicts category.
  #
  # tokens - A list of tokens (words).
  #
  # Returns a category.
  def predict(tokens)
    # Always predict astronomy, for now.
    :astronomy
  end
end

