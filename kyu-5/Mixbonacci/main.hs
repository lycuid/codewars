-- https://www.codewars.com/kata/5811aef3acdf4dab5e000251/

fibonacci = 0 : 1 : (zipWith (+) fibonacci (tail fibonacci))
padovan = 1 : 0 : 0 : (zipWith (+) padovan (tail padovan))

jacobsthal = 0 : 1 : (zipWith (+) (map ((*) 2) jacobsthal) (tail jacobsthal))

pell = 0 : 1 : (zipWith (+) pell (map ((*) 2) . tail $ pell))

tribonacci = 0 : 0 : 1 :  ( (zipWith (+) tribonacci)
                          . zipWith (+) (tail tribonacci)
                          $ (tail . tail $ tribonacci))

tetranacci = 0 : 0 : 0 : 1 :  ( (zipWith (+) tetranacci)
                              . zipWith (+) (tail tetranacci)
                              . zipWith (+) (tail . tail $ tetranacci)
                              $ (tail . tail . tail $ tetranacci))

solve _ _ _ _ _ _ [] acc = acc
solve fi@(fib:fibs) pa@(pad:pads) ja@(jac:jacs) pe@(pell:pells) tr@(tri:tris) te@(tet:tets) (pat:patterns) acc
  | pat == "fib"  = solve fibs pa    ja    pe    tr    te    patterns (acc ++ [fib])
  | pat == "pad"  = solve fi   pads  ja    pe    tr    te    patterns (acc ++ [pad])
  | pat == "jac"  = solve fi   pa    jacs  pe    tr    te    patterns (acc ++ [jac])
  | pat == "pel" = solve fi   pa    ja    pells tr    te    patterns (acc ++ [pell])
  | pat == "tri"  = solve fi   pa    ja    pe    tris  te    patterns (acc ++ [tri])
  | otherwise     = solve fi   pa    ja    pe    tr    tets  patterns (acc ++ [tet])

mixbonacci :: [String] -> Int -> [Integer]
mixbonacci [] len = []
mixbonacci pat len = solve fibonacci padovan jacobsthal pell tribonacci tetranacci (take len . cycle $ pat) []

