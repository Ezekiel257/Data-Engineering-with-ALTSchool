

# Link List

class Node():
    
    def __init__(self, data, next):
        self.data = data
        self.next = None
    
    
nodeA = Node(6)
nodeB = Node(3)
nodeC = Node(4)
nodeD = Node(2)
nodeE = Node(1)


nodeA.next = nodeB
nodeB.next = nodeC
nodeC.next = nodeD
nodeD.next = nodeE