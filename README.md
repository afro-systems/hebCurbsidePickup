# H-E-B Curbside Notify

[![H-E-B|Curbside](https://images.heb.com/is/image/HEBGrocery/article-png/2020-Curbside-Landing-Page-curbsidelogo.jpg)](https://www.heb.com/static-page/heb-curbside-delivery)
Get-HEBCurbsideTimes allows users to search by ZIP code to see the soonest available curbside pickup date at their local store.

### Powershell FTW!

```powershell
$ Get-HEBCurbSideTimes -ZipCode 78240 -Radius 5

Store                 : Marketplace H-E-B
NextAvailableTimeSlot : 4/17/2020 2:30:00 PM
Distance (mi)         : 3.19
Address               : 5601 BANDERA ROAD
Store Hours           : Mon-Sun 08:00 AM - 08:00 PM

Store                 : Bandera and Guilbeau H-E-B
NextAvailableTimeSlot : 4/23/2020 3:00:00 PM
Distance (mi)         : 2.45
Address               : 7951 GUILBEAU RD.
Store Hours           : Mon-Sun 08:00 AM - 08:00 PM

Store                 : Bandera and 1604 H-E-B plus!
NextAvailableTimeSlot : 4/23/2020 6:30:00 PM
Distance (mi)         : 4.14
Address               : 9238 N.LOOP 1604 WEST
Store Hours           : Mon-Sun 08:00 AM - 08:00 PM
```

### Todos
 - E-mail notification
 - Pushover integration