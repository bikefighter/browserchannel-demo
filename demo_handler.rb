# Example Handler that echos data.
class DemoHandler
  REQ_REGEXP = /^req(\d*)_(.*)$/
  def initialize session
    @session = session
  end
  def terminate
  end
  def call post_data
    requests = decode_post_data post_data
    requests.each { |r| @session << [r] }
  end
  private 
  def decode_post_data post_data
    count = [0,post_data['count'].to_i].max
    requests = Array.new(count){Hash.new}
    post_data.each do |key, value|
      next unless match = REQ_REGEXP.match(key)
      index = match[1].to_i
      next if index < 0 or index >= count
      requests[index][match[2]] = value
    end
    requests
  end
end