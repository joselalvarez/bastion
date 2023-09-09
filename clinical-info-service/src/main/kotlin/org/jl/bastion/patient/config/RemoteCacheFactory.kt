package org.jl.bastion.patient.config

import io.micronaut.context.annotation.Value
import io.micronaut.core.io.ResourceLoader
import io.micronaut.core.io.ResourceResolver
import io.micronaut.core.io.file.FileSystemResourceLoader
import io.micronaut.core.io.scan.ClassPathResourceLoader
import jakarta.inject.Singleton
import org.infinispan.client.hotrod.RemoteCache
import org.infinispan.client.hotrod.RemoteCacheManager
import org.infinispan.commons.configuration.XMLStringConfiguration
import org.slf4j.LoggerFactory


@Singleton
class RemoteCacheFactory(
    private val remoteCacheManager: RemoteCacheManager,
    @Value("\${infinispan.client.hotrod.cache.name}") private val userinfoCacheName: String,
    @Value("\${infinispan.client.hotrod.cache.config-file}") private val userinfoCacheFile: String
) {

    private val logger = LoggerFactory.getLogger(RemoteCacheFactory::class.java)

    private var userInfoRemoteCache: RemoteCache<String, String>? = null

    fun getUserInfoRemoteCache(): RemoteCache<String, String>? {
        if (userInfoRemoteCache == null) {
            logger.info("Config remote cache '{}' with file: '{}'", userinfoCacheName, userinfoCacheFile)
            var loader : ResourceLoader = ResourceResolver().getLoader(FileSystemResourceLoader::class.java).get()
            if (userinfoCacheFile.startsWith("classpath:")) {
                loader = ResourceResolver().getLoader(ClassPathResourceLoader::class.java).get()
            }
            val resource = loader.getResource(userinfoCacheFile)
            if (resource.isPresent) {
                val config = resource.get().readText()
                logger.info("{}", config)
                userInfoRemoteCache = remoteCacheManager.administration().getOrCreateCache<String, String>(userinfoCacheName, XMLStringConfiguration(config))
                logger.info("Remote Cache has been configured!!")
            }else {
                logger.error("Remote cache file '{}' not found!", userinfoCacheName, userinfoCacheFile)
            }
        }
        return userInfoRemoteCache
    }
}