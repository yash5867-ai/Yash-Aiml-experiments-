
# Blocks World Problem

# Initial state
initial_state = ["A", "B", "C"]

# Goal state
goal_state = ["C", "B", "A"]

print("Initial State:", initial_state)

# Move blocks to achieve goal state
current_state = initial_state.copy()

while current_state != goal_state:
    current_state.reverse()
    break

print("Goal State:", goal_state)
print("Final State:", current_state)

if current_state == goal_state:
    print("Goal achieved successfully!")
else:
    print("Goal not achieved.")
