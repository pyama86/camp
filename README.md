# pyama camp

各地のキャンプ上の空き状況を取得するライブラリです。下記のように利用してください。

```ruby
require 'pyama-camp'

Camp.can_reserve_sites(Date.parse("2021/1/16"))
# ["Montbell B Site", "Montbell C Site", "Hadomisaki"]
```

予約できるサイト名が返却されるので、必要に応じてSlack通知するなどして、即予約してください。

## 対応しているキャンプサイト

- 五ケ山クロス モンベルB/Cサイト
- 波戸岬キャンプ場
