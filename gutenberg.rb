require_relative 'lib/simple_predictor'
require_relative 'lib/complex_predictor'
require 'pry-byebug'
require 'set'

def run!(predictor_klass, opts={})
  puts "+----------------------------------------------------+"
  puts "| #{predictor_klass}#{" " * (51 - predictor_klass.to_s.size)}|"
  puts "+----------------------------------------------------+"
  puts "Loading books..."
  start_time = Time.now
  predictor = predictor_klass.new()
  puts "Loading books took #{Time.now - start_time} seconds."


  puts "Training..."
  start_time = Time.now
  predictor.train!
  puts "Training took #{Time.now - start_time} seconds."

  puts "Predicting..."
  start_time = Time.now
  accuracy = predictor.predict_test_set(opts)
  puts "Predictions took #{Time.now - start_time} seconds."
  puts "Accuracy: #{accuracy}"
end

# run!(SimplePredictor, debug: true)
run!(ComplexPredictor, debug: true)

# +----------------------------------------------------+
# | SimplePredictor                                    |
# +----------------------------------------------------+
# Loading books...
# Loading books took 5.256191628 seconds.
# Training...
# Training took 0.000133945 seconds.
# # Predicting...
# Wrong.   Predicted archeology instead of astronomy. data/test/astronomy/22157-0.txt.
# Wrong.   Predicted archeology instead of astronomy. data/test/astronomy/8hsrs10u.txt.
# Wrong.   Predicted archeology instead of astronomy. data/test/astronomy/pg16767.txt.
# Wrong.   Predicted philosophy instead of astronomy. data/test/astronomy/pg25267.txt.
# Wrong.   Predicted archeology instead of astronomy. data/test/astronomy/pg27477.txt.
# Correct! Predicted astronomy. data/test/astronomy/pg28570.txt.
# Correct! Predicted astronomy. data/test/astronomy/pg4065.txt.
# Wrong.   Predicted religion instead of philosophy. data/test/philosophy/11100-0.txt.
# Wrong.   Predicted astronomy instead of philosophy. data/test/philosophy/pg13316.txt.
# Wrong.   Predicted religion instead of philosophy. data/test/philosophy/pg1497.txt.
# Wrong.   Predicted archeology instead of philosophy. data/test/philosophy/pg16712.txt.
# Wrong.   Predicted archeology instead of philosophy. data/test/philosophy/pg22283.txt.
# Wrong.   Predicted archeology instead of philosophy. data/test/philosophy/pg5827.txt.
# Correct! Predicted religion. data/test/religion/pg15836.txt.
# Correct! Predicted religion. data/test/religion/pg21190.txt.
# Correct! Predicted religion. data/test/religion/pg7883.txt.
# Correct! Predicted religion. data/test/religion/pg8070.txt.
# Correct! Predicted religion. data/test/religion/pg8200.txt.
# Wrong.   Predicted astronomy instead of archeology. data/test/archeology/22153-0.txt.
# Correct! Predicted archeology. data/test/archeology/pg13575.txt.
# Correct! Predicted archeology. data/test/archeology/pg17606.txt.
# Correct! Predicted archeology. data/test/archeology/pg17987.txt.
# Wrong.   Predicted astronomy instead of archeology. data/test/archeology/pg18931.txt.
# Correct! Predicted archeology. data/test/archeology/pg19921.txt.
# Wrong.   Predicted astronomy instead of archeology. data/test/archeology/pg23691.txt.
# Correct! Predicted archeology. data/test/archeology/pg4248.txt.
# Predictions took 2.387919345 seconds.
# Accuracy: 0.46153846153846156
# +----------------------------------------------------+
# | ComplexPredictor                                   |
# +----------------------------------------------------+
# Loading books...
# Loading books took 5.24894974 seconds.
# Training...
# Training took 2.872e-06 seconds.
# Predicting...
# Correct! Predicted astronomy. data/test/astronomy/22157-0.txt.
# Correct! Predicted astronomy. data/test/astronomy/8hsrs10u.txt.
# Correct! Predicted astronomy. data/test/astronomy/pg16767.txt.
# Correct! Predicted astronomy. data/test/astronomy/pg25267.txt.
# Correct! Predicted astronomy. data/test/astronomy/pg27477.txt.
# Correct! Predicted astronomy. data/test/astronomy/pg28570.txt.
# Correct! Predicted astronomy. data/test/astronomy/pg4065.txt.
# Wrong.   Predicted astronomy instead of philosophy. data/test/philosophy/11100-0.txt.
# Wrong.   Predicted astronomy instead of philosophy. data/test/philosophy/pg13316.txt.
# Wrong.   Predicted astronomy instead of philosophy. data/test/philosophy/pg1497.txt.
# Wrong.   Predicted astronomy instead of philosophy. data/test/philosophy/pg16712.txt.
# Wrong.   Predicted astronomy instead of philosophy. data/test/philosophy/pg22283.txt.
# Wrong.   Predicted astronomy instead of philosophy. data/test/philosophy/pg5827.txt.
# Wrong.   Predicted astronomy instead of religion. data/test/religion/pg15836.txt.
# Wrong.   Predicted astronomy instead of religion. data/test/religion/pg21190.txt.
# Wrong.   Predicted astronomy instead of religion. data/test/religion/pg7883.txt.
# Wrong.   Predicted astronomy instead of religion. data/test/religion/pg8070.txt.
# Wrong.   Predicted astronomy instead of religion. data/test/religion/pg8200.txt.
# Wrong.   Predicted astronomy instead of archeology. data/test/archeology/22153-0.txt.
# Wrong.   Predicted astronomy instead of archeology. data/test/archeology/pg13575.txt.
# Wrong.   Predicted astronomy instead of archeology. data/test/archeology/pg17606.txt.
# Wrong.   Predicted astronomy instead of archeology. data/test/archeology/pg17987.txt.
# Wrong.   Predicted astronomy instead of archeology. data/test/archeology/pg18931.txt.
# Wrong.   Predicted astronomy instead of archeology. data/test/archeology/pg19921.txt.
# Wrong.   Predicted astronomy instead of archeology. data/test/archeology/pg23691.txt.
# Wrong.   Predicted astronomy instead of archeology. data/test/archeology/pg4248.txt.
# Accuracy: 0.2692307692307692
# Predictions took 2.202630183 seconds.
# Accuracy: 0.2692307692307692