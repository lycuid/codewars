import qualified Data.Map.Strict as M
import Text.Read (readMaybe)
import Data.Maybe

type Registers = M.Map String Int

mov :: Instruction
mov s m i r = (,) (s + 1) (M.insert m i r)

inc :: Instruction
inc s m i r = (,) (s + 1) (M.insertWith (+) m i r)

-- flipping because the first argument for dec is 1.
dec :: Instruction
dec s m i r = (,) (s + 1) (M.insertWith (flip (-)) m i r)

jnz :: Instruction
jnz s m adder r
  | (M.!) r m == 0 = (,) (s + 1) r
  | otherwise = (,) (s + adder) r


type MemAddr = String
data Value = Pointer MemAddr | Constant Int deriving (Show)

-- type Action = MemAddr -> Int -> Registers -> Registers
type Instruction = Int -> MemAddr -> Int -> Registers -> (Int, Registers)
-- data Instruction = Action Action | Jump Int
data Command = Command
                  { getInstruction :: Instruction
                  , getMemAddr :: MemAddr
                  , getValue :: Value
                  }


fromValue :: Registers -> Value -> Int
fromValue r (Pointer a) = (M.!) r a
fromValue _ (Constant i) = i

run :: Registers -> Int -> Command -> (Int, Registers)
run r s command = instruction s memAddr value r
  where
    instruction = getInstruction command
    memAddr = getMemAddr command
    value = fromValue r . getValue $ command

runCommands :: Registers -> Int -> [Command] -> Registers
runCommands registers current commands
  | current == length commands = registers
  | otherwise = runCommands new_registers next commands
  where
    (next, new_registers) = run registers current (commands !! current)


toValue a
  | isNothing s = Pointer a
  | otherwise = Constant (fromJust s)
  where
    s = readMaybe $ a :: Maybe Int

parse :: String -> Command
parse s = Command instruction memAddr (toValue val)
  where
    [cmd, memAddr, val] = take 3 . (++) (words s) $ ["1"]
    instruction = case cmd of
      "mov" -> mov
      "inc" -> inc
      "dec" -> dec
      "jnz" -> jnz


simpleAssembler :: [String] -> Registers
simpleAssembler = runCommands (M.fromList []) 0 . map parse


s = ["mov a 1", "mov b 6", "dec b", "jnz b -1", "inc a", "dec a", "dec a", "inc a", "mov a b"]
