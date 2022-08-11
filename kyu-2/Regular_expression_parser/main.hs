-- https://www.codewars.com/kata/5470c635304c127cad000f0d/train/haskell
import Control.Applicative

data RegExp
  = -- | A character that is not in "()*|."
    Normal Char
  | -- | Any charater
    Any
  | -- | Zero or more occurances of the same regexp
    ZeroOrMore RegExp
  | -- | A choice between 2 regexps
    Or RegExp RegExp
  | -- | A sequence of regexps.
    Str [RegExp]
  deriving (Show, Eq)

newtype Parser a = Parser {parse :: String -> Maybe (String, a)}

instance Functor Parser where
  fmap f (Parser p) = Parser $ \input -> case p input of
    Just (xs, input) -> Just (xs, f input)
    Nothing -> Nothing

instance Applicative Parser where
  pure a = Parser $ \input -> Just (input, a)

  (Parser p1) <*> (Parser p2) = Parser $ \input -> do
    (input', f) <- p1 input
    (rest, input) <- p2 input'
    return (rest, f input)

instance Alternative Parser where
  empty = Parser $ const Nothing
  (Parser a) <|> (Parser b) = Parser $ \input -> a input <|> b input

charP :: (Char -> Bool) -> Parser Char
charP f = Parser p
  where
    p (x : xs)
      | f x = Just (xs, x)
      | otherwise = Nothing
    p [] = Nothing

anyP :: Parser RegExp
anyP = Any <$ charP (== '.')

normalP :: Parser RegExp
normalP = Normal <$> charP (`notElem` "()*|.")

linearP :: Parser RegExp
linearP = bracketsP <|> anyP <|> normalP

-- recursive parsers.
stringP :: Parser RegExp
stringP = runParser linearP

zeroOrMoreP :: Parser RegExp
zeroOrMoreP = ZeroOrMore <$> linearP <* charP (== '*')

orP :: Parser RegExp
orP = Parser $ \xs -> do
  (xs', lhs) <- parse reg xs
  (xs'', _) <- parse (charP (== '|')) xs'
  (rest, rhs) <- parse reg xs''
  Just (rest, Or lhs rhs)
  where
    reg = zeroOrMoreP <|> stringP <|> bracketsP <|> anyP <|> normalP

bracketsP :: Parser RegExp
bracketsP = charP (== '(') *> regex <* charP (== ')')

-- basically Str.
runParser :: Parser RegExp -> Parser RegExp
runParser parser = Parser $ \xs -> do
  (rest, r) <- parse (many parser) xs
  case r of
    [] -> Nothing
    [x] -> Just (rest, x)
    _ -> Just (rest, Str r)

regex :: Parser RegExp
regex = runParser regexP

regexP :: Parser RegExp
regexP = orP <|> zeroOrMoreP <|> bracketsP <|> anyP <|> normalP <|> stringP

parseRegExp :: String -> Maybe RegExp
parseRegExp xs = do
  (str, re) <- parse regex xs
  if not (null str)
    then -- unable to parse some string.
      Nothing
    else Just re
