@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View forBooking'
@Search.searchable: true
define view entity ZC_FE_BOOKING_000109
  as projection on ZI_FE_Booking_000109
{
  key BookingUUID,
  
  TravelUUID,
  
  @Search.defaultSearchElement: true
  @Search.fuzzinessThreshold: 0.90 
  BookingID,
  
  BookingDate,
  
  @Consumption.valueHelpDefinition: [ {
    entity: {
      name: '/DMO/I_Customer', 
      element: 'CustomerID'
    }
  } ]
  CustomerID,
  
  @Consumption.valueHelpDefinition: [ {
    entity: {
      name: 'zi_fe_carr_000109', 
      element: 'AirlineID'
    }
  } ]
  CarrierID,
  
  @Consumption.valueHelpDefinition: [ {
    entity: {
      name: 'zi_fe_flig_000109', 
      element: 'ConnectionID'
    }, 
    additionalBinding: [ {
      localElement: 'FlightDate', 
      element: 'FlightDate'
    }, {
      localElement: 'CarrierID', 
      element: 'AirlineID'
    }, {
      localElement: 'FlightPrice', 
      element: 'Price'
    }, {
      localElement: 'CurrencyCode', 
      element: 'CurrencyCode'
    } ]
  } ]
  ConnectionID,
  
  FlightDate,
  
  @Semantics.amount.currencyCode: 'CurrencyCode'
  FlightPrice,
  
  @Consumption.valueHelpDefinition: [ {
    entity: {
      name: 'I_Currency', 
      element: 'Currency'
    }
  } ]
  CurrencyCode,
  
  CreatedBy,
  
  LastChangedBy,
  
  LocalLastChangedAt,
  
  _Travel : redirected to parent ZC_FE_Travel_000109,
  
  _Connection,
  
  _Flight,
  
  _Carrier,
  
  _Currency,
  
  _Customer
}
