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
        "station": string
    }
}
```

例)

```bash
{
    "status": "SUCCESS",
    "data": {
        "station": "赤羽橋駅"
    }
}
```

## Preview

https://user-images.githubusercontent.com/58369263/189316760-d04f0964-282f-46c8-bcb3-5fa9c1f1696a.mov

