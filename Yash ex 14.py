


courses = {
    "AI": ["Python", "Machine Learning",
           "Data Science"],
    "Web Development": ["HTML", "CSS",
                        "JavaScript"],
    "Cyber Security": ["Networking",
                       "Security", "Linux"],
    "Data Science": ["Python", "Statistics",
                     "Machine Learning"]
}


interests = ["Python", "Machine Learning"]

print("Student Interests:", interests)
print("\nRecommended Courses:")

recommendations = []

for course, skills in courses.items():
    score = len(set(interests) & set(skills))

    if score > 0:
        recommendations.append((course, score))

recommendations.sort(key=lambda x: x[1],
                     reverse=True)

for course, score in recommendations:
    print(course, "- Match Score:", score)
