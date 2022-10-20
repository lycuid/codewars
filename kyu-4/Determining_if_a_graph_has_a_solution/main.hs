-- https://www.codewars.com/kata/53223653a191940f2b000877/

type Node = Char
type Arc = (Node, Node)

solveGraph :: Node -> Node -> [Arc] -> Bool
solveGraph s d arcs = s == d || any (\source -> solveGraph source d dests) srcs
  where
    srcs  = map snd . filter ((==) s . fst) $ arcs
    dests = filter ((/=) s . snd) arcs
