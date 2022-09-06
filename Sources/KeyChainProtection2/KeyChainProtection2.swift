import UIKit

public struct KeyChainProtection2 {


    public init() {
        
    }
    
    public func start(){
        if(firsTimeLunc()){
            print("First")
            self.deleteAllKeyChains()
        }
        else
        {
            print("Not first")
        }
    }
    
    private func firsTimeLunc() -> Bool{
        let defaults = UserDefaults.standard
        if (defaults.bool(forKey: "firstTimeCheck4keyChain")){
            return false
        }
        else{
            defaults.set(true, forKey: "firstTimeCheck4keyChain")
            return true
        }
    }
    
    private func deleteAllKeyChains(){
        let secItemClasses = [kSecClassGenericPassword, kSecClassInternetPassword, kSecClassCertificate, kSecClassKey, kSecClassIdentity]
        for itemClass in secItemClasses {
            let spec: NSDictionary = [kSecClass: itemClass]
            SecItemDelete(spec)
            
        }
        print("All data has been deleted.")
        
    }
    
}

