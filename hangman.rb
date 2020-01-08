class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  def self.random_word
    return DICTIONARY.sample
  end
  def random_word
    return DICTIONARY.sample
  end
  def initialize
    @secret_word = Hangman::random_word
    guess_str = "_" * @secret_word.length
    @guess_word = guess_str.split("")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end
  def guess_word 
    @guess_word
  end
  def attempted_chars
    @attempted_chars
  end
  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end
  def already_attempted?(char)
    if @attempted_chars.include?(char)
      return true
    else
      return false
    end
  end
  def get_matching_indices(char)
    idxArray = []
    guessLetter = char
    newArray = @secret_word.split("")
    newArray.each_with_index do |secretChar, idx|
        if secretChar == guessLetter
          idxArray << idx
        end
    end
    return idxArray
  end
  def fill_indices(char, arr)
    arr.each do |num|
      @guess_word[num] = char
    end
  end
  def try_guess(char)
    if already_attempted?(char)
      print "that has already been attempted"
      return false
    else
      @attempted_chars << char
      matchIdx = get_matching_indices(char)
      if matchIdx.length == 0
        @remaining_incorrect_guesses -= 1
        return true
      else
        fill_indices(char, matchIdx)
        return true
      return true
      end
    end
  end
  def ask_user_for_guess
    print "Enter a char:"
    char = gets.chomp
    return try_guess(char)
  end
  def win?
    if @guess_word.join("") == @secret_word
      print "WIN"
      return true
    else
      print "LOSE"
      return false
    end
  end
  def lose?
    if @remaining_incorrect_guesses == 0
      print "LOSE"
      return true
    else
      false
    end
  end
  def game_over?
    if win? || lose?
      print @secret_word
      return true
    else
      return false
    end
  end
end

