//
//  quotation.swift
//  app1
//
//  Created by Кирилл on 11.05.2021.
//

import Foundation

struct valute:Codable{
    struct name:Codable{
        struct usd_val:Codable{
            let Value:Double
        }
        struct eur_val:Codable{
            let Value:Double
        }
        struct jpy_val:Codable{
            let Value:Double
        }
        struct aud_val:Codable{
            let Value:Double
        }
        struct cad_val:Codable{
            let Value:Double
        }
        struct chf_val:Codable{
            let Value:Double
        }
        struct cny_val:Codable{
            let Value:Double
        }
        struct czk_val:Codable{
            let Value:Double
        }
        struct gbp_val:Codable{
            let Value:Double
        }
        struct nok_val:Codable{
            let Value:Double
        }
        struct sek_val:Codable{
            let Value:Double
        }
        let EUR: eur_val
        let USD: usd_val
        let JPY: jpy_val
        let AUD: aud_val
        let CAD: cad_val
        let CHF: chf_val
        let CNY: cny_val
        let CZK: czk_val
        let GBP: gbp_val
        let NOK: nok_val
        let SEK: nok_val
    }
    let Valute: name
}

struct Valutes:Codable{
    var Valute: [valute]
}

struct all_costs{
    var EUR: Double = 0
    var USD: Double = 0
    var JPY: Double = 0
    var AUD: Double = 0
    var CAD: Double = 0
    var CHF: Double = 0
    var CNY: Double = 0
    var CZK: Double = 0
    var GBP: Double = 0
    var NOK: Double = 0
    var SEK: Double = 0
}

class for_costs{
    
    required init() {
    }
    
    var valutes = all_costs()

}

struct quote: Codable{
    let converted: Double
}

func find_quotes(val1: String, val2:String) -> String{
    let urlString = "https://api.polygon.io/v1/conversion/" + val1 + "/" + val2 + "?amount=1&precision=2&apiKey=fbr79axfr6cfkKPPim1ITWn2_uSo736K"
    let url = URL(string: urlString)!
    var a: String = ""
    if let data = try? Data(contentsOf: url) {
        a = parse(json: data)
    }
    return (a)
}
func find_quotes_convertor(val1: String, val2:String, count:Double) -> String{
    let urlString = "https://api.polygon.io/v1/conversion/" + val1 + "/" + val2 + "?amount=" + String(count) + "&precision=" + convert.GlobalVariable.acc + "&apiKey=fbr79axfr6cfkKPPim1ITWn2_uSo736K"
    let url = URL(string: urlString)!
    var a: String = ""
    if let data = try? Data(contentsOf: url) {
        a = parse(json: data)
    }
    return (a)
}
func parse(json: Data) -> String {
    let decoder = JSONDecoder()
    var a: String = ""
    var x: Double = 0
    if let jsonPetitions = try? decoder.decode(quote.self, from: json) {
        x = jsonPetitions.converted
    }
    a = String(x)
    return (a)
}
