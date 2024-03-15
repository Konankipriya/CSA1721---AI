class MapColoringCSP:
    def _init_(self, variables, domains, constraints):
        self.variables = variables
        self.domains = domains
        self.constraints = constraints

    def is_consistent(self, variable, color, assignment):
        for neighbor in self.constraints.get(variable, []):
            if neighbor in assignment and assignment[neighbor] == color:
                return False
        return True

    def backtracking_search(self, assignment={}):
        if len(assignment) == len(self.variables):
            return assignment  # All variables are assigned
        var = next((v for v in self.variables if v not in assignment), None)
        for value in self.domains[var]:
            if self.is_consistent(var, value, assignment):
                assignment[var] = value
                result = self.backtracking_search(assignment)
                if result:
                    return result
                assignment.pop(var, None)  # Backtrack
        return None

# Example usage
if __name__ == "_main_":
    # Variables represent regions, domains represent colors
    variables = ["WA", "NT", "SA", "Q", "NSW", "V", "T"]
    domains = {v: ["red", "green", "blue"] for v in variables}

    # Constraints represent adjacent regions that can't have the same color
    constraints = {
        "WA": ["NT", "SA"],
        "NT": ["WA", "SA", "Q"],
        "SA": ["WA", "NT", "Q", "NSW", "V"],
        "Q": ["NT", "SA", "NSW"],
        "NSW": ["Q", "SA", "V"],
        "V": ["SA", "NSW"],
        "T": []
    }

    csp = MapColoringCSP(variables, domains, constraints)
    solution = csp.backtracking_search()
    if solution:
        print("Solution found:")
        for region, color in solution.items():
            print(f"{region}: {color}")
    else:
        print("No solution found.")
