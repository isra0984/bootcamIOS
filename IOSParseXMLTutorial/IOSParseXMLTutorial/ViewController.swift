//
//  ViewController.swift
//  IOSParseXMLTutorial
//
//  Created by Israel Torres Alvarado on 06/07/21.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var booksTableView: UITableView!
    
    var elementName = String()
    var bookTitle = String()
    var bookAuthor = String()

    var books: [Book] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        booksTableView.dataSource = self
        
        AF.request("https://run.mocky.io/v3/fb99a6af-9f74-445c-a877-0926b8f0d6f0").response { response in
            
            guard let value = response.value,
                  let realValue = value else {
                return
            }
            
            let xmlResult = XMLParser(data: realValue)
            xmlResult.delegate = self
            xmlResult.parse()
        
        }
        
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        let book = books[indexPath.row]
        
        cell.textLabel?.text = "Nombre: \(book.title)\nAutor: \(book.author)"
        cell.textLabel?.numberOfLines = 2
        
        return cell
    }
    
}

extension ViewController: XMLParserDelegate {

    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        if elementName == "book" {
            bookTitle = ""
            bookAuthor = ""
        }
        
        self.elementName = elementName
        
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        if elementName == "book" {
            
            let book = Book(title: bookTitle, author: bookAuthor)
            books.append(book)
            
        }
     
     }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        let data = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        if !data.isEmpty {
            
            if self.elementName == "title" {
                bookTitle = data
            } else if self.elementName == "author" {
                bookAuthor = data
            }
        
        }
        
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        dump(self.books)
        booksTableView.reloadData()
    }
    
}



