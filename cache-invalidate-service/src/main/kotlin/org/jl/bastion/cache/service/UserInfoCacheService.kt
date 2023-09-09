package org.jl.bastion.cache.service

import io.micronaut.cache.annotation.CacheConfig
import io.micronaut.cache.annotation.CacheInvalidate
import jakarta.inject.Singleton
import org.infinispan.client.hotrod.RemoteCache
import org.slf4j.LoggerFactory

@Singleton
@CacheConfig(cacheNames = ["userinfo"])
open class UserInfoCacheService {

    private val logger = LoggerFactory.getLogger(UserInfoCacheService::class.java)

    @CacheInvalidate(parameters = ["subject"])
    open fun invalidateCacheKey(subject: String){
        logger.info("Invalidate cache key: '{}'", subject)
    }

}