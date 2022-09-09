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
address: string
```

例)

```bash
address: "東京都港区芝公園４丁目２−８"
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