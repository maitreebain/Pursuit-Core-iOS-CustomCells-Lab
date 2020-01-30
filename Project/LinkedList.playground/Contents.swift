import UIKit

//implement a Node structure

class Node<T: Equatable>: Equatable {
    var value: T
    var next: Node? // Singly linked list
    //var previous: Node? // Doubly linked list
    
    //required function for Equatable
    //lhs: tail == rhs: head
    static func ==(lhs: Node, rhs: Node) -> Bool { //function override
        return lhs.value == rhs.value && lhs.next == rhs.next
    }
    
    init(value: T) {
        self.value = value
    }
}

//implementing CustomStringConvertible to customize description of a Node
extension Node: CustomStringConvertible {
    var description: String {
        guard let next = next else {
            return "\(value) -> nil" // 12 -> nil
        }
        // if we have connected nodes
        return "\(value) -> \(next)"
    }
}

//instantiating node instances
let car12 = Node<Int>(value: 12)
let car99 = Node<Int>(value: 99)
let car32 = Node<Int>(value: 32)

//link our nodes (linked list using connected nodes)
car12.next = car99
car99.next = car32
//car99.previous = car12 <->

//print the current stare of the linked node
//in order to print our connected nodes in a readable manner
//we conformed to CustomStringConvertible
//implement var description and wrote the print logic

print(car12) // 12 -> 99

//=======================================================
// implementation of a Linked List
class LinkedList<T: Equatable> {
    var head: Node<T>? //nil
    var tail: Node<T>? //nil
    
    //first computed property
    public var first: Node<T>? {
        return head
    }
    //last computed property
    public var last: Node<T>? {
        return tail
    }
    //append method - adds a Node to the end of the list
    public func append(_ value: T) {
        // create a node
        let newNode = Node(value: value)
        
        //scenario 1: appending to empty list
        guard let lastNode = tail else {
            head = newNode
            tail = head
            return
        }
        
        lastNode.next = newNode
        tail = newNode
    }
    
    //removeLast method - removes the last node from the end of the list
    public func removeLast() -> Node<T>? {
        //scenario 1:
        guard let _ = head else {
            return nil
        }
        
        var removedNode: Node<T>?
        
        if head == tail {
            //scenario 2 - if head and tail are pointing to the same Node
            removedNode = head
            head = nil
            tail = nil
            return removedNode
        }
        
        // scenario 3
        
        var currentNode = head
        
        while currentNode?.next != tail { // stop at Node before the tail
            // keep traversing
            currentNode = currentNode?.next
        }
        //where is currentNode at the end of the while loop
        
        //save the tail's node before removing the last node(tail)
        removedNode = tail
        
        //set tail to Node before the last node
        tail = currentNode
        //point to nil
        currentNode?.next = nil
        
        return removedNode
    }

}


extension LinkedList: CustomStringConvertible {
    var description: String {
        guard let head = head else {
            return "empty list"
        }
        
        return "\(head)"
    }
    
    
}

let fellows = LinkedList<String>()
fellows.append("Oscar")
fellows.append("Tanya")
fellows.append("David")
print(fellows) // Oscar -> nil

//test removing last node
fellows.removeLast()
print(fellows)

fellows.append("Luba")
print(fellows)


