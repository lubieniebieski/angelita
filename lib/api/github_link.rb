class GithubLink
  attr_reader :org_name

  def initialize(org_name)
    @org_name = org_name
  end

  def compare(repo, stage1 = nil, stage2 = nil)
    stage1 ||= 'production'
    stage2 ||= 'master'
    "https://github.com/#{repo_path(repo)}/compare/#{stage1}...#{stage2}"
  end

  private

  def repo_path(name)
    if name.match(/\//)
      name
    else
      "#{org_name}/#{name}"
    end
  end
end
