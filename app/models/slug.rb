class Slug
  class << self

    #pass in a slug, and it will return the post_id associated with the slug
    #hash is a method that returns 'post_id', the name of the hash that contains all the slugs, each pointing to a specific post id
    def [](slug)
      redis.hget(hash, slug)
    end

    def []=(slug, id) #Slug[bob_cat] = some_id
      if old = self[slug] #if slug already exists, set old = id
        redis.srem(set(old), slug) #set(old) => post_slugs_3, redis.srem(post_slugs_3, bob_cat) will remove slug from the set of slugs within the set of slugs for post with id 3
      end
      redis.hset(hash, slug, id) #set id of post as value of the key value slug
      redis.sadd(set(id), slug) #add slug to the set of slugs for specific post.
    end

    def destroy(id)
      redis.smembers(set(id)).each { |slug| redis.hdel(hash, slug) } #delete from the hash set of all slugs pointing to that id, which was stored in the set of slugs for specific post
      redis.del(set(id)) #delete that id storing all the slugs that pointed to it
    end

    private

    def redis
      $redis
    end

    def hash
      "post_ids"
    end

    def set(id)
      "post_slugs_#{id}"
    end
  end
end