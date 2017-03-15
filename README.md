# AnalyticsPros_iOS_Code_Challenge
This is a repository that holds the iOS code challenge for Analytics Pros.


## Objective
1. Send an AppView/ScreenView from Google Tag Manager (GTM) to Google Analytics (GA). The screen name should be "detail_screen".
2. Send an Event from GTM to GA. The event category should be "favorite_color". The event action should be "submit". The event label should be the string value populated by the textfield.
3. Bonus: Send an Enhanced Ecommerce Product Impression from GTM to GA. List should be "Front Page". Position should be 1.
4. Bonus: Send an Enhanced Ecommerce Product Transaction from GTM to GA. Quantity should be 1.

## Process
1. Fork this repository.
2. Create your solution within this repository.
3. Add the Google Tag Manager SDK into the application
4. Add dataLayer pushes that will trigger and send the specified screen and events above.
5. Configure your Google Tag Manager container to handle these pushes and send this information to your Google Analytics Property.



## Support

Recommended Resources:
* [GTM Installation](https://developers.google.com/tag-manager/ios/v3/)
* [Enhanced Ecommerce](https://developers.google.com/tag-manager/ios/v3/enhanced-ecommerce)

Note:
* There is version 5 of iOS GTM. Do not use this version for this challenge. Use version 3 as described in the documentation linked above.
* You will need to create your own [Google Analytics Account](https://www.google.com/analytics/#?modal_active=none) and [Google Tag Manager Container](https://www.google.com/analytics/tag-manager/).
* The .dylib libraries may have been replaced by .tbd libraries depending on the version of XCode used. Use either.
* libGoogleAnalyticsServices.a and GTM Header files can be found [here](https://developers.google.com/tag-manager/ios/v3/downloads). Use the most updated version.
