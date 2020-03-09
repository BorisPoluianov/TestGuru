module GistsHelper
  def gist_hash(url)
    /[a-fA-F0-9]{32}/.match(url)
  end
end
