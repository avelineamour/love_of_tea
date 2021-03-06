require_relative '../../config/environment.rb'
require_relative './scraper.rb'
require_relative './tea.rb'

class LoveOfTea::CLI

  def initialize
    LoveOfTea::Tea.create_from_collection("https://www.rishi-tea.com/category/green-tea")
    LoveOfTea::Tea.create_from_collection("https://www.rishi-tea.com/category/caffeine-free-herbal")
    LoveOfTea::Tea.create_from_collection("https://www.rishi-tea.com/category/white-tea")
    LoveOfTea::Tea.create_from_collection("https://www.rishi-tea.com/category/black-tea")
    LoveOfTea::Tea.create_from_collection("https://www.rishi-tea.com/category/chai")
  end

  def call
    menu
    input = gets.strip
    if input == "1"
      learnmore
      call
    elsif input == "2"
      quote
      call
    elsif input == "3"
      match
      call
    elsif input == "4"
      cart
    elsif input != "exit"
      invalid_input
      call
    else
    end
  end

  def quote
   puts "\n\n❀ Why not consecrate ourselves to the queen of the Camelias, and revel in the warm stream of sympathy that flows from her altar?  In the liquid amber within the ivory-porcelain, the initiated may touch the sweet reticence of Confucius, the piquancy of Laotse, and the ethereal aroma of Sakyamuni himself. ❀\n\n"
  end

  def learnmore
   puts "\n\n❀ All tea comes from the camellia sinensis plant. Otherwise, it is a tisane. The camellia plant has many health properties, but one of particular interest is its L-Theanine content. ❀\n\n\n❀ L-theanine has been shown to increase dopamine, serotonin, and GABA in the brain, thus inducing relaxation and positive mood. ❀\n\n\n❀ Combined with the natural caffeine in the plant, it also improves concentration and memory, which is why monks have used it to meditate for years. ❀\n\n"
  end

  def menu
    puts "\nHello and welcome to Love of Tea. This application will help you learn about tea and select the perfect teas for you. To begin, please select an option by typing the number. You may exit the program at any time by typing exit and use the Tea Matcher as many times as you wish to populate your cart.\n\n1. Learn More About Tea\n2. A Quote About Tea\n3. Get Matched with A Tea\n4. See Cart\n\n"
  end

  def caffeine_prompt
    puts "\nPlease choose a caffeine level.\n\n1. Low\n2. Medium\n3. High\n\n"
  end

  def selection_prompt
    puts "\nWould you like us to select a tea for you? Or would you prefer to choose from a list?\n\n1. Select For Me\n2. Choose My Own\n\n"
  end

  def invalid_input
    puts "\nInvalid input. Please try again."
  end

  def match
    puts "\nWhat sort of effect are you looking for in your tea?\n\n1. Energy\n2. Calming\n3. Warming/Spice\n\n"

    effect = gets.strip

    #Energy
    if effect == "1"
      caffeine_prompt

      caffeine = gets.strip
      if caffeine == "1"

        selection_prompt
        select_or_choose = gets.strip
          if select_or_choose == "1"

            randomtea = LoveOfTea::Tea.white.shuffle.first
            name = randomtea.name
            price = randomtea.price
            description = randomtea.description
            url = randomtea.url

            puts "\nWe have chosen the lovely #{name} for you. #{description}. Depending on quantity, that will cost #{price}. If the price is fixed, that is the only quantity offered. Enjoy!\n\nWould you like to save this to your cart? (y/n)\n\n"

            savetocart = gets.strip
            if savetocart == "y"
              randomtea.save
            else
            end

          elsif select_or_choose == "2"
            list_white_tea
            choose_from_list = gets.strip.to_i

            if choose_from_list > LoveOfTea::Tea.white.length
              invalid_input
              list_white_tea
              choose_from_list = gets.strip.to_i
            else
            end

            tea = LoveOfTea::Tea.white[choose_from_list - 1]
            name = tea.name
            price = tea.price
            description = tea.description
            url = tea.url

              puts "\n#{name}. Excellent choice. #{description}. Depending on quantity that will cost #{price}. If the price is fixed, that is the only quantity offered.\n\nWould you like to save this to your cart? (y/n)\n\n"

              savetocart = gets.strip
              if savetocart == "y"
                tea.save
              else
              end

          else
            invalid_input
            match
          end

      elsif caffeine == "2"

        selection_prompt
        select_or_choose = gets.strip
          if select_or_choose == "1"

            randomtea = LoveOfTea::Tea.green.shuffle.first
            name = randomtea.name
            price = randomtea.price
            description = randomtea.description
            url = randomtea.url

            puts "\nWe have chosen the lovely #{name} for you. #{description}. Depending on quantity, that will cost #{price}. If the price is fixed, that is the only quantity offered. Enjoy!\n\nWould you like to save this to your cart? (y/n)\n\n"

            savetocart = gets.strip
            if savetocart == "y"
              randomtea.save
            else
            end

          elsif select_or_choose == "2"
            list_green_tea
            choose_from_list = gets.strip.to_i

            if choose_from_list > LoveOfTea::Tea.green.length
              invalid_input
              list_green_tea
              choose_from_list = gets.strip.to_i
            else
            end

            tea = LoveOfTea::Tea.green[choose_from_list - 1]
            name = tea.name
            price = tea.price
            description = tea.description
            url = tea.url

              puts "\n#{name}. Excellent choice. #{description}. Depending on quantity that will cost #{price}. If the price is fixed, that is the only quantity offered.\n\nWould you like to save this to your cart? (y/n)\n\n"

              savetocart = gets.strip
              if savetocart == "y"
                tea.save
              else
              end

          else
            invalid_input
            match
          end

      elsif caffeine == "3"

        selection_prompt
        select_or_choose = gets.strip
          if select_or_choose == "1"

            randomtea = LoveOfTea::Tea.black.shuffle.first
            name = randomtea.name
            price = randomtea.price
            description = randomtea.description
            url = randomtea.url

            puts "\nWe have chosen the lovely #{name} for you. #{description}. Depending on quantity, that will cost #{price}. If the price is fixed, that is the only quantity offered. Enjoy!\n\nWould you like to save this to your cart? (y/n)\n\n"

            savetocart = gets.strip
            if savetocart == "y"
              randomtea.save
            else
              invalid_input
              match
            end

          elsif select_or_choose == "2"

            list_black_tea
            choose_from_list = gets.strip.to_i

            if choose_from_list > LoveOfTea::Tea.black.length
              invalid_input
              list_black_tea
              choose_from_list = gets.strip.to_i
            else
            end

            tea = LoveOfTea::Tea.black[choose_from_list - 1]
            name = tea.name
            price = tea.price
            description = tea.description
            url = tea.url

            puts "\n#{name}. Excellent choice. #{description}. Depending on quantity that will cost #{price}. If the price is fixed, that is the only quantity offered.\n\nWould you like to save this to your cart? (y/n)\n\n"

            savetocart = gets.strip
              if savetocart == "y"
                tea.save
              else
              end

            else
              invalid_input
              match
            end

      else
        invalid_input
        match
      end


    #Calming
    elsif effect == "2"

      selection_prompt
      select_or_choose = gets.strip
        if select_or_choose == "1"

          randomtea = LoveOfTea::Tea.herbal.shuffle.first
          name = randomtea.name
          price = randomtea.price
          description = randomtea.description
          url = randomtea.url

          puts "\nWe have chosen the lovely #{name} for you. #{description}. Depending on quantity, that will cost #{price}. If the price is fixed, that is the only quantity offered. Enjoy!\n\nWould you like to save this to your cart? (y/n)\n\n"

          savetocart = gets.strip
          if savetocart == "y"
            randomtea.save
          else
          end

        elsif select_or_choose == "2"
          list_herbal_tea
          choose_from_list = gets.strip.to_i

          if choose_from_list > LoveOfTea::Tea.herbal.length
            invalid_input
            list_herbal_tea
            choose_from_list = gets.strip.to_i
          else
          end

          tea = LoveOfTea::Tea.herbal[choose_from_list - 1]
          name = tea.name
          price = tea.price
          description = tea.description
          url = tea.url

            puts "\n#{name}. Excellent choice. #{description}. Depending on quantity that will cost #{price}. If the price is fixed, that is the only quantity offered.\n\nWould you like to save this to your cart? (y/n)\n\n"

            savetocart = gets.strip
            if savetocart == "y"
              tea.save
            else
            end

        else
          invalid_input
          match
        end

    #Warming/Spice
    elsif effect == "3"

      selection_prompt
      select_or_choose = gets.strip
        if select_or_choose == "1"

          randomtea = LoveOfTea::Tea.chai.shuffle.first
          name = randomtea.name
          price = randomtea.price
          description = randomtea.description
          url = randomtea.url

          puts "\nWe have chosen the lovely #{name} for you. #{description}. Depending on quantity, that will cost #{price}. If the price is fixed, that is the only quantity offered. Enjoy!\n\nWould you like to save this to your cart? (y/n)\n\n"

          savetocart = gets.strip
          if savetocart == "y"
            randomtea.save
          else
          end

        elsif select_or_choose == "2"

          list_chai_tea
          choose_from_list = gets.strip.to_i

          if choose_from_list > LoveOfTea::Tea.chai.length
            invalid_input
            list_chai_tea
            choose_from_list = gets.strip.to_i
          else
          end

          tea = LoveOfTea::Tea.chai[choose_from_list - 1]
          name = tea.name
          price = tea.price
          description = tea.description
          url = tea.url

            puts "\n#{name}. Excellent choice. #{description}. Depending on quantity that will cost #{price}. If the price is fixed, that is the only quantity offered.\n\nWould you like to save this to your cart? (y/n)\n\n"

            savetocart = gets.strip
            if savetocart == "y"
              tea.save
            else
            end

        else
          invalid_input
          match
        end

    elsif effect != "exit"
      invalid_input
      match
    else
    end
  end



  def list_white_tea
    puts "\n"
    LoveOfTea::Tea.white.each_with_index do |tea, index| puts "#{index + 1}. #{tea.name}"
    end
    puts "\n"
  end

  def list_green_tea
    puts "\n"
    LoveOfTea::Tea.green.each_with_index do |tea, index| puts "#{index + 1}. #{tea.name}"
    end
    puts "\n"
  end

  def list_black_tea
    puts "\n"
    LoveOfTea::Tea.black.each_with_index do |tea, index| puts "#{index + 1}. #{tea.name}"
    end
    puts "\n"
  end

  def list_herbal_tea
    puts "\n"
    LoveOfTea::Tea.herbal.each_with_index do |tea, index| puts "#{index + 1}. #{tea.name}"
    end
    puts "\n"
  end

  def list_chai_tea
    puts "\n"
    LoveOfTea::Tea.chai.each_with_index do |tea, index| puts "#{index + 1}. #{tea.name}"
    end
    puts "\n"
  end

  def cart
    puts "\n"
    puts "\nHere are the teas that you have saved to your cart. Please note that a blank caffeine level indicates no caffeine. To purchase and see more details, copy the URLs into your browser for your desired teas.\n\n"
    LoveOfTea::Tea.cart.each do |tea|
      puts "Name: #{tea.name}\nType: #{tea.type}\nDescription: #{tea.description}\nPrice: #{tea.price}\nCaffeine Level: #{tea.caffeine}\nLink: #{tea.url}\n\n---------------------------"
    end
    puts "\n"
    call
  end

end
