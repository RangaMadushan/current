

import Foundation

struct ProgrammingLanguage
{
    let name: String
    let popularity: Double
}

class ProgrammingLanguageDataStore
{

    class func generate() -> [ProgrammingLanguage]
    {
    
        return [
        
            ProgrammingLanguage(name: "Medicle= 20", popularity: 21.465),
            ProgrammingLanguage(name: "Short= 16", popularity: 16.036),
            ProgrammingLanguage(name: "Bonus= 6", popularity: 6.914),
            ProgrammingLanguage(name: "Other= 4", popularity: 4.707)
            
        ]
    }
}
