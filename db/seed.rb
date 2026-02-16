skills = %w[Ruby Rails JavaScript React Python AWS Docker Kubernetes]
skills.each { |s| Skill.create(name: s) }

User.create(email: "freelancer@example.com", password: "password123")
User.create(email: "client@example.com", password: "password123")
client = User.find_by(email: "client@example.com")
skills = Skill.all.sample(3)

project1 = Project.create(title: "Build Rails API", description: "API for mobile app", user: client)
project1.skills << skills

project2 = Project.create(title: "React Frontend", description: "Dashboard UI", user: client)
project2.skills << skills
