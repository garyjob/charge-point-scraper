# ChargePoint Scraper
A wrapper class extracts the availability status of a particular charge point given a unique ChargePoint.com ID


# Pre-requisites
- NodeJS
- CoffeeScript

# Installation
    npm install charge-point-scraper

# Usage
    
    # Import class
    ChargePointScraper = require 'charge-point-scraper'
    
    # Instantiate
    cp = new ChargePointScraper()
    
    # To get status
    cp.getStatus '18193', (status)->
      console.log status 
    