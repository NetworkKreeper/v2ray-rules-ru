# Introduction

Russian-specific `geoip.dat` and `geosite.dat` files to use with [v2ray](https://github.com/XTLS/Xray-core) proxies. 

It adds the following tags to both data files:
- `:antifilter` for sites that are blocked in Russia 
- `:antifilter-community` for sites that block traffic originating from Russian IP addresses

# Download

You can download the latest version of the files from the [releases page](https://github.com/NetworkKreeper/v2ray-rules-dat-ru/releases).

- **geoip.dat:**  https://github.com/NetworkKreeper/v2ray-rules-dat-ru/releases/latest/download/geoip.dat
- **geosite.dat:**  https://github.com/NetworkKreeper/v2ray-rules-dat-ru/releases/latest/download/geosite.dat

# Usage

Here's how a typical x2ray routing section could look like:

```json
{
  "rules": [
    {
      "type": "field",
      "domain": "geosite:category-ads-all",
      "outboundTag": "block"
    },
    {
      "type": "field",
      "domain": [ "geosite:antifilter", "geosite:antifilter-community" ],
      "outboundTag": "vless"
    },
    {
      "type": "field",
      "ip": [ "geoip:antifilter", "geoip:antifilter-community" ],
      "outboundTag": "vless"
    }
  ]
}
```

# Full list of modifications

## GeoIP.dat

- Base list is taken from [Loyalsoldier repo](https://github.com/Loyalsoldier/geoip) that contains both countries and popular services
- All countries except `ru` are removed
- [Antifilter](https://antifilter.download) and [Antifilter Community](https://community.antifilter.download) CIDR lists are added:  `geoip:antifilter`, `geoip:antifilter-community`
- Available service ip ranges: anthropic, cloudflare, cloudfront, facebook, google, fastly, netflix, telegram, twitter

## GeoSite.dat

- Base list is taken from [v2fly domain-list-community](https://github.com/v2fly/domain-list-community)
- [Antifilter](https://antifilter.download) and [Antifilter Community](https://community.antifilter.download) domain lists are added:  `geosite:antifilter`, `geosite:antifilter-community`