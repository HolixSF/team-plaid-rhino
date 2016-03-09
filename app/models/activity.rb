class Activity
  class << self

    def []=(id, activity)
      # redis.lpush("user_#{id}_activity", activity)
      # redis.ltrim("user_#{id}_activity", 0, 9)
      redis.lpush(list(id), activity)
      redis.ltrim(list(id), 0, 9)
    end

    def [](id) #user_id
      # redis.lrange("user_#{id}_activity", 0, 9)
      redis.lrange(list(id), 0, 9)
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