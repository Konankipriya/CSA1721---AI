class State:
    def _init_(self, missionaries, cannibals, boat):
        self.missionaries = missionaries
        self.cannibals = cannibals
        self.boat = boat

    def is_valid(self):
        if self.missionaries < 0 or self.missionaries > 3:
            return False
        if self.cannibals < 0 or self.cannibals > 3:
            return False
        if self.missionaries < self.cannibals and self.missionaries > 0:
            return False
        if 3 - self.missionaries < 3 - self.cannibals and 3 - self.missionaries > 0:
            return False
        return True

    def _eq_(self, other):
        return self.missionaries == other.missionaries and self.cannibals == other.cannibals and self.boat == other.boat

    def _hash_(self):
        return hash((self.missionaries, self.cannibals, self.boat))

    def _str_(self):
        return f"M: {self.missionaries}, C: {self.cannibals}, B: {self.boat}"

def successors(state):
    successors_list = []
    if state.boat == 'left':
        new_state = State(state.missionaries - 2, state.cannibals, 'right')
        if new_state.is_valid():
            successors_list.append(new_state)
        new_state = State(state.missionaries, state.cannibals - 2, 'right')
        if new_state.is_valid():
            successors_list.append(new_state)
        new_state = State(state.missionaries - 1, state.cannibals - 1, 'right')
        if new_state.is_valid():
            successors_list.append(new_state)
        new_state = State(state.missionaries - 1, state.cannibals, 'right')
        if new_state.is_valid():
            successors_list.append(new_state)
        new_state = State(state.missionaries, state.cannibals - 1, 'right')
        if new_state.is_valid():
            successors_list.append(new_state)
    else:
        new_state = State(state.missionaries + 2, state.cannibals, 'left')
        if new_state.is_valid():
            successors_list.append(new_state)
        new_state = State(state.missionaries, state.cannibals + 2, 'left')
        if new_state.is_valid():
            successors_list.append(new_state)
        new_state = State(state.missionaries + 1, state.cannibals + 1, 'left')
        if new_state.is_valid():
            successors_list.append(new_state)
        new_state = State(state.missionaries + 1, state.cannibals, 'left')
        if new_state.is_valid():
            successors_list.append(new_state)
        new_state = State(state.missionaries, state.cannibals + 1, 'left')
        if new_state.is_valid():
            successors_list.append(new_state)
    return successors_list

def breadth_first_search():
    start_state = State(3, 3, 'left')
    goal_state = State(0, 0, 'right')

    if start_state == goal_state:
        return [start_state]

    frontier = deque([start_state])
    explored = set()

    while frontier:
        state = frontier.popleft()
        if state == goal_state:
            path = []
            while state:
                path.append(state)
                state = state.parent
            return path[::-1]
        explored.add(state)
        for child in successors(state):
            if child not in explored and child not in frontier:
                child.parent = state
                frontier.append(child)

    return None

def print_solution(path):
    print("Solution:")
    for state in path:
        print(state)

if _name_ == "_main_":
    solution = breadth_first_search()
    if solution:
        print_solution(solution)
    else:
        print("No solution found.")
