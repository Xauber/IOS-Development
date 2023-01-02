//
//  main.swift
//  iOS3-Lippold-Decken
//
//  Created by  on 23.11.22.
//

import Foundation

var addressbook: AddressBook
if let _addressbook = AddressBook.addressBook(fromFile: "book.json"){
    print("parsed book.json:")
    print()
    addressbook = _addressbook
}else{
    print("prefilled addressbook:")
    print()
    addressbook = AddressBook()
    fillAddressBook(adressbook: addressbook)
}

//Show all at the beginning
printAddressList(addressbook: addressbook)

var programmRunning = true

while(programmRunning){
    print("(E)ingabe, (S)uche, (L)iste oder (Q)uit?")
    let keyPressed = readLine()
    
    if(keyPressed == "e"){
        let newCard = AddressCard()
        print("Geben sie den Vornamen ein:")
        if let vorname = readLine(){
            newCard.vorname = vorname
            print("Geben sie den Nachnamen ein:")
            if let nachname = readLine(){
                newCard.nachname = nachname
                print("Geben sie die Strasse und Hausnummer ein:")
                if let strasse = readLine(){
                    newCard.strasse = strasse
                    print("Geben sie die PLZ ein:")
                    if let plz = readLine(){
                        var plzInt = 0
                        if let _pltInt = Int(plz){
                            plzInt = _pltInt
                        }
                        newCard.plz = plzInt
                        print("Geben sie den Ort ein:")
                        if let ort = readLine(){
                            newCard.ort = ort
                            print("Hobby:")
                            var next = readLine()
                            while(next != "q"){
                                if let _newValue = next{
                                    newCard.add(hobby: Hobby(hobbyName: _newValue))
                                }
                                print("Hobby:")
                                next = readLine()
                            }
                        }
                    }
                }
            }
            addressbook.add(card: newCard)
        }
    }else if(keyPressed == "s"){
        print("Bitte geben Sie einen Nachnamen ein.")
        if let searchName = readLine(){
            let result = addressbook.find(nachname: searchName)
            for card in result{
                printAddressCard(addressbook: addressbook, card: card)
            }
            if(result.count > 0){
                print("(F)reund adden, (L)öschen")
                if let choice = readLine(){
                    if(choice == "f"){
                        print("Welchen Freund hinzufügen?")
                        if let toAdd = readLine(){
                            let addResult = addressbook.find(nachname: toAdd)
                            if(addResult.count > 0){
                                result[0].add(friend: addResult[0])
                                print("Freund hinzugefügt!")
                            }
                        }
                    }else if(choice == "l"){
                        addressbook.remove(card: result[0])
                    }
                }
            }
        }
    }else if(keyPressed == "l"){
        printAddressList(addressbook: addressbook)
    }else if(keyPressed == "q"){
        programmRunning = false
    }
}

//Save at the End
addressbook.save(toFile: "book.json")

//----helper functions----
func printAddressList(addressbook: AddressBook){
    for card in addressbook.adressCards{
        printAddressCard(addressbook: addressbook, card: card)
    }
}

func printAddressCard(addressbook: AddressBook, card: AddressCard){
    print("+-------------------")
    print("|\(card.vorname) \(card.nachname)")
    print("|\(card.strasse)")
    print("|\(card.plz) \(card.ort)")
    print("|Hobbys: ")
    for hobby in card.hobbyList{
        print("|   -\(hobby.hobbyName)")
    }
    print("|Freunde: ")
    for friendID in card.friendList{
        if let friend = addressbook.find(id: friendID){
            print("|   -\(friend.vorname) \(friend.nachname)")
        }
    }
    print("+-------------------")
    print()
}

func fillAddressBook(adressbook: AddressBook){
    let ben = AddressCard()
    ben.vorname = "Ben"
    ben.nachname = "Lippold"
    ben.strasse = "Gehainstraße 4"
    ben.plz = 12439
    ben.ort = "Berlin"
    ben.add(hobby: Hobby(hobbyName: "spazieren"))
    ben.add(hobby: Hobby(hobbyName: "sitzen"))
    addressbook.add(card: ben)
    
    let max = AddressCard()
    max.vorname = "Max"
    max.nachname = "Decken"
    max.strasse = "Gecauerstraße 22"
    max.plz = 10587
    max.ort = "Berlin"
    max.add(hobby: Hobby(hobbyName: "essen"))
    max.add(hobby: Hobby(hobbyName: "musik hören"))
    addressbook.add(card: max)
    
    let guido = AddressCard()
    guido.vorname = "Guido"
    guido.nachname = "von der Ecke"
    guido.strasse = "Geheimstraße -1"
    guido.plz = 00007
    guido.ort = "Geheim"
    guido.add(hobby: Hobby(hobbyName: "geheim sein"))
    guido.add(hobby: Hobby(hobbyName: "james bond filme"))
    addressbook.add(card: guido)
}

