{-
The program is going to be a guessing game, called Starman. In this single-player, text-based game, there is a word which the player needs to guess. For each turn of the game, the player guesses a single letter. If that letter is correct, then the guessed letters are displayed in the correct places in the word. If that letter is incorrect, then the user loses a star. Once the user has no stars left, they have lost the game. However if the user guesses all the letters in the word, they have won the game.
-}


{-
The heart of the game involves checking the player’s guess. We want to know whether the guess was right. This outcome is a Bool value, either True or False. We need to update the displayed word, if the guess was right, by replacing appropriate dashes in the displayed word with the correctly guessed character. Therefore the result type of the function is a pair (Bool, String). The first element of the pair is the guess outcome. The second element is the String to display to the user for the next round

the checking function needs to know:

The secret word, a String
The current display, also a String
The character guessed by the player

-}
check :: String -> String -> Char -> (Bool,String)
check word display c
  = (c `elem` word, [if x==c
          then c
          else y | (x,y) <- zip word display])
{-
The next function we will define is the turn function. This is the function that will be called each time it is the player’s turn to enter a guess. First we need to check how many guesses the player has left. if n== 0 Then we need to see whether the player is correct or not … if word == display

So we will have two if checks, each followed by putStrLn status messages and the end of the function calling sequence (since it is the end of the game). However if neither of the if conditions is true, then the player can take a turn, so we call another function to get another character from the user input.

-}
turn :: String -> String -> Int -> IO ()
turn word display n =
  do if n==0
       then putStrLn "You lose"
       else if word==display
              then putStrLn "You win!"
              else mkguess word display n





mkguess :: String -> String -> Int -> IO ()
mkguess word display n =
  do putStrLn (display ++ "  " ++ take n (repeat '*'))
     putStr "  Enter your guess: "
     q <- getLine
     let (correct, display') = check word display (q!!0)
     let n' = if correct then n else n-1
     turn word display' n'


starman :: String -> Int -> IO ()
starman word n = turn word ['-' | x <- word] n

