doubleMe x = x + x
multiplyBy2 x = x*2
doubleUs x y = doubleMe x + doubleMe y
boomBangs xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x] 
triangle = [ (a,b,c) | c <- [1..10], b <- [1..10], a <- [1..10] ]
rightTriangle =  [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2] 
rightTriangle' = [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2, a+b+c == 24]
