# 最寄駅検索API

## 使用方法

### 1. サーバー立ち上げ

```bash
$ rails s
```

### 2. APIリクエストを送る

**URL**

```bash
GET http://localhost:3000/nearest-station
``` 

**input**

```bash
"http://localhost:3000/nearest-station?address=string"
```

例)

```bash
"http://localhost:3000/nearest-station?address=東京都港区芝公園４丁目２−８"
```

**output**

```bash
{
    "status": "SUCCESS",
    "data": {
        "station": string,
        "minutes": number
    }
}
```

例)

```bash
{
    "status": "SUCCESS",
    "data": {
        "station": "赤羽橋駅",
        "minutes": 6
    }
}
```

## Preview

https://user-images.githubusercontent.com/58369263/189564328-b8c4ab89-fc73-4fe1-b5fb-27075ab4997c.mov


