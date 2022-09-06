# KeyChainProtection2

Hello and welcome, I know that I haven't written in a long time. I've had some troubles, but I know you don't care about them :D. Anyway, let's talking about keychain.

I wrote writing about keychain in before, although I couldn't explain how to protect our clients from unsafe keychain datas.

We know what, if remove an app from device, keychain datas that the app own will not delete. What's meaning that? Let's say you created a social media app, and to use, you store a token in device. If you chose keychain to store a token, you have to write little bit more code.

If our clients remove app from device even, keychain datas still will be store in device. As a result we have to check keychain in first launch. 

```swift
    func firsTimeLunc() -> Bool{
        let defaults = UserDefaults.standard
        if (defaults.bool(forKey: "firstTimeCheck4keyChain")){
            return false
        }
        else{
            defaults.set(true, forKey: "firstTimeCheck4keyChain")
            return true
        }
    }
```

You can detect first runining time of app, with above code. Okay, now we can detect when app when first time launch. We should delete all keychain datas associate with our app. For this you can use below the code.

```swift
func deleteAllKeyChains(){
        let secItemClasses = [kSecClassGenericPassword, kSecClassInternetPassword, kSecClassCertificate, kSecClassKey, kSecClassIdentity]
        for itemClass in secItemClasses {
            let spec: NSDictionary = [kSecClass: itemClass]
            SecItemDelete(spec)
        }
    }
```

Consequently our code last version will be like below. So that you securely store a token in keychain, you should delete keychain when the app run first time.

```swift
        if(firsTimeLunc()){
            deleteAllKeyChains()
        }
```

See you next time.
https://berenkudaygorun.com/
