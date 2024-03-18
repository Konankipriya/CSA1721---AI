import random

def alpha_beta_pruning(current_depth, node_index, max_turn, scores, alpha, beta, target_depth):
    if current_depth == target_depth:
        return scores[node_index]

    if max_turn:
        max_eval = float("-inf")
        for i in range(2):
            eval = alpha_beta_pruning(current_depth + 1, node_index * 2 + i, False, scores, alpha, beta, target_depth)
            max_eval = max(max_eval, eval)
            alpha = max(alpha, eval)
            if beta <= alpha:
                break
        return max_eval
    else:
        min_eval = float("inf")
        for i in range(2):
            eval = alpha_beta_pruning(current_depth + 1, node_index * 2 + i, True, scores, alpha, beta, target_depth)
            min_eval = min(min_eval, eval)
            beta = min(beta, eval)
            if beta <= alpha:
                break
        return min_eval

def build_tree(scores, target_depth):
    alpha = float("-inf")
    beta = float("inf")
    return alpha_beta_pruning(0, 0, True, scores, alpha, beta, target_depth)

def main():
    # Generate random scores for demonstration
    scores = [random.randint(0, 100) for _ in range(15)]
    print("Generated Scores:", scores)

    # Set the maximum depth of the tree (adjust as needed)
    target_depth = 3
    root_value = build_tree(scores, target_depth)

    print("The optimal value is:", root_value)

if _name_ == "_main_":
    main()
