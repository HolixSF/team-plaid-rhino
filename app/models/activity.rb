class Activity
  class << self
    def [](id) #user_id
      redis.lrange(list(id), 0, 9) #not sure if correct syntax
    end

    def []=(id, activity)
      redis.lpush(list(id), activity)
      redis.ltrim(list(id), 0, 9)
    end

    # def destroy(id)
    #   redis.smembers(set(id)).each { |activity| redis.hdel(list, activity) }
    #   redis.del(set(id)) to it
    # end

    private

    def redis
      $redis
    end

    def list(id)
      "user_#{id}_activity"
    end
  end
end