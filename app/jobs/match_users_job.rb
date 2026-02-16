class MatchUsersJob < ApplicationJob
  queue_as :default

  def perform(project)
    User.joins(:skills).where(skills: { id: project.skills.pluck(:id) }).each do |user|
      Match.create(user: user, project: project, status: "pending")
    end
  end
end
