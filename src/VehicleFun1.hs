module VehicleFun1 where

data Price = Price Integer deriving (Eq, Show)

data Manufacturer = Tesla | Honda | Hyundai | Mazda | Ford deriving (Eq, Show)

data Airline = AirCanada | WestJet | KoreanAir deriving (Eq, Show)

data PlaneSize = Tiny | Small | Medium | Widebody | Jumbo deriving (Eq, Show)

data Vehicle = Car Manufacturer Price | Plane Airline PlaneSize deriving (Eq, Show)

myCar = Car Tesla (Price 58000)

urCar = Car Mazda (Price 20000)

clownCar = Car Ford (Price 12500)

acq400 = Plane AirCanada Small

ws737 = Plane WestJet Medium

vehicles = [myCar, urCar, clownCar, acq400, ws737]

isCar :: Vehicle -> Bool
isCar (Car _ _) = True
isCar _ = False

isPlane :: Vehicle -> Bool
isPlane (Plane _ _) = True
isPlane _ = False

areCars :: [Vehicle] -> [Bool]
areCars = map isCar

getManufacturer :: Vehicle -> Maybe Manufacturer
getManufacturer (Car m _) = Just m
getManufacturer _ = Nothing
