package org.jl.bastion.cache.util

import io.micronaut.serde.ObjectMapper
import org.infinispan.commons.dataconversion.MediaType
import org.infinispan.commons.io.ByteBuffer
import org.infinispan.commons.io.ByteBufferImpl
import org.infinispan.commons.marshall.AbstractMarshaller
import org.jl.bastion.cache.model.UserInfo
import org.slf4j.LoggerFactory
import java.io.IOException
import java.util.*

class CustomMarshaller: AbstractMarshaller() {

    private val logger = LoggerFactory.getLogger(CustomMarshaller::class.java)
    private val objectMapper = ObjectMapper.getDefault()

    override fun objectToBuffer(o: Any, estimatedSize: Int): ByteBuffer? {
        var s = o.toString()
        if (o is UserInfo) {
            s = "userinfo::" + objectMapper.writeValueAsString(o)
        }
        return ByteBufferImpl.create(Base64.getEncoder().encode(s.toString().toByteArray(Charsets.UTF_8)))
    }

    @Throws(IOException::class, ClassNotFoundException::class)
    override fun objectFromByteBuffer(buf: ByteArray?, offset: Int, length: Int): Any? {
        return buf?.map {
            var s = String(Base64.getDecoder().decode(buf), Charsets.UTF_8)
            if (s.startsWith("userinfo::")){
                s = s.replaceFirst("userinfo::", "")
                return objectMapper.readValue(s, UserInfo::class.java)
            }
            return  s
        }
    }

    override fun isMarshallable(o: Any?): Boolean {
        return o is String || o is UserInfo
    }

    override fun mediaType(): MediaType? {
        return MediaType.TEXT_PLAIN
    }

}