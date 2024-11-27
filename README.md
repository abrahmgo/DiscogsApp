

![album-de-musica copia](https://github.com/user-attachments/assets/92dce911-1e1a-47c5-9a6d-7fe17d19ac8d)


# Exercise

Discogs app, this application is a demo that takes several swift topics, such as ui, layers, apis, protocols among others.

## Before to start

### Install dependencies

```shell
    brew install swiftlint
```

**NOTE** You need homebrew to execute previus command

### API Token

Go to ```APIConfig``` file and **set token property with your own value**

```swift
    static var token: String {
        return "534535346456fdg3dfer345fe435"
    }
```

## Features

- Search an artist
- See artist detail
- See releases artist

## App Settings

- Change if the app uses mocks
- Change url server, thi option it will available if we have two or more servers/environments
  
Go to settings app, select Discogs app, change if the app will use mocks

**NOTE** Don't forget to restart the app to apply the changes.

<img width="320" alt="Captura de pantalla 2024-11-26 a la(s) 11 08 37 p m" src="https://github.com/user-attachments/assets/1283249a-b1b3-4ae7-9fe8-43c32cb2c89c">


## Tests

To run tests, choose discogs app, go to test section and run it

<img width="974" alt="Captura de pantalla 2024-11-26 a la(s) 11 34 11 p m" src="https://github.com/user-attachments/assets/f61b3e5a-0ca4-42c6-ab0a-d27cce208604">

<img width="276" alt="Captura de pantalla 2024-11-26 a la(s) 11 34 29 p m" src="https://github.com/user-attachments/assets/b2a886e8-dc30-4500-8054-737d2bda9e85">


## Swiftlint

The application has this framework and a rules file, which allows to maintain the code quality, if any rule is broken, xcode can't compile until the defect is fixed.

Also you can se the file ```swiftlint_report.html``` to see the report

## API Reference

#### Search artist by name

```http
  GET https://api.discogs.com/database/search?query={artist name}&type=artist&token={API key}&page={page}&per_page={element per paga}
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `page` | `Int` | page |
| `per_page` | `Int` | elements per page|
| `API key` | `String` | api key |
| `query` | `String` | Artist name |
| `type` | `String` | artist |



Example for api

```json
                          
{
    "pagination": {
        "page": 1,
        "pages": 13,
        "per_page": 10,
        "items": 127,
        "urls": {
            "last": "https://api.discogs.com/database/search?query=Coldplay&type=artist&token=WTsyWqIQOTqwyhdWvqQgxpYkGqVgUDWDiyPnjWcY&page=13&per_page=10",
            "next": "https://api.discogs.com/database/search?query=Coldplay&type=artist&token=WTsyWqIQOTqwyhdWvqQgxpYkGqVgUDWDiyPnjWcY&page=2&per_page=10"
        }
    },
    "results": [
        {
            "id": 29735,
            "type": "artist",
            "user_data": {
                "in_wantlist": false,
                "in_collection": false
            },
            "master_id": null,
            "master_url": null,
            "uri": "/artist/29735-Coldplay",
            "title": "Coldplay",
            "thumb": "https://i.discogs.com/V90awgfHX4AGcdXYb6M4w8Sl-zzxrK0nsMET0pUXMTw/rs:fit/g:sm/q:40/h:150/w:150/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9BLTI5NzM1/LTE3MjAwNjU1MTEt/NzM3Mi5qcGVn.jpeg",
            "cover_image": "https://i.discogs.com/sBor9_gG6g8eU12WLhcoDn_N88zv3F5VXh8i_lkVaW0/rs:fit/g:sm/q:90/h:385/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9BLTI5NzM1/LTE3MjAwNjU1MTEt/NzM3Mi5qcGVn.jpeg",
            "resource_url": "https://api.discogs.com/artists/29735"
        }
    ]
}             
                        
```

#### Get artist detail

```http
  GET https://api.discogs.com/artists/29735?token={token}
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `API key` | `String` | api key |

Example for api

```json

{
    "name": "Coldplay",
    "id": 29735,
    "resource_url": "https://api.discogs.com/artists/29735",
    "uri": "https://www.discogs.com/artist/29735-Coldplay",
    "releases_url": "https://api.discogs.com/artists/29735/releases",
    "images": [
        {
            "type": "primary",
            "uri": "https://i.discogs.com/sBor9_gG6g8eU12WLhcoDn_N88zv3F5VXh8i_lkVaW0/rs:fit/g:sm/q:90/h:385/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9BLTI5NzM1/LTE3MjAwNjU1MTEt/NzM3Mi5qcGVn.jpeg",
            "resource_url": "https://i.discogs.com/sBor9_gG6g8eU12WLhcoDn_N88zv3F5VXh8i_lkVaW0/rs:fit/g:sm/q:90/h:385/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9BLTI5NzM1/LTE3MjAwNjU1MTEt/NzM3Mi5qcGVn.jpeg",
            "uri150": "https://i.discogs.com/V90awgfHX4AGcdXYb6M4w8Sl-zzxrK0nsMET0pUXMTw/rs:fit/g:sm/q:40/h:150/w:150/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9BLTI5NzM1/LTE3MjAwNjU1MTEt/NzM3Mi5qcGVn.jpeg",
            "width": 600,
            "height": 385
        }
    ],
    "profile": "Coldplay is an English rock band from London, England. They've been a band since January 16, 1998 when they lost a demotape competition on XFM in London. Philip Christopher Harvey is the band's manager.\r\n\r\n[b][u]Line-up:[/u][/b]\r\nJonny Buckland (Jonathan Mark Buckland) - Guitar\r\nWill Champion (William Champion) - Drums\r\nGuy Berryman (Guy Rupert Berryman) - Bass\r\nChris Martin (Christopher Anthony John Martin) - Vocals",
    "urls": [
        "https://www.coldplay.com/",
        "https://www.facebook.com/coldplay/",
        "https://www.instagram.com/coldplay/",
        "https://www.youtube.com/coldplay",
        "https://twitter.com/coldplay",
        "https://en.wikipedia.org/wiki/Coldplay"
    ],
    "namevariations": [
        "Cold Play",
        "Cold Played",
        "Cold Player",
        "Fairplay",
        "Goldplay",
        "The Cold Player",
        "The Coldplay",
        "コールドプレイ",
        "コールド・プレイ",
        "酷玩乐团",
        "酷玩乐队",
        "酷玩樂團"
    ],
    "members": [
        {
            "id": 42610,
            "name": "Chris Martin",
            "resource_url": "https://api.discogs.com/artists/42610",
            "active": true,
            "thumbnail_url": "https://i.discogs.com/NFyFVEnACyWkCeZTCI4rtjwnI42bVT2jllB4CRZTIi4/rs:fit/g:sm/q:40/h:400/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9BLTQyNjEw/LTE3MTI3OTA4NTMt/Nzc0NS5qcGVn.jpeg"
        },
        {
            "id": 530745,
            "name": "Guy Berryman",
            "resource_url": "https://api.discogs.com/artists/530745",
            "active": true,
            "thumbnail_url": "https://i.discogs.com/oYUN-F78tCxd2e0d5YqD3u1NSEZ-HyaD_TfsDyZR4Q4/rs:fit/g:sm/q:40/h:908/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9BLTUzMDc0/NS0xNzEyNzkwOTcy/LTU5MDUuanBlZw.jpeg"
        },
        {
            "id": 530746,
            "name": "Will Champion",
            "resource_url": "https://api.discogs.com/artists/530746",
            "active": true,
            "thumbnail_url": "https://i.discogs.com/Glc_wiSj44R8TDI48sNDPpr7HJ0BUiLh5GN0pY7b1Ok/rs:fit/g:sm/q:40/h:364/w:500/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9BLTUzMDc0/Ni0xNzEyNzkxNDA0/LTU3MDcuanBlZw.jpeg"
        },
        {
            "id": 530747,
            "name": "Jon Buckland",
            "resource_url": "https://api.discogs.com/artists/530747",
            "active": true,
            "thumbnail_url": "https://i.discogs.com/yMN1FCG9rt2_gcc89Kp-mtvt_5njCMujo_lI-jfSdgY/rs:fit/g:sm/q:40/h:480/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9BLTUzMDc0/Ny0xNzEyNzkxMTg3/LTM4MzYuanBlZw.jpeg"
        },
        {
            "id": 530749,
            "name": "Phil Harvey",
            "resource_url": "https://api.discogs.com/artists/530749",
            "active": true,
            "thumbnail_url": "https://i.discogs.com/9U2Q7JhkMAizI2_tbqtR8mFg76PcCQkaGTQScux4n-Y/rs:fit/g:sm/q:40/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9BLTUzMDc0/OS0xNTQ0Mjk4NzE5/LTc1NjYuanBlZw.jpeg"
        }
    ],
    "data_quality": "Needs Vote"
}

```

To more detail [Artist](https://www.discogs.com/developers/#page:database,header:database-artist)


## Things to improve

- Framework dedicated to test, for create mocks or stubs
- UI by components
- TCA architecture for swiftUI
- Implement a snapshot testing for UI
- Add CI to check test coverage and the integration app
- Add script to remove APP setting when it go to PROD
- Add cocoakeys or similar framework to hide tokens of our APIs or third party frameworks

## Architecture

![CleanArchitecture](https://github.com/user-attachments/assets/b4ac4710-7b3e-436b-bb14-0ee6f29a2b12)

The core architecture of the weather app is clean, meaning the app was built with layers (frameworks) so the upper layers know the lower ones.
Each layer has its own tests

## Authors

- [@abrahmgo](https://www.github.com/abrahmgo)

