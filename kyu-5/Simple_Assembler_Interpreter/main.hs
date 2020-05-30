import qualified Data.Map.Strict as M
import Text.Read (readMaybe)
import Data.Maybe (fromMaybe, fromJust, maybe)

argumentError = error "Unknown Argument Error."

type Indexed a = (Int, a)
type Register = String
type Registers = M.Map Register Int

data Operand = Pointer Register | Constant Int deriving (Show)

toOperand :: String -> Operand
toOperand a = maybe (Pointer a) Constant s
  where
    s = readMaybe a :: Maybe Int

resolveOperand :: Registers -> Operand -> Int
resolveOperand rs (Pointer r) = (M.!) rs r
resolveOperand _ (Constant c) = c

data Instruction  = Mov Register Operand
                  | Inc Register
                  | Dec Register
                  | Jnz Operand Operand
                    deriving (Show)

parseInstruction :: String -> Instruction
parseInstruction s = instruction
  where
    [cmd, o0, o1] = take 3 . (++) (words s) $ ["1"]
    instruction = case cmd of
      "mov" -> Mov o0 (toOperand o1)
      "inc" -> Inc o0
      "dec" -> Dec o0
      "jnz" -> Jnz (toOperand o0) (toOperand o1)

-- runs list of instructions
runFlow :: Registers -> Int -> [Instruction] -> Registers
runFlow registers index instructions
  | index >= length instructions = registers
  | otherwise = runFlow registers' index' instructions
  where
    (index', registers') = run (index, registers) (instructions !! index)

run :: Indexed Registers -> Instruction -> Indexed Registers
run ~(i, rs) instruction = case instruction of
  Mov r o                       -> (i + 1, M.insert r value rs)
    where value = resolveOperand rs o
  Inc r                         -> (i + 1, M.adjust (+1) r rs)
  Dec r                         -> (i + 1, M.adjust (flip (-) 1) r rs)
  Jnz o0 o1
    | resolveOperand rs o0 == 0 -> (i + 1, rs)
    | otherwise                 -> (i + resolveOperand rs o1, rs)

simpleAssembler :: [String] -> Registers
simpleAssembler = runFlow (M.fromList []) 0 . map parseInstruction

