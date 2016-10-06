module PathsHelper
  def if_finish_all_missions?(course)
    all_missions = course.missions.count
    finished_missions = course.missions.finished.count

    result = (all_missions == finished_missions)
  end
end
