## Follow steps to run IOS

- Run terminal `npm install rn-paytabs --save`
- Run terminal `react-native link rn-paytabs`
- Move to ios folder and create `Podfile` (check [docs/Podfile](docs/Podfile)
)
- Run terminal `Pod install` [https://cocoapods.org/](https://cocoapods.org/)
- Open `your-project-name.xcworkspace`, drag [docs/paytabs-iOS.framework](docs/paytabs-iOS.framework) to your ios main folder(your-project-name)
- Do the same for  [docs/Resources.bundle](docs/Resources.bundle)
- Please read paytabs ios sdk documentation [docs/paytabs-ios-sdk-v3.0.pdf](docs/paytabs-ios-sdk-v3.0.pdf)
,should help you link sdk files with your project correctly.
- Enjoy!
