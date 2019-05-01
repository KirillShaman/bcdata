
<!--
Copyright 2018 Province of British Columbia

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and limitations under the License.
-->

<a id="devex-badge" rel="Exploration" href="https://github.com/BCDevExchange/assets/blob/master/README.md"><img alt="Being designed and built, but in the lab. May change, disappear, or be buggy." style="border-width:0" src="https://assets.bcdevexchange.org/images/badges/exploration.svg" title="Being designed and built, but in the lab. May change, disappear, or be buggy." /></a>[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)[![Travis
build
status](https://travis-ci.org/bcgov/bcdata.svg?branch=master)](https://travis-ci.org/bcgov/bcdata)

# bcdata

An R package 📦 for searching & retrieving data from the [B.C. Data
Catalogue](https://catalogue.data.gov.bc.ca).

### Installation

You can install `bcdata` directly from this GitHub repository. To do so,
you will need the [remotes](https://cran.r-project.org/package=remotes)
package:

``` r
install.packages("remotes")
```

Next, install and load the `bcdata` package using
`remotes::install_github()`:

``` r
remotes::install_github("bcgov/bcdata")
library(bcdata)
```

### Functions

  - `bcdc_browse()` - Open the catalogue in your default browser
  - `bcdc_search()` - Search records in the catalogue
  - `bcdc_search_facet()` - List catalogue facet search options
  - `bcdc_get_record()` - Print a catalogue record
  - `bcdc_get_data()` - Get catalogue data
  - `bcdc_query_geodata()` - Get & query catalogue geospatial data (data
    must be available as a [WMS/WFS
    service](https://www2.gov.bc.ca/gov/content?id=95D78D544B244F34B89223EF069DF74E))

### Usage

``` r
bcdc_search("airport")
#> List of B.C. Data Catalogue Records
#> 
#> Number of records: 8
#> Titles:
#> 1: Airport Capacity and Service Information (other)
#>  ID: 553a8c7c-bca2-4b92-b925-ef6085724092
#>  Name: airport-capacity-and-service-information
#> 2: BC Airports (other, wms)
#>  ID: 76b1b7a3-2112-4444-857a-afccf7b20da8
#>  Name: bc-airports
#> 3: Customs Ports of Entry (other)
#>  ID: 4fac3ad6-8749-4741-ac98-527b23e4b0b2
#>  Name: customs-ports-of-entry
#> 4: BC Wildfire Active Weather Stations (other, wms)
#>  ID: c16867a3-a7ac-4c07-9a3e-0325e66e29c0
#>  Name: bc-wildfire-active-weather-stations
#> 5: NTS BC Transport Points 1:250,000 - Digital Baseline Mapping (NTS) (other, wms)
#>  ID: 6ce711d4-5196-47fc-9bc0-0839b1aa2ca3
#>  Name: nts-bc-transport-points-1-250-000-digital-baseline-mapping-nts
#> 6: HelloBC Activities and Attractions Listing (other, wms)
#>  ID: 3a7dc21c-be34-4b33-adbe-fadd3aaba2d7
#>  Name: hellobc-activities-and-attractions-listing
#> 7: BC Climate Stations (other, wms)
#>  ID: d9c6cafe-0b24-4197-a91d-8448aa4d98c7
#>  Name: bc-climate-stations
#> 8: Sites Registry (Open Government License) (other, wms)
#>  ID: d5c6b8ed-c272-4c9e-8813-590a47b5c01c
#>  Name: sites-registry-open-government-license- 
#> 
#> Access a single record by calling bcdc_get_record(ID)
#>       with the ID from the desired record.
```

``` r
bcdc_get_record("76b1b7a3-2112-4444-857a-afccf7b20da8")
#> B.C. Data Catalogue Record:
#>     BC Airports 
#> 
#> Name: bc-airports (ID: 76b1b7a3-2112-4444-857a-afccf7b20da8 )
#> Permalink: https://catalogue.data.gov.bc.ca/dataset/76b1b7a3-2112-4444-857a-afccf7b20da8
#> Sector: Natural Resources
#> Licence: Open Government Licence - British Columbia
#> Type: Geographic 
#> 
#> Description:
#>     BC Airports identifies locations where aircraft may take-off and land. No guarantee
#>     is given that an identified point will be maintained to sufficient standards for
#>     landing and take-off of any/all aircraft.  It includes airports, aerodromes, water
#>     aerodromes, heliports, and airstrips. 
#> 
#> Resources: ( 2 )
#>   BC Airports - Custom Download
#>     format:  
#>     resource: 03fdc03b-5487-4a2e-b7e3-a82e53db9ea1 
#>     access: Indirect Access 
#>     bcdc_get_data(x = '76b1b7a3-2112-4444-857a-afccf7b20da8')
#>     code: No direct methods currently available in bcdata
#>   WMS getCapabilities request
#>     format: wms 
#>     resource: 4d0377d9-e8a1-429b-824f-0ce8f363512c 
#>     access: Service 
#>     bcdc_get_data(x = '76b1b7a3-2112-4444-857a-afccf7b20da8')
#>     code: No direct methods currently available in bcdata
```

### bcdc\_get\_data

To have a quick look at spatial data, you can simply print the object:

``` r
airports <- bcdc_query_geodata("bc-airports", crs = 3857)
airports
#> # A B.C. Data Catalogue Record: 455 records and 42 columns
#> # Columns:
#> Warning in seq.default(along = x): partial argument match of 'along' to
#> 'along.with'
#> # A tibble: 42 x 4
#>    col_name                 selectable remote_col_type       local_col_type
#>    <chr>                    <lgl>      <chr>                 <chr>         
#>  1 id                       FALSE      xsd:string            character     
#>  2 CUSTODIAN_ORG_DESCRIPTI… FALSE      xsd:string            character     
#>  3 BUSINESS_CATEGORY_CLASS  FALSE      xsd:string            character     
#>  4 BUSINESS_CATEGORY_DESCR… FALSE      xsd:string            character     
#>  5 OCCUPANT_TYPE_DESCRIPTI… FALSE      xsd:string            character     
#>  6 SOURCE_DATA_ID           FALSE      xsd:string            character     
#>  7 SUPPLIED_SOURCE_ID_IND   FALSE      xsd:string            character     
#>  8 AIRPORT_NAME             FALSE      xsd:string            character     
#>  9 DESCRIPTION              TRUE       xsd:string            character     
#> 10 PHYSICAL_ADDRESS         TRUE       xsd:string            character     
#> 11 ALIAS_ADDRESS            TRUE       xsd:string            character     
#> 12 STREET_ADDRESS           TRUE       xsd:string            character     
#> 13 POSTAL_CODE              TRUE       xsd:string            character     
#> 14 LOCALITY                 FALSE      xsd:string            character     
#> 15 CONTACT_PHONE            TRUE       xsd:string            character     
#> 16 CONTACT_EMAIL            TRUE       xsd:string            character     
#> 17 CONTACT_FAX              TRUE       xsd:string            character     
#> 18 WEBSITE_URL              TRUE       xsd:string            character     
#> 19 IMAGE_URL                TRUE       xsd:string            character     
#> 20 LATITUDE                 FALSE      xsd:decimal           numeric       
#> 21 LONGITUDE                FALSE      xsd:decimal           numeric       
#> 22 KEYWORDS                 TRUE       xsd:string            character     
#> 23 DATE_UPDATED             TRUE       xsd:date              date          
#> 24 SITE_GEOCODED_IND        TRUE       xsd:string            character     
#> 25 AERODROME_STATUS         TRUE       xsd:string            character     
#> 26 AIRCRAFT_ACCESS_IND      TRUE       xsd:string            character     
#> 27 DATA_SOURCE              TRUE       xsd:string            character     
#> 28 DATA_SOURCE_YEAR         TRUE       xsd:string            character     
#> 29 ELEVATION                TRUE       xsd:decimal           numeric       
#> 30 FUEL_AVAILABILITY_IND    TRUE       xsd:string            character     
#> 31 HELICOPTER_ACCESS_IND    TRUE       xsd:string            character     
#> 32 IATA_CODE                TRUE       xsd:string            character     
#> 33 ICAO_CODE                TRUE       xsd:string            character     
#> 34 MAX_RUNWAY_LENGTH        TRUE       xsd:decimal           numeric       
#> 35 NUMBER_OF_RUNWAYS        TRUE       xsd:decimal           numeric       
#> 36 OIL_AVAILABILITY_IND     TRUE       xsd:string            character     
#> 37 RUNWAY_SURFACE           TRUE       xsd:string            character     
#> 38 SEAPLANE_ACCESS_IND      TRUE       xsd:string            character     
#> 39 TC_LID_CODE              TRUE       xsd:string            character     
#> 40 SEQUENCE_ID              FALSE      xsd:decimal           numeric       
#> 41 SE_ANNO_CAD_DATA         TRUE       xsd:hexBinary         numeric       
#> 42 geometry                 TRUE       gml:GeometryProperty… sfc geometry
```

If you need all the data, you need to retrieve the data using the
`collect` function:

``` r
airports %>% 
  collect()
#> Simple feature collection with 455 features and 41 fields
#> geometry type:  POINT
#> dimension:      XY
#> bbox:           xmin: -15204360 ymin: 6156650 xmax: -12788750 ymax: 8352148
#> epsg (SRID):    3857
#> proj4string:    +proj=merc +a=6378137 +b=6378137 +lat_ts=0.0 +lon_0=0.0 +x_0=0.0 +y_0=0 +k=1.0 +units=m +nadgrids=@null +wktext +no_defs
#> # A tibble: 455 x 42
#>    id    CUSTODIAN_ORG_D… BUSINESS_CATEGO… BUSINESS_CATEGO…
#>    <chr> <chr>            <chr>            <chr>           
#>  1 WHSE… "Ministry of Fo… airTransportati… Air Transportat…
#>  2 WHSE… "Ministry of Fo… airTransportati… Air Transportat…
#>  3 WHSE… "Ministry of Fo… airTransportati… Air Transportat…
#>  4 WHSE… "Ministry of Fo… airTransportati… Air Transportat…
#>  5 WHSE… "Ministry of Fo… airTransportati… Air Transportat…
#>  6 WHSE… "Ministry of Fo… airTransportati… Air Transportat…
#>  7 WHSE… "Ministry of Fo… airTransportati… Air Transportat…
#>  8 WHSE… "Ministry of Fo… airTransportati… Air Transportat…
#>  9 WHSE… "Ministry of Fo… airTransportati… Air Transportat…
#> 10 WHSE… "Ministry of Fo… airTransportati… Air Transportat…
#> # … with 445 more rows, and 38 more variables:
#> #   OCCUPANT_TYPE_DESCRIPTION <chr>, SOURCE_DATA_ID <chr>,
#> #   SUPPLIED_SOURCE_ID_IND <chr>, AIRPORT_NAME <chr>, DESCRIPTION <chr>,
#> #   PHYSICAL_ADDRESS <chr>, ALIAS_ADDRESS <chr>, STREET_ADDRESS <chr>,
#> #   POSTAL_CODE <chr>, LOCALITY <chr>, CONTACT_PHONE <chr>,
#> #   CONTACT_EMAIL <chr>, CONTACT_FAX <chr>, WEBSITE_URL <chr>,
#> #   IMAGE_URL <chr>, LATITUDE <dbl>, LONGITUDE <dbl>, KEYWORDS <chr>,
#> #   DATE_UPDATED <date>, SITE_GEOCODED_IND <chr>, AERODROME_STATUS <chr>,
#> #   AIRCRAFT_ACCESS_IND <chr>, DATA_SOURCE <chr>, DATA_SOURCE_YEAR <chr>,
#> #   ELEVATION <dbl>, FUEL_AVAILABILITY_IND <chr>,
#> #   HELICOPTER_ACCESS_IND <chr>, IATA_CODE <chr>, ICAO_CODE <chr>,
#> #   MAX_RUNWAY_LENGTH <dbl>, NUMBER_OF_RUNWAYS <int>,
#> #   OIL_AVAILABILITY_IND <chr>, RUNWAY_SURFACE <chr>,
#> #   SEAPLANE_ACCESS_IND <chr>, TC_LID_CODE <chr>, SEQUENCE_ID <int>,
#> #   SE_ANNO_CAD_DATA <chr>, geometry <POINT [m]>
```

This has the advantage of fine tuning your query without issuing a large
request to the data catalogue. When you are finally ready to bring all
the data you want into memory then you can use the `collect` function.
This approach mimics that developed for `dbplyr`. You can read more
about that
[here](https://cran.r-project.org/web/packages/dbplyr/vignettes/dbplyr.html)

### Project Status

This project is under active development.

### Getting Help or Reporting an Issue

To report bugs/issues/feature requests, please file an
[issue](https://github.com/bcgov/bcdata/issues/).

### How to Contribute

If you would like to contribute to the package, please see our
[CONTRIBUTING](CONTRIBUTING.md) guidelines.

Please note that this project is released with a [Contributor Code of
Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree
to abide by its terms.

### License

    Copyright 2018 Province of British Columbia
    
    Licensed under the Apache License, Version 2.0 (the &quot;License&quot;);
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at
    
    http://www.apache.org/licenses/LICENSE-2.0
    
    Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an &quot;AS IS&quot; BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and limitations under the License.

-----

*This project was created using the
[bcgovr](https://github.com/bcgov/bcgovr) package.*
