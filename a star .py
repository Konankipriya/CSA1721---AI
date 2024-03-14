import heapq

class Node:
    def __init__(self, position, parent=None):
        self.position = position
        self.parent = parent
        self.g = 0  # cost from start node to current node
        self.h = 0  # heuristic estimated cost from current node to goal node
        self.f = 0  # total cost: f = g + h

    def __lt__(self, other):
        return self.f < other.f

def heuristic(a, b):
    return abs(b[0] - a[0]) + abs(b[1] - a[1])  # Manhattan distance

def astar(grid, start, goal):
    open_set = []
    closed_set = set()
    
    start_node = Node(start)
    start_node.g = start_node.h = start_node.f = 0
    
    heapq.heappush(open_set, start_node)
    
    while open_set:
        current_node = heapq.heappop(open_set)
        
        if current_node.position == goal:
            path = []
            while current_node is not None:
                path.append(current_node.position)
                current_node = current_node.parent
            return path[::-1]
        
        closed_set.add(current_node.position)
        
        for i, j in [(0, 1), (0, -1), (1, 0), (-1, 0)]:
            neighbor_position = (current_node.position[0] + i, current_node.position[1] + j)
            
            if (0 <= neighbor_position[0] < len(grid)) and (0 <= neighbor_position[1] < len(grid[0])):
                if grid[neighbor_position[0]][neighbor_position[1]] == 1:
                    continue
                
                neighbor_node = Node(neighbor_position, current_node)
                neighbor_node.g = current_node.g + 1
                neighbor_node.h = heuristic(neighbor_node.position, goal)
                neighbor_node.f = neighbor_node.g + neighbor_node.h
                
                if neighbor_node.position in closed_set:
                    continue
                
                heapq.heappush(open_set, neighbor_node)
    
    return None

if __name__ == "__main__":
    grid = [
        [0, 0, 0, 0, 0],
        [0, 1, 1, 1, 0],
        [0, 0, 0, 0, 0],
        [0, 1, 1, 1, 0],
        [0, 0, 0, 0, 0]
    ]

    start = (0, 0)
    goal = (4, 4)

    path = astar(grid, start, goal)

    if path:
        print("Path found:", path)
    else:
        print("No path found.")
