import pandas

def read_flights(file):
    flights = pandas.read_csv(file)
    flights = flights[flights["DESTINATION_AIRPORT"] == "ORD"]
    flights = flights[["AIRLINE", "DEPARTURE_DELAY", "ARRIVAL_DELAY"]]
    flights = flights.dropna()
    return flights
