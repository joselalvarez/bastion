package org.jl.bastion.patient.service

import io.micronaut.cache.annotation.CacheConfig
import io.micronaut.cache.annotation.Cacheable
import io.micronaut.http.HttpStatus
import jakarta.inject.Singleton
import org.jl.bastion.patient.client.UserInfoClient
import org.jl.bastion.patient.model.UserInfo
import org.slf4j.LoggerFactory

@Singleton
@CacheConfig(cacheNames = ["userinfo"])
open class UserInfoService(private val userInfoClient: UserInfoClient) {

    val logger = LoggerFactory.getLogger(UserInfoService::class.java)

    @Cacheable(parameters = ["subject"])
    open fun getInfo(subject: String, authorization: String): UserInfo? {
        logger.info("Getting UserInfo for subject: '{}'", subject)
        val userInfoResponse = userInfoClient.getInfo(authorization)
        if (userInfoResponse.status == HttpStatus.OK) {
            return userInfoResponse.body()
        }
        return null
    }
}