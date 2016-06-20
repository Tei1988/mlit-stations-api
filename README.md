## mlit-stations-api
mlit-stations-api is an API server for searching Japanese stations by the geolocation.

This API uses the open data published by Ministry of Land, Infrastructure, Transport and Tourism(, MLIT), Japan.

## Preparation before Use
1. Setup PostgreSQL and PostGIS.
1. Download master data from [MLIT](http://nlftp.mlit.go.jp/ksj/gml/datalist/KsjTmplt-N02-v2_2.html)
1. Unzip the downloaded file.  
   You will obtain N02-14.xml.
1. run as:  
   ```
   rails mlit:import[/path/to/N02-14.xml]
   ```

## API
### GET /v1/stations
|name|include?|example|
|---|---|---|
|latitude|Must|35.681298|
|longitude|Must|139.7640582|
|distance|Optional|300|

#### sample
**Request**  
`/api/stations?latitude=35.681298&longitude=139.7640582&distance=300`

**Response**  
The response is formatted as GeoJSON.
```
{
  type: "FeatureCollection",
  features: [
    {
      type: "Feature",
      geometry: {
        type: "Point",
        coordinates: [
          139.76479999999998,
          35.681934999999996
        ]
      },
      properties: {
        companyName: "東京地下鉄",
        railwayLineName: "4号線丸ノ内線",
        stationName: "東京"
      }
    },
    {
      type: "Feature",
      geometry: {
        type: "Point",
        coordinates: [
          139.76178,
          35.680505
        ]
      },
      properties: {
        companyName: "東京地下鉄",
        railwayLineName: "9号線千代田線",
        stationName: "二重橋前"
      }
    },
    {
      type: "Feature",
      geometry: {
        type: "Point",
        coordinates: [
          139.76536666666664,
          35.681673333333336
        ]
      },
      properties: {
        companyName: "東日本旅客鉄道",
        railwayLineName: "総武線",
        stationName: "東京"
      }
    },
    {
      type: "Feature",
      geometry: {
        type: "Point",
        coordinates: [
          139.76723,
          35.681180000000005
        ]
      },
      properties: {
        companyName: "東日本旅客鉄道",
        railwayLineName: "東海道線",
        stationName: "東京"
      }
    },
    {
      type: "Feature",
      geometry: {
        type: "Point",
        coordinates: [
          139.76536666666664,
          35.681673333333336
        ]
      },
      properties: {
        companyName: "東日本旅客鉄道",
        railwayLineName: "東海道線",
        stationName: "東京"
      }
    },
    {
      type: "Feature",
      geometry: {
        type: "Point",
        coordinates: [
          139.766685,
          35.680965
        ]
      },
      properties: {
        companyName: "東日本旅客鉄道",
        railwayLineName: "東海道線",
        stationName: "東京"
      }
    },
    {
      type: "Feature",
      geometry: {
        type: "Point",
        coordinates: [
          139.766685,
          35.680965
        ]
      },
      properties: {
        companyName: "東日本旅客鉄道",
        railwayLineName: "東北線",
        stationName: "東京"
      }
    },
    {
      type: "Feature",
      geometry: {
        type: "Point",
        coordinates: [
          139.76723,
          35.681180000000005
        ]
      },
      properties: {
        companyName: "東日本旅客鉄道",
        railwayLineName: "東北線",
        stationName: "東京"
      }
    }
  ]
}
```
