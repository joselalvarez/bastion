    package org.jl.bastion.cache.consumer
import io.micronaut.cache.annotation.CacheConfig
import io.micronaut.configuration.kafka.annotation.KafkaKey
import io.micronaut.configuration.kafka.annotation.KafkaListener
import io.micronaut.configuration.kafka.annotation.OffsetReset
import io.micronaut.configuration.kafka.annotation.Topic
import org.jl.bastion.cache.config.RemoteCacheFactory
import org.jl.bastion.cache.service.UserInfoCacheService
import org.slf4j.LoggerFactory

@KafkaListener(offsetReset = OffsetReset.EARLIEST)
@CacheConfig(cacheNames = ["userinfo"])
open class UserUpdateListener(
        private val userInfoCacheService: UserInfoCacheService,
        private val remoteCacheFactory: RemoteCacheFactory
) {

    private val logger = LoggerFactory.getLogger(UserUpdateListener::class.java)

    @Topic("\${user-update.topic}")
    fun updateUser(@KafkaKey realm: String, subject: String) {
        logger.info("User updated realm: '{}', subject: '{}'", realm, subject)
        remoteCacheFactory.getUserInfoRemoteCache()
        userInfoCacheService.invalidateCacheKey(subject)
    }

}