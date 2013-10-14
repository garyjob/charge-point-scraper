request = require 'request'  

class ChargePointScraper

  # @Description : gets the status of the charge point on ChargePoint.com given a device ID
  # @param : chargePointId:String
  # @param : callback:function
  #     err:String
  #     status:int 
  #       1 — available
  #       0 — in use
  getStatus : (chargePointId, callback)->
    options = 
      uri : 'https://na.chargepoint.com/index.php/maps/getMarkerDetails'
      method: 'POST'
      headers: 
        'User-Agent' : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.69 Safari/537.36"
        'Referer' : 'https://na.chargepoint.com/charge_point'
        'Origin' : 'https://na.chargepoint.com'
        'X-Requested-With' : 'XMLHttpRequest'
      form : 
        deviceId : chargePointId
        level1 : 1
        level2 : 1
        levelDC : 1
    
    request.post options, (error, response, body)->

      if /Available/.test body
        callback false, 1

      else if /In Use/.test body
        callback false, 0

      else 
        callback 'no working', false



module.exports = ChargePointScraper

if !module.parent
  cp  = new ChargePointScraper()
  
  cp.getStatus '18193', (err, status)->
    if err
      console.log 'An error has occurred, %s', status
    else 
      console.log 'Status of charge point (id:18193) has been returned, %s', status
  
  cp.getStatus '8502', (err, status)->
    if err
      console.log 'An error has occurred, %s', status
    else 
      console.log 'Status of charge point (id:8502) has been returned, %s', status
  